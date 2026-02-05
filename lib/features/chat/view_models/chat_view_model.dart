import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/models/ai/chat_conversation.dart';
import 'package:vitalingu/core/models/ai/chat_message.dart';
import 'package:vitalingu/core/models/error_handler.dart';
import 'package:vitalingu/core/models/ai/ai_client.dart';
import 'package:vitalingu/features/chat/model/chat_message_dto.dart';
import 'package:vitalingu/features/chat/model/messages_extra_data.dart';

@injectable
class ChatViewModel {
  final AiClient _aiClient;
  final ErrorHandler _errorHandler;
  ChatViewModel(this._aiClient, this._errorHandler);

  ChatConversation  _conversation = ChatConversation();

  final _messagesSignal = listSignal( <ChatMessageWidgetModel>[]);
  late final messagesSignal = computed(() {
    return _messagesSignal.toList();
  });

  final _extraDataDisplayStateSignal = signal<ExtraOptionsDisplayState>(EmptyOptionsState());
  
  Future<void> sendMessage(String content) async {
    _conversation.addUserMessage(content);

    final messageModel = ChatMessageWidgetModel.fromChatMessage(
      _conversation.allMessages.last
    );

    _messagesSignal.add(messageModel);

    // final result = await _aiClient.generateContent(
    //   content,
    //   outputJsonSchema: UserMessageExtraData.getJsonSchema(),
    // );

    // switch (result) {
    //   case Right(:final value):
    //     _conversation = _conversation..addModelMessage(value);
        
    //     final aiMessageModel = ChatMessageWidgetModel.fromChatMessage(
    //       _conversation.allMessages.last,1
    //     );
        

    //   case Left(:final error):
    //     _errorHandler.setError(error);
    // }
  }
}

sealed class ExtraOptionsDisplayState {}

class EmptyOptionsState extends ExtraOptionsDisplayState {}
class UserChatState extends ExtraOptionsDisplayState {}
class UserMessageExtraDataState extends ExtraOptionsDisplayState {
  final UserMessageExtraData extraData;
  UserMessageExtraDataState(this.extraData);
}

class AIMessageExtraDataState extends ExtraOptionsDisplayState {
  final AIMessageExtraData extraData;
  AIMessageExtraDataState(this.extraData);
}