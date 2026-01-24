import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/gen/assets.gen.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/language_enum.dart';

@singleton
class GrammarTopicsRepository {
  final Map<Language, List<GrammarTopic>> _topicsCache = {};

  GrammarTopicsRepository._();

  @FactoryMethod(preResolve: true)
  static Future<GrammarTopicsRepository> create() async {
    final repository = GrammarTopicsRepository._();
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
      final topics = jsonList.map((j) => GrammarTopic.fromJson(j)).toList();
      _topicsCache[language] = topics;
    } catch (e) {
      // In case of error (e.g. file not found during dev), initialize with empty list
      print('Error loading topics for $language: $e');
      _topicsCache[language] = [];
    }
  }

  List<GrammarTopic> getAll(Language language) {
    return _topicsCache[language] ?? [];
  }
}
