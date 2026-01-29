import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/learning_unit.dart';
import 'package:vitalingu/view_models/chat_view_model.dart';
import 'package:vitalingu/widgets/chat_messages_list_widget.dart';
import 'package:vitalingu/widgets/message_input_bottom_bar_widget.dart';


@RoutePage()
class ChatPage extends StatefulWidget {
  final LearningUnit learningUnit;
  const ChatPage({super.key, required this.learningUnit});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final vm = getIt<ChatViewModel>();

  @override
  void initState() {
    super.initState();
    vm.initiateConversation(widget.learningUnit);
  }
  @override
  Widget build(BuildContext context) {
    final conversation = vm.aiClientChat.watch(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 192, 192, 192).withOpacity(0.57), 
        title: Text(vm.getUnitTitle(widget.learningUnit)),
      ),
      body: Center(
        child: ChatMessagesListWidget(conversation),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: MessageInputBottomBarWidget(onSend: (message) {
          vm.sendMessage(message);
        }, canType: vm.canType.watch(context)),
      ),
    );
  }
}
