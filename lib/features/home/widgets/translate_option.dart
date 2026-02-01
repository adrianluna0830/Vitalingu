import 'package:flutter/material.dart';

class TranslateOption extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const TranslateOption({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Always Translate'),
        const SizedBox(width: 10),
        Switch(value: value, onChanged: onChanged)
      ],
    );
  }
}
