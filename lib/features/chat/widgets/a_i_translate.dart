import 'package:flutter/material.dart';

class AITranslate extends StatelessWidget {
  final String translation;
  final String content;

  const AITranslate({
    super.key,
    required this.translation,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('Original: $content'),
        const SizedBox(height: 10),
        Text('Translation: $translation'),
      ],
    );
  }
}
