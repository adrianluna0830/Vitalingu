import 'package:flutter/material.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';

class SelectStatusDialog extends StatelessWidget {
  final List<TopicLearningStatus> statuses;
  final Language nativeLanguage;

  const SelectStatusDialog({super.key, required this.statuses, required this.nativeLanguage});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Status'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: statuses.map((status) {
            return ListTile(
              title: Text(status.description(nativeLanguage)),
              onTap: () {
                Navigator.of(context).pop(status);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
