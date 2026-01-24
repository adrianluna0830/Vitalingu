import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/preload_language_related_data/english.dart';
import 'package:vitalingu/models/preload_language_related_data/spanish.dart';
import 'package:vitalingu/models/private_settings.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';

@singleton
class LoadLanguageTopicsUseCase {
  final GrammarTopicsRepository _grammarTopicsRepository;
  final HasLoadedDataSignal _hasLoadedDataSignal;

  LoadLanguageTopicsUseCase(
    this._grammarTopicsRepository,
    this._hasLoadedDataSignal,
  );

  @PostConstruct(preResolve: true)
  Future<void> call() async {
    if (!_hasLoadedDataSignal.value) {
      await _grammarTopicsRepository.addGrammarTopics(englishGrammarTopics);
      
      _hasLoadedDataSignal.value = true;
      await _hasLoadedDataSignal.save(true);
    }
  }
}
