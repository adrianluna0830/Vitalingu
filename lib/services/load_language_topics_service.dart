import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/gen/assets.gen.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';
import 'package:vitalingu/services/private_app_service.dart';

@injectable
class LoadLanguageTopicsService {
  final PrivateAppService privateAppService;
  final GrammarTopicsRepository _grammarTopicsRepository;
  LoadLanguageTopicsService(
    this.privateAppService,
    this._grammarTopicsRepository,
  );

  Future<void> tryLoadTopics() async {
    if (await privateAppService.hasLoadedInitialData == true) return;

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
    await privateAppService.setHasLoadedInitialData(true);
  }
}
