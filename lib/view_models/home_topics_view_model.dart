import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_core.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
import 'package:vitalingu/models/language/user_data/user_topic_data.dart';
import 'package:vitalingu/models/topic_item_data.dart';
import 'package:vitalingu/models/topic_item_view_dto.dart';
import 'package:vitalingu/models/user_app_settings.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';
import 'package:vitalingu/repository/user_topic_data_repository.dart';

@injectable
class HomeTopicsViewModel {
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;
  final GrammarTopicsRepository _grammarTopicsRepository;
  final UserTopicDataRepository _userTopicDataRepository;

  HomeTopicsViewModel(
    this.nativeLanguageSignal,
    this.targetLanguageSignal,
    this._grammarTopicsRepository,
    this._userTopicDataRepository,
  ) {
    _loadTopicCards();
    _registerSelectableEffect();
    _registerLanguageChangedEffects();
  }

  final isSelectable = signal<bool>(false);

  final ListSignal<TopicItemData> _topicsSignal = listSignal<TopicItemData>([]);

  late final convertedTopics = computed(() {
    return _topicsSignal.value.map((topic) {
      return TopicItemViewDTO(
        topic.title,
        topic.level.name,
        topic.status.description(nativeLanguageSignal.value),
        topic.status == TopicLearningStatus.mastered,
        topic.isSelected,
        _getColorForCefr(topic.level),
      );
    }).toList();
  });

  late final statusNotStartedText = computed(() =>
      TopicLearningStatus.notStarted.description(nativeLanguageSignal.value));
  late final statusLearningText = computed(() =>
      TopicLearningStatus.learning.description(nativeLanguageSignal.value));
  late final statusReviewingText = computed(() =>
      TopicLearningStatus.reviewing.description(nativeLanguageSignal.value));
  late final statusMasteredText = computed(() =>
      TopicLearningStatus.mastered.description(nativeLanguageSignal.value));

  EffectCleanup? _selectableEffect;
  EffectCleanup? _targetLanguageEffect;

  void dispose() {
    _selectableEffect?.call();
    _targetLanguageEffect?.call();
  }

  void updateStatus(int index) async {
    final topic = _topicsSignal[index];
    final newStatus = _getNextStatus(topic.status);
    await _updateTopicStatus(topic.topicCode, newStatus);
    _topicsSignal[index] = topic.copyWith(status: newStatus);
  }

  Future<void> _updateTopicStatus(
      String topicCode, TopicLearningStatus newStatus) async {
    final userTopicData = await _userTopicDataRepository.getOrCreate(topicCode);
    userTopicData.topicLearningStatus = newStatus;
    await _userTopicDataRepository.update(userTopicData);
  }

  void onToggleSelect(int index) {
    isSelectable.value = !isSelectable.value;
    if (!isSelectable.value) return;
    final topic = _topicsSignal[index];
    _topicsSignal[index] = topic.copyWith(isSelected: true);
  }

  void onTopicTap(int index) {
    if (isSelectable.value == true) {
      final topic = _topicsSignal[index];
      _topicsSignal[index] = topic.copyWith(isSelected: !topic.isSelected);
    } else {
      _explainTopic(_topicsSignal[index].topicCode);
    }
  }

  void updateStatusForSelectedTopics(TopicLearningStatus newStatus) async {
    final selectedTopics =
        _topicsSignal.where((topic) => topic.isSelected).toList();
    if (selectedTopics.isEmpty) {
      isSelectable.value = false;
      return;
    }

    for (final topic in selectedTopics) {
      await _updateTopicStatus(topic.topicCode, newStatus);
      final index =
          _topicsSignal.indexWhere((t) => t.topicCode == topic.topicCode);
      if (index != -1) {
        _topicsSignal[index] = _topicsSignal[index].copyWith(status: newStatus);
      }
    }

    isSelectable.value = false;
  }

  Future<void> updateTopicStatusWithCEFR(CEFR selectedLevel) async {
    for (int i = 0; i < _topicsSignal.length; i++) {
      final topic = _topicsSignal[i];

      if (topic.level.level <= selectedLevel.level) {
        await _updateTopicStatus(
          topic.topicCode,
          TopicLearningStatus.mastered,
        );
        _topicsSignal[i] = topic.copyWith(
          status: TopicLearningStatus.mastered,
        );
      }
    }
  }

  void _explainTopic(String topicCode) {
    // TODO: Implement explanation navigation
  }

  TopicLearningStatus _getNextStatus(TopicLearningStatus currentStatus) {
    final allStatuses = TopicLearningStatus.values;
    final currentIndex = allStatuses.indexOf(currentStatus);
    final nextIndex = (currentIndex + 1) % allStatuses.length;
    return allStatuses[nextIndex];
  }

  void _registerSelectableEffect() {
    _selectableEffect = effect(() {
      final selectable = isSelectable.value;

      if (!selectable) {
        for (int i = 0; i < _topicsSignal.length; i++) {
          if (_topicsSignal[i].isSelected) {
            _topicsSignal[i] = _topicsSignal[i].copyWith(isSelected: false);
          }
        }
      }
    });
  }

  void _registerLanguageChangedEffects() {
    _targetLanguageEffect = effect(() {
      targetLanguageSignal.value;
      nativeLanguageSignal.value;
      _loadTopicCards();
    });
  }

  Color _getColorForCefr(CEFR level) {
    switch (level) {
      case CEFR.A1:
        return Colors.lightGreen;
      case CEFR.A2:
        return Colors.green;
      case CEFR.B1:
        return const Color.fromARGB(255, 95, 154, 255);
      case CEFR.B2:
        return const Color.fromARGB(255, 21, 96, 158);
      case CEFR.C1:
        return Colors.purpleAccent;
      case CEFR.C2:
        return Colors.deepPurple;
    }
  }

  Future<void> _loadTopicCards() async {
    final targetLang = targetLanguageSignal.value;
    final nativeLang = nativeLanguageSignal.value;

    final grammarTopics = _grammarTopicsRepository.getAll(targetLang);
    final topicCodes = grammarTopics.map((e) => e.topicCode).toList();

    grammarTopics.sort((a, b) => a.topicLearningOrder.compareTo(b.topicLearningOrder));

    final userTopicDataList =
        await _userTopicDataRepository.getOrCreateMany(topicCodes);
    final userTopicDataMap = {
      for (var item in userTopicDataList) item.topicCode: item
    };

    _topicsSignal.clear();
    final newTopics = <TopicItemData>[];

    for (var grammarTopic in grammarTopics) {
      final userTopicData = userTopicDataMap[grammarTopic.topicCode] ??
          UserTopicData(topicCode: grammarTopic.topicCode);

      final title = grammarTopic.translations[nativeLang];
      if (title == null) {
        throw Exception(
            'Missing translation for topic ${grammarTopic.topicCode} in language ${nativeLang.name}');
      }

      newTopics.add(
        TopicItemData(
          title,
          grammarTopic.cefrLevel,
          userTopicData.topicLearningStatus,
          grammarTopic.topicCode,
          false,
        ),
      );
    }
    _topicsSignal.addAll(newTopics);
  }
}
