import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/features/chat/widgets/analysis_option_button.dart';
import 'package:vitalingu/features/chat/pages/chat_page.dart';
import 'package:vitalingu/features/chat/widgets/user_message_option.dart';

class MessageAnalysisPanel extends StatefulWidget {
  const MessageAnalysisPanel({super.key});

  @override
  State<MessageAnalysisPanel> createState() => _MessageAnalysisPanelState();
}
class _MessageAnalysisPanelState extends State<MessageAnalysisPanel>
    with SignalsMixin {
  late final counter = createSignal(UserMessageOption.none);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: constraints.maxHeight * 0.25,
              decoration: BoxDecoration(
                color: Colors.blueGrey[300],
                borderRadius: BorderRadius.circular(15),
                
              ),
              padding: const EdgeInsets.all(12),  
              child: const Center(
                child: SingleChildScrollView(
                  child: Text(
                    'Extra data about the message would Extra data about the message would  Extra data about the message would  Extra data about the message would    Extra data about the message would  Extra data about the message would  Extra data about the message would be shown here. This is just a placeholder.',
                    style: TextStyle(color: Colors.black, fontSize: 17, fontStyle:  FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[500],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnalysisOptionButton(
                  text: 'Grammar',
                  icon: Icons.spellcheck,
                  isSelected: counter.value == UserMessageOption.grammar,
                  onPressed: () {
                    if (counter.value == UserMessageOption.grammar) {
                      counter.value = UserMessageOption.none;
                      return;
                    }
                    counter.value = UserMessageOption.grammar;
                  },
                ),
                SizedBox(width: 20),
                AnalysisOptionButton(
                  text: 'Fluency',
                  icon: Icons.chat_bubble_outline,
                  isSelected: counter.value == UserMessageOption.fluency,
                  onPressed: () {
                    if (counter.value == UserMessageOption.fluency) {
                      counter.value = UserMessageOption.none;
                      return;
                    }
                    counter.value = UserMessageOption.fluency;
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}