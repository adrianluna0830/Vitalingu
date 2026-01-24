import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_core.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
import 'package:vitalingu/models/topic_item_data.dart';
import 'package:vitalingu/models/topic_item_view_dto.dart';
import 'package:vitalingu/models/user_app_settings.dart';
import 'package:vitalingu/services/user_topic_data_service.dart';

@injectable
class HomeTopicsViewModel {
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;
  final UserTopicDataService _userTopicDataService;

  HomeTopicsViewModel(
    this.nativeLanguageSignal,
    this.targetLanguageSignal,
    this._userTopicDataService,
  ) {
    _loadTopicCards();
    _registerSelectableEffect();
    _registerTargetLanguageChangedEffect();
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

  EffectCleanup? _selectableEffect;


  void dispose() {
    _selectableEffect?.call();
  }



  void updateStatus(int index) {
    final topic = _topicsSignal[index];
    final newStatus = _getNextStatus(topic.status);
    _userTopicDataService.updateTopicStatus(topic.topicId, newStatus);
    _topicsSignal[index] = topic.copyWith(status: newStatus);
  }

  void onToggleSelect(int index) {
    isSelectable.value = !isSelectable.value;
    if(!isSelectable.value) return;
    final topic = _topicsSignal[index];
    _topicsSignal[index] = topic.copyWith(isSelected: true);
  }

  void onTopicTap(int index) {
    if(isSelectable.value == true) 
    {
      final topic = _topicsSignal[index];
      _topicsSignal[index] = topic.copyWith(isSelected: !topic.isSelected);
    }
    else {
      _explainTopic(_topicsSignal[index].topicId);
    }

  }

  void updateStatusForSelectedTopics(TopicLearningStatus newStatus) async {
    final selectedTopics = _topicsSignal.where((topic) => topic.isSelected).toList();
    if (selectedTopics.isEmpty) {
      isSelectable.value = false;
      return;
    }

    for (final topic in selectedTopics) {
      await _userTopicDataService.updateTopicStatus(topic.topicId, newStatus);
      final index = _topicsSignal.indexWhere((t) => t.topicId == topic.topicId);
      _topicsSignal[index] = _topicsSignal[index].copyWith(status: newStatus);
      
    }

    isSelectable.value = false;
  }

    Future<void> updateTopicStatusWithCEFR(CEFR selectedLevel) async {
    for (int i = 0; i < _topicsSignal.length; i++) {
      final topic = _topicsSignal[i];

      if (topic.level.level <= selectedLevel.level) {
        await _userTopicDataService.updateTopicStatus(
          topic.topicId,
          TopicLearningStatus.mastered,
        );
        _topicsSignal[i] = topic.copyWith(
          status: TopicLearningStatus.mastered,
        );
      }
    }
  }

  void _explainTopic(int topicId) {

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
  void _registerTargetLanguageChangedEffect() {
    _selectableEffect = effect(() {
      targetLanguageSignal.value;
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
    final grammarTopicsWithData = await _userTopicDataService
        .getGrammarTopicsWithDataSorted(targetLanguageSignal.value);

    _topicsSignal.clear();

    for (var (grammarTopic, userTopicData) in grammarTopicsWithData) {
      _topicsSignal.add(
        TopicItemData(
          grammarTopic.topicTitle,
          grammarTopic.cefrLevel,
          userTopicData.topicLearningStatus,
          grammarTopic.id!,
          false,
        ),
      );
    }
  }

}
