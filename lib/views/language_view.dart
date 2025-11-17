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
          text: 'This is a sample text. Also another sample text.',
        ),
      ),
    );
  }
}
