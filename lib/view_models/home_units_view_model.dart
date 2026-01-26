import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_core.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/learning_unit.dart';
import 'package:vitalingu/models/language/unit_learning_status_enum.dart';
import 'package:vitalingu/models/language/user_data/user_unit_data.dart';
import 'package:vitalingu/models/unit_item_data.dart';
import 'package:vitalingu/models/unit_item_view_dto.dart';
import 'package:vitalingu/models/user_app_settings.dart';
import 'package:vitalingu/repository/learning_units_repository.dart';
import 'package:vitalingu/repository/user_unit_data_repository.dart';

@injectable
class HomeUnitsViewModel {
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;
  final LearningUnitsRepository _learningUnitsRepository;
  final UserUnitDataRepository _userUnitDataRepository;

  HomeUnitsViewModel(
    this.nativeLanguageSignal,
    this.targetLanguageSignal,
    this._learningUnitsRepository,
    this._userUnitDataRepository,
  ) {
    _loadTopicCards();
    _registerSelectableEffect();
    _registerLanguageChangedEffects();
  }

  final isSelectable = signal<bool>(false);

  final ListSignal<UnitItemData> _topicsSignal = listSignal<UnitItemData>([]);

  late final convertedTopics = computed(() {
    return _topicsSignal.value.map((topic) {
      return UnitItemViewDTO(
        topic.title,
        topic.level.name,
        topic.status.description(nativeLanguageSignal.value),
        topic.status == UnitLearningStatus.mastered,
        topic.isSelected,
        _getColorForCefr(topic.level),
      );
    }).toList();
  });

  late final statusNotStartedText = computed(() =>
      UnitLearningStatus.notStarted.description(nativeLanguageSignal.value));
  late final statusLearningText = computed(() =>
      UnitLearningStatus.learning.description(nativeLanguageSignal.value));
  late final statusReviewingText = computed(() =>
      UnitLearningStatus.reviewing.description(nativeLanguageSignal.value));
  late final statusMasteredText = computed(() =>
      UnitLearningStatus.mastered.description(nativeLanguageSignal.value));

  EffectCleanup? _selectableEffect;
  EffectCleanup? _targetLanguageEffect;

  void dispose() {
    _selectableEffect?.call();
    _targetLanguageEffect?.call();
  }

  void updateStatus(int index) async {
    final topic = _topicsSignal[index];
    final newStatus = _getNextStatus(topic.status);
    await _updateTopicStatus(topic.unitCode, newStatus);
    _topicsSignal[index] = topic.copyWith(status: newStatus);
  }

  Future<void> _updateTopicStatus(
      String unitCode, UnitLearningStatus newStatus) async {
    final userUnitData = await _userUnitDataRepository.getOrCreate(unitCode);
    userUnitData.topicLearningStatus = newStatus;
    await _userUnitDataRepository.update(userUnitData);
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
      _explainTopic(_topicsSignal[index].unitCode);
    }
  }

  void updateStatusForSelectedTopics(UnitLearningStatus newStatus) async {
    final selectedTopics =
        _topicsSignal.where((topic) => topic.isSelected).toList();
    if (selectedTopics.isEmpty) {
      isSelectable.value = false;
      return;
    }

    for (final topic in selectedTopics) {
      await _updateTopicStatus(topic.unitCode, newStatus);
      final index =
          _topicsSignal.indexWhere((t) => t.unitCode == topic.unitCode);
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
          topic.unitCode,
          UnitLearningStatus.mastered,
        );
        _topicsSignal[i] = topic.copyWith(
          status: UnitLearningStatus.mastered,
        );
      }
    }
  }

  void _explainTopic(String unitCode) {
    // TODO: Implement explanation navigation
  }

  UnitLearningStatus _getNextStatus(UnitLearningStatus currentStatus) {
    final allStatuses = UnitLearningStatus.values;
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

    final learningUnits = _learningUnitsRepository.getAll(targetLang);
    final unitCodes = learningUnits.map((e) => e.unitCode).toList();

    learningUnits.sort((a, b) => a.unitLearningOrder.compareTo(b.unitLearningOrder));

    final userUnitDataList =
        await _userUnitDataRepository.getOrCreateMany(unitCodes);
    final userUnitDataMap = {
      for (var item in userUnitDataList) item.unitCode: item
    };

    _topicsSignal.clear();
    final newTopics = <UnitItemData>[];

    for (var grammarTopic in learningUnits) {
      final userUnitData = userUnitDataMap[grammarTopic.unitCode] ??
          UserUnitData(unitCode: grammarTopic.unitCode);

      final title = grammarTopic.translations[nativeLang];
      if (title == null) {
        throw Exception(
            'Missing translation for topic ${grammarTopic.unitCode} in language ${nativeLang.name}');
      }

      newTopics.add(
        UnitItemData(
          title,
          grammarTopic.cefrLevel,
          userUnitData.topicLearningStatus,
          grammarTopic.unitCode,
          false,
        ),
      );
    }
    _topicsSignal.addAll(newTopics);
  }
}
