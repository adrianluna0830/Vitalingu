import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/gen/assets.gen.dart';
import 'package:vitalingu/core/models/language/learning_unit.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';

@singleton
class LearningUnitsRepository {
  final Map<Language, List<LearningUnit>> _topicsCache = {};

  LearningUnitsRepository._();

  @FactoryMethod(preResolve: true)
  static Future<LearningUnitsRepository> create() async {
    final repository = LearningUnitsRepository._();
    await repository._preload();
    return repository;
  }

  Future<void> _preload() async {
    await _loadTopics(Language.English, Assets.languages.english);
    await _loadTopics(Language.Spanish, Assets.languages.spanish);
  }

  Future<void> _loadTopics(Language language, String assetPath) async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final List<dynamic> jsonList = json.decode(jsonString);
      final topics = jsonList.map((j) => LearningUnit.fromJson(j)).toList();
      _topicsCache[language] = topics;
    } catch (e) {
      // In case of error (e.g. file not found during dev), initialize with empty list
      print('Error loading topics for $language: $e');
      _topicsCache[language] = [];
    }
  }

  List<LearningUnit> getAll(Language language) {
    return _topicsCache[language] ?? [];
  }

  LearningUnit? get(String unitCode) {
    for (var topics in _topicsCache.values) {
      for (var topic in topics) {
        if (topic.unitCode == unitCode) {
          return topic;
        }
      }
    }
    return null;
  }
}
