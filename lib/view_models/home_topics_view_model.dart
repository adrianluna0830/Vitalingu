import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/user_app_settings.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';

@injectable
class HomeTopicsViewModel {
  final GrammarTopicsRepository grammarTopicsRepository;
  final TargetLanguageSignal targetLanguage;

  HomeTopicsViewModel({
    required this.grammarTopicsRepository,
    required this.targetLanguage,
  });

  Future<List<GrammarTopic>> getTopics() async {
    return grammarTopicsRepository.getAllGrammarTopics(targetLanguage.value);
  }
}
