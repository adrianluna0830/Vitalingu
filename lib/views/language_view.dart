import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/widgets/ai_selectable_text.dart';

@RoutePage()
class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final TextEditingController _wordController = TextEditingController();

  @override
  void dispose() {
    _wordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language View'),
      ),
      body: Center(
        child: AiSelectableText(
          text: 'Hallo!\nIch heiße Lukas und ich komme aus Deutschland.\nIch wohne in Berlin und ich arbeite in einem Café.\nMeine Hobbys sind Musik hören und Fußball spielen.\nIch habe eine Schwester. Sie heißt Anna.\nAm Wochenende treffe ich meine Freunde. Wir gehen oft im Park spazieren.',
        ),
      ),
    );
  }
}
