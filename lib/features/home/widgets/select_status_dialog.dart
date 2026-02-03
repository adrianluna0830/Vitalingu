import 'package:flutter/material.dart';

class SelectStatusDialog extends StatelessWidget {
  final String notStartedText;
  final String learningText;
  final String reviewingText;
  final String masteredText;

  final VoidCallback onNotStarted;
  final VoidCallback onLearning;
  final VoidCallback onReviewing;
  final VoidCallback onMastered;

  const SelectStatusDialog({
    super.key,
    required this.notStartedText,
    required this.learningText,
    required this.reviewingText,
    required this.masteredText,
    required this.onNotStarted,
    required this.onLearning,
    required this.onReviewing,
    required this.onMastered,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Select Status'),
      children: [
        SimpleDialogOption(
          onPressed: onNotStarted,
          child: Text(notStartedText),
        ),
        SimpleDialogOption(
          onPressed: onLearning,
          child: Text(learningText),
        ),
        SimpleDialogOption(
          onPressed: onReviewing,
          child: Text(reviewingText),
        ),
        SimpleDialogOption(
          onPressed: onMastered,
          child: Text(masteredText),
        ),
      ],
    );
  }
}