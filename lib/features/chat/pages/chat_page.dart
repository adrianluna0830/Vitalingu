import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/features/chat/widgets/expandable_animated_container.dart';
import 'package:vitalingu/features/chat/widgets/chat_bottom_inputs.dart';
import 'package:vitalingu/features/chat/widgets/chat_messages.dart';
import 'package:vitalingu/features/chat/view_models/chat_view_model.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final vm = getIt<ChatViewModel>();

  Widget buildInputs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ChatBottomInputs(
        onSend: (message) {
          vm.sendMessage(message);
        },
        canType: true,
        onChat: () {
                        vm.test();

        },
      ),
    );
  }

  Widget buildChatMessages(BuildContext context) {
    return Expanded(
      child: Watch((context) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 7.0),
          child: ChatMessages(
            vm.messagesSignal.value,
            onMessageTap: (messageId) {
            },
            showIsTyping: vm.showIsTypingSignal.watch(context),
          ),
        );
      }),
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
            ExpandableAnimatedContainer(
              isExpanded: false,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 14.0,
                  right: 14.0,
                  top: 14.0,
                  bottom: 4,
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: const Color.fromARGB(
                        255,
                        193,
                        193,
                        193,
                      ), // Cambia 'Colors.blue' por el color deseado
                      width: 1.25, // Cambia '2.0' por el grosor deseado
                    ),
                  ),
                  child: const Text(
                    'Contenido Interno',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            buildInputs(context),
          ],
        ),
      ),
    );
  }
}
