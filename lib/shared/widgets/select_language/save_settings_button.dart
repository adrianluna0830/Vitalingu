import 'package:flutter/material.dart';

class SaveSettingsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final ButtonStyle? style;

  const SaveSettingsButton({
    super.key,
    required this.onPressed,
    this.label = 'Save Settings',
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(label),
    );
  }
}
