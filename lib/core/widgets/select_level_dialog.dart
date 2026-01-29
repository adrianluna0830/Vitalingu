import 'package:flutter/material.dart';

class SelectLevelDialog extends StatelessWidget {
  final VoidCallback onA1;
  final VoidCallback onA2;
  final VoidCallback onB1;
  final VoidCallback onB2;

  const SelectLevelDialog({
    super.key,
    required this.onA1,
    required this.onA2,
    required this.onB1,
    required this.onB2,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Select Level'),
      children: [
        SimpleDialogOption(
          onPressed: onA1,
          child: const Text('A1'),
        ),
        SimpleDialogOption(
          onPressed: onA2,
          child: const Text('A2'),
        ),
        SimpleDialogOption(
          onPressed: onB1,
          child: const Text('B1'),
        ),
        SimpleDialogOption(
          onPressed: onB2,
          child: const Text('B2'),
        ),
      ],
    );
  }
}