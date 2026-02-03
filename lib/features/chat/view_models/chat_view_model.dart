import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/core/error_handler.dart';
import 'package:vitalingu/core/models/ai_client.dart';
import 'package:vitalingu/core/models/chat_conversation.dart';
import 'package:vitalingu/core/models/chat_message_dto.dart';
import 'package:vitalingu/core/models/result.dart';
import 'package:vitalingu/features/chat/model/messages_extra_data.dart';

@injectable
class ChatViewModel {
  final AiClient _aiClient;
  final ErrorHandler _errorHandler;
  ChatConversation _conversation = ChatConversation();

  ChatViewModel(this._aiClient, this._errorHandler);

  final _messagesSignal = listSignal<ChatMessageWidgetModel>([]);
  late final ReadonlySignal<List<ChatMessageWidgetModel>> computedMessages = _messagesSignal;

  final _extraDataDisplayStateSignal = Signal<MessageExtraDataDisplayState>(NoExtraDataState());
  late final ReadonlySignal<MessageExtraDataDisplayState> computedExtraDataDisplayState = _extraDataDisplayStateSignal;

  void selectMessageExtraData(int messageIndex) {
    _extraDataDisplayStateSignal.value = AIMessageExtraDataState(
      AIMessageExtraData(content: "Sample AI extra data for message $messageIndex"),
    );
  }

  void selectUserChat() {
    _extraDataDisplayStateSignal.value = UserChatState();
  }

  Future<void> sendMessage(String content) async {
    _conversation.addUserMessage(content);

    final messageModel = ChatMessageWidgetModel.fromChatMessage(
      _conversation.allMessages.last,
      _messagesSignal.length,
    );
    
    _messagesSignal.add(messageModel);

    final result = await _aiClient.generateContent(
      content,
      outputJsonSchema: UserMessageExtraData.getJsonSchema(),
    );

    switch (result) {
      case Right(:final value):
        _conversation = _conversation..addModelMessage(value);
        
        final aiMessageModel = ChatMessageWidgetModel.fromChatMessage(
          _conversation.allMessages.last,
          _messagesSignal.length,
        );
        
        _messagesSignal.add(aiMessageModel);

      case Left(:final error):
        _errorHandler.setError(error);
    }
  }

  void closeExtraDataDisplay() {
    _extraDataDisplayStateSignal.value = NoExtraDataState();
  }
}

sealed class MessageExtraDataDisplayState {}

class NoExtraDataState extends MessageExtraDataDisplayState {}
class UserChatState extends MessageExtraDataDisplayState {}
class UserMessageExtraDataState extends MessageExtraDataDisplayState {
  final UserMessageExtraData extraData;
  UserMessageExtraDataState(this.extraData);
}

class AIMessageExtraDataState extends MessageExtraDataDisplayState {
  final AIMessageExtraData extraData;
  AIMessageExtraDataState(this.extraData);
}