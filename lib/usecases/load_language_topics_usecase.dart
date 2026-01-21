import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/gen/assets.gen.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_translation.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';
import 'package:vitalingu/repository/topic_translations_repository.dart';

@injectable
class LoadLanguageTopicsUsecase {
  final GrammarTopicsRepository _grammarTopicsRepository;
  final TopicTranslationsRepository _topicTranslationsRepository;

  LoadLanguageTopicsUsecase(this._grammarTopicsRepository,
      this._topicTranslationsRepository);

  Future<void> loadTopics() async {

    for (var languagePath in Assets.languages.values) {
      final jsonString = await rootBundle.loadString(languagePath);
      final jsonData = json.decode(jsonString);

      final languageString = jsonData['language'] as String;
      final language =
          Language.values.firstWhere((e) => e.name == languageString);
      final topics = jsonData['topics'] as List;

      for (var topicData in topics) {
        final newTopic = GrammarTopic(
          topicTitle: topicData['topicTitle'] as String,
          cefrLevel:
              CEFR.values.firstWhere((e) => e.name == topicData['cefrLevel']),
          language: language,
          topicLearningOrder: topicData['learningOrder'] as int,
        );

        final createdTopic =
            await _grammarTopicsRepository.addGrammarTopic(newTopic);

        if (createdTopic != null) {
          final translations = topicData['translations'] as List;
          for (var translationData in translations) {
            final translationLanguageString =
                translationData['language'] as String;
            final translationLanguage = Language.values
                .firstWhere((e) => e.name == translationLanguageString);

            final newTranslation = TopicTranslation(
                topicId: createdTopic.id,
                translationLanguage: translationLanguage,
                translation: translationData['translation'] as String);

            await _topicTranslationsRepository.addTranslation(newTranslation);
          }
        }
      }
    }
  }
}
