import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/gen/assets.gen.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/models/private_settings.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';

@injectable
class LoadLanguageTopicsService {
  final HasLoadedDataSignal hasLoadedDataSignal;
  final GrammarTopicsRepository _grammarTopicsRepository;
  LoadLanguageTopicsService(
    this._grammarTopicsRepository, {required this.hasLoadedDataSignal}
  );

  Future<void> tryLoadTopics() async {
    if (hasLoadedDataSignal.value == true) return;

    for (var languagePath in Assets.languages.values) {
      final jsonString = await rootBundle.loadString(languagePath);
      final jsonData = json.decode(jsonString);

      final bcp47String = jsonData['bcp47'] as String;
      final bcp47 = SupportedLanguagesBcp47.values.firstWhere(
        (e) => e.name == bcp47String,
      );
      final topicDescriptions = jsonData['topicDescriptions'] as List;
      for (var topicData in topicDescriptions) {
        final topic = GrammarTopic(
          topicDescriptionId: topicData['topicDescriptionId'] as String,
          cefrLevel: CEFR.values.firstWhere(
            (e) => e.name == topicData['cefrLevel'],
          ),
          bcp47: bcp47,
          topicLearningOrder: topicData['topicLearningOrder'] as int,
        );

        await _grammarTopicsRepository.addItem(topic);
      }
    }
    hasLoadedDataSignal.value = true;
  }
}
