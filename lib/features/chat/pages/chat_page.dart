import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/widgets/chat_messages_list_widget.dart';
import 'package:vitalingu/features/chat/widgets/a_i_message_tools.dart';
import 'package:vitalingu/features/chat/view_models/chat_view_model.dart';
import 'package:vitalingu/features/chat/widgets/chat_bottom_panel.dart';

enum AIMessageAction { translation, segmentedTranslation, doubt, wordInfo }

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final vm = getIt<ChatViewModel>();
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Page')),
      body: Column(
        children: [
          Expanded(
            child: ChatMessagesListWidget(vm.messagesSignal.watch(context), onMessageTap: (message) {
              _expanded = !_expanded;
              setState(() {
                
              });
              },),
          ),
          ChatBottomPanel(
            expanded: _expanded,
            onToggleExpanded: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            onSend: (message) {
              vm.sendMessage(message);
            },
            expandableContent: AIMessageTools(
              onTranslation: () {
                print('Translation selected');
              },
              onSegmentedTranslation: () {
                print('Segmented Translation selected');
              },
              onDoubt: () {
                print('Doubt selected');
              },
              onWordInfo: () {
                print('Word Info selected');
              },
            ),
          ),
        ],
      ),
    );
  }
}
