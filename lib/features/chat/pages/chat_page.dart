import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/chat_message_dto.dart';
import 'package:vitalingu/core/widgets/chat_bottom_inputs.dart';
import 'package:vitalingu/core/widgets/chat_messages.dart';
import 'package:vitalingu/features/chat/widgets/message_extra_data_display.dart';
import 'package:vitalingu/features/chat/widgets/user_extra_data_display.dart';
import 'package:vitalingu/features/chat/view_models/chat_view_model.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final vm = getIt<ChatViewModel>();

  Widget buildMessageExtraDataDisplay(BuildContext context) {
    return Watch(
      (context) {
        final state = vm.computedExtraDataDisplayState.value;
        
        return switch (state) {
          NoExtraDataState() => const SizedBox.shrink(),
          
          UserMessageExtraDataState(:final extraData) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: MessageExtraDataDisplay(
              onClose: vm.closeExtraDataDisplay,
              child: UserExtraDataDisplay(),
            ),
          ),
          
          AIMessageExtraDataState(:final extraData) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: MessageExtraDataDisplay(
              onClose: vm.closeExtraDataDisplay,
              child: Center(
                child: Text("AI Message Extra Data: ${extraData.content}"),
              ),
            ),
          ),
          
          UserChatState() => Padding(
            padding: const EdgeInsets.all(16.0),
            child: MessageExtraDataDisplay(
              onClose: vm.closeExtraDataDisplay,
              child: Center(child: Text("User Chat Extra Data")),
            ),
          ),
        };
      },
    );
  }

  Widget buildInputs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 13.0),
      child: ChatBottomInputs(
        onSend: (message) {},
        canType: true,
        onChat: () {
          vm.selectUserChat();
        },
      ),
    );
  }

  Widget buildChatMessages(BuildContext context) {
    return Watch(
      (context) {
        final messages = vm.computedMessages.value;
        
        return Expanded(
          child: ChatMessages(
            messages,
            onMessageTap: (messageId) {
              vm.selectMessageExtraData(messageId);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            buildChatMessages(context),
            buildMessageExtraDataDisplay(context),
            buildInputs(context),
          ],
        ),
      ),
    );
  }
}