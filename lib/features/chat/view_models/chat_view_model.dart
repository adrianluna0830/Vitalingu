import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/ai_client.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/core/models/language/learning_unit.dart';
import 'package:vitalingu/core/models/user_app_settings.dart';
import 'package:vitalingu/core/services/ai_client_chat.dart';


String unitExplanationPromptTemplate(String nativeLanguage, String targetLanguage, String unitTitle) {
  return """Explain what $unitTitle is and what it is used for in $targetLanguage. 
Write the explanation in $nativeLanguage.
Be concise, direct, and practical. Focus on its main uses and functions.
Write in plain text without any formatting, bullet points, or special characters.
Maximum 2-3 sentences.""";
}
@injectable
class ChatViewModel {
  final AiClient aiClient;
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;
  final AiClientChat aiClientChat = getIt<AiClientChat>(
    param1: null,
  );
  ChatViewModel(this.aiClient, this.nativeLanguageSignal, this.targetLanguageSignal);

  void initiateConversation(LearningUnit learningUnit)  {
    aiClientChat.addMessage(
      unitExplanationPromptTemplate(
        nativeLanguageSignal.value.name,
        targetLanguageSignal.value.name,
        getUnitTitle(learningUnit),
      ),
    );
  }


  String getUnitTitle(LearningUnit learningUnit) {
    return learningUnit.translations[Language.English]!;
  }

  void sendMessage(String message) {
    aiClientChat.addMessage(message);
  }

late final canType = computed(() {
  if (aiClientChat.value.allMessages.isEmpty || 
      aiClientChat.value.allMessages.last.isUserMessage) {

    return false;
  }
  return true;
});

}
