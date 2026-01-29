import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/ai_client.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/core/models/language/learning_unit.dart';
import 'package:vitalingu/core/models/private_settings.dart';
import 'package:vitalingu/features/learning/models/prompts/unit_explanation_promts.dart';
import 'package:vitalingu/core/models/user_app_settings.dart';

@injectable
class UnitExplanationPageViewModel {
  final AiClient aiClient;
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;
  final AiClient aiClientChat;
  
  final AsyncSignal<String> explanation = asyncSignal(AsyncState.loading());

  UnitExplanationPageViewModel(
    this.aiClient, 
    this.nativeLanguageSignal, 
    this.targetLanguageSignal, 
    this.aiClientChat
  );

  Future<void> fetchExplanation(LearningUnit unit) async {
    final cache = await getIt.getAsync<UnitExplanationCacheSignal>(param1: unit.unitCode);
    if(cache.value != null) {
      print("Using cached explanation for unit ${cache.value}");
      explanation.value = AsyncState.data(cache.value!);
      return;
    }
    final response = await aiClient.sendMessage(unitExplanationPrompt(
      topicLanguage: nativeLanguageSignal.value.name,
      explanationLanguage: targetLanguageSignal.value.name,
      topic: unit.translations[Language.English]!,
    ));
    final designResponse = await aiClient.sendMessage(unitExplanationDesignPrompt(content: response));
    explanation.value = AsyncState.data(designResponse);
    cache.value = designResponse;
  }
}
