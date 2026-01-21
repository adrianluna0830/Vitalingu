import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_translation.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';
import 'package:vitalingu/repository/topic_translations_repository.dart';

@injectable
class TranslationsUsecase {
  final TopicTranslationsRepository _topicTranslationsRepository;
  final GrammarTopicsRepository _grammarTopicsRepository;

  TranslationsUsecase({required TopicTranslationsRepository topicTranslationsRepository, required GrammarTopicsRepository grammarTopicsRepository}) : _topicTranslationsRepository = topicTranslationsRepository, _grammarTopicsRepository = grammarTopicsRepository;

  Future<List<TopicTranslation>> getTopics(Language native, Language target) async
  {
    List<TopicTranslation> translations = [];
    final targetTopics = await _grammarTopicsRepository.getAllGrammarTopics(target);
    for (var topic in targetTopics) {
      final translation = await _topicTranslationsRepository.getTranslations(topic.id, native);
      if(translation == null) throw Exception('Translation not found for topicId: ${topic.id} and language: ${native.bcp47}');
      translations.add(translation);
    }

    return translations;
  }
}