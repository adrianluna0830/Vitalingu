import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/widgets/chat_messages_list_widget.dart';
import 'package:vitalingu/features/chat/view_models/chat_view_model.dart';
import 'package:vitalingu/core/widgets/message_input_bottom_bar_widget.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final vm = getIt<ChatViewModel>();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: ChatMessagesListWidget(vm.messagesSignal.watch(context)),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: MessageInputBottomBarWidget(onSend: (message) {
          vm.sendMessage(message);
        }, canType: true),
      ),
    );
  }
}
