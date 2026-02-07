import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/models/ai/chat_conversation.dart';
import 'package:vitalingu/core/models/error_handler.dart';
import 'package:vitalingu/core/models/ai/ai_client.dart';
import 'package:vitalingu/features/chat/widgets/extra_options_display_state.dart';
import 'package:vitalingu/features/chat/model/chat_message_dto.dart';
import 'package:vitalingu/features/chat/model/messages_extra_data.dart';

@injectable
class ChatViewModel {
  final AiClient _aiClient;
  final ErrorHandler _errorHandler;

  ChatViewModel(this._aiClient, this._errorHandler);

  // Private fields
  ChatConversation _conversation = ChatConversation();
  final _messagesSignal = listSignal(<ChatMessageWidgetModel>[]);
  final _userIsTypingSignal = signal<bool>(false);
  final _expanded = signal<bool>(false);
  final _extraDataDisplayStateSignal = signal<ExtraOptionsDisplayState>(
    EmptyOptionsState(),
  );
  final _showIsTypingSignal = signal<bool>(false);
  final _userMessageExtraData = signalContainer<UserMessageExtraData, int>(
    (int index) => signal(UserMessageExtraData(null, null)),
    cache: true,
  );
  final _aiMessageExtraData = signalContainer<AIMessageExtraData, int>(
    (int index) => signal(AIMessageExtraData()),
    cache: true,
  );

  void setUserIsTyping(bool hasFocus) {
    _userIsTypingSignal.value = hasFocus;
  }

  late final messagesSignal = computed(() => _messagesSignal.toList());
  late final userIsTypingSignal = computed(() => _userIsTypingSignal.value);
  late final expanded = computed(() => _expanded.value);
  late final extraDataDisplayStateSignal = computed(
    () => _extraDataDisplayStateSignal.value,
  );
  late final showIsTypingSignal = computed(() => _showIsTypingSignal.value);

  // Public methods
  void selectMessage(int index) {
    final message = _conversation.allMessages[index];
    if (!message.isUserMessage) {
      _extraDataDisplayStateSignal.value = AIMessageExtraDataState(
        _aiMessageExtraData(index).value,
        index,
      );
    } else {
      _extraDataDisplayStateSignal.value = UserMessageExtraDataState(
        _userMessageExtraData(index).value,
        index,
      );
    }
    _expanded.value = true;
  }

  Future<void> getTranslation(int messageIndex) async {
    await Future.delayed(Duration(milliseconds: 500));

    final extraDataSignal = _aiMessageExtraData(messageIndex);
    final currentData = extraDataSignal.value;

    final updatedData = AIMessageExtraData();
    updatedData.translation =
        "Traducción simulada para el mensaje $messageIndex";

    extraDataSignal.value = updatedData;
  }

  Signal<UserMessageExtraData> getUserMessageExtraData(int index) {
    return _userMessageExtraData(index);
  }

  Signal<AIMessageExtraData> getAIMessageExtraData(int index) {
    return _aiMessageExtraData(index);
  }

  void closeExtraDataDisplay() {
    _expanded.value = false;
  }

  void startUserChat() {
    _extraDataDisplayStateSignal.value = UserChatState();
    _expanded.value = true;
  }

  Future<void> sendMessage(String content) async {
    _conversation.addUserMessage(content);
    final messageModel = ChatMessageWidgetModel.fromChatMessage(
      _conversation.allMessages.last,
    );
    _messagesSignal.add(messageModel);
  }

  void dispose() {
    // ...existing code...
  }
}
