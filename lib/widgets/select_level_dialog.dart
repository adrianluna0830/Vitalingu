import 'package:flutter/material.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';

class SelectLevelDialog extends StatelessWidget {
  const SelectLevelDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Level'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: CEFR.values.map((level) {
            return ListTile(
              title: Text(level.name),
              onTap: () {
                Navigator.of(context).pop(level);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
