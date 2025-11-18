import 'package:flutter/material.dart';

class SettingsSheetHeader extends StatelessWidget {
  final String languageName;
  final VoidCallback onClose;
  final TextStyle? titleStyle;
  final IconData closeIcon;

  const SettingsSheetHeader({
    super.key,
    required this.languageName,
    required this.onClose,
    this.titleStyle,
    this.closeIcon = Icons.close,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Settings for $languageName',
          style: titleStyle,
        ),
        const Spacer(),
        IconButton(
          onPressed: onClose,
          icon: Icon(closeIcon),
        ),
      ],
    );
  }
}

