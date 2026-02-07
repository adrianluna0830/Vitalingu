import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/features/chat/widgets/extra_options_display_state.dart';
import 'package:vitalingu/features/chat/widgets/chat_input_bar.dart';
import 'package:vitalingu/features/chat/widgets/chat_message_list.dart';
import 'package:vitalingu/features/chat/view_models/chat_view_model.dart';
import 'package:vitalingu/features/chat/widgets/expandable_bottom_panel.dart';
import 'package:vitalingu/features/chat/widgets/message_analysis_panel.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final vm = getIt<ChatViewModel>();

  Widget buildInputs(BuildContext context) {
    return TapRegion(
      groupId: 'bottom_panel_overlay',
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ChatInputBar(
            onSend: (message) {
              vm.sendMessage(message);
            },
            canType: true,
            onChat: () {
              vm.startUserChat();
            },
            onFocusStarted: () {
              vm.closeExtraDataDisplay();
            },
            onMic: () {},
          ),
        ),
      ),
    );
  }

  Widget buildChatMessages(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Watch((context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: ChatMessageList(
            vm.messagesSignal.value,
            tapRegionGroupId: 'bottom_panel_overlay',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            onMessageTap: (messageId) {
              vm.selectMessage(messageId);
            },
            showIsTyping: vm.showIsTypingSignal.watch(context),
            onLongMessageTap: (int value) {},
          ),
        );
      }),
    );
  }

  Widget buildExtraOptions(BuildContext ctx, double expandedHeight) {
    final state = vm.extraDataDisplayStateSignal.watch(ctx);

    final Widget child = switch (state) {
      EmptyOptionsState() => const SizedBox.shrink(key: ValueKey('empty')),
      UserChatState() => const SizedBox.shrink(key: ValueKey('user_chat')),
      UserMessageExtraDataState(:final index) => _buildUserMessageOptions(index),
      AIMessageExtraDataState(:final index) => _buildAIMessageOptions(index),
      _ => const SizedBox.shrink(), // Add a default case for the switch statement
    };

    return ExpandableBottomPanel(
      tapRegionGroupId: 'bottom_panel_overlay',
      isExpanded: vm.expanded.watch(ctx),
      expandedHeight: expandedHeight,
      onClose: vm.closeExtraDataDisplay,
      child: child,
    );
  }

  Widget _buildUserMessageOptions(int index) {
    return Watch(key: ValueKey('user_$index'), (context) {
      final extraData = vm.getUserMessageExtraData(index).watch(context);
      return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15, top: 10),
        child: MessageAnalysisPanel(),
      );
    });
  }

  Widget _buildAIMessageOptions(int index) {
    return Watch(key: ValueKey('ai_$index'), (context) {
      final extraData = vm.getAIMessageExtraData(index).watch(context);
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: MessageAnalysisPanel(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildChatMessages(context),
                buildExtraOptions(context, constraints.maxHeight * 0.5),
                buildInputs(context),
              ],
            );
          },
        ),
      ),
    );
  }
}
