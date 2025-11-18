import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final String bcp47Code;
  final String nativeName;
  final VoidCallback onTap;
  final VoidCallback onSettingsTap;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final IconData settingsIcon;
  final double? settingsIconSize;

  const LanguageCard({
    super.key,
    required this.bcp47Code,
    required this.nativeName,
    required this.onTap,
    required this.onSettingsTap,
    this.titleStyle,
    this.subtitleStyle,
    this.settingsIcon = Icons.edit_outlined,
    this.settingsIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          nativeName,
          style: titleStyle,
        ),
        subtitle: Text(
          bcp47Code.toUpperCase(),
          style: subtitleStyle,
        ),
        trailing: IconButton(
          icon: Icon(settingsIcon, size: settingsIconSize),
          onPressed: onSettingsTap,
        ),
        onTap: onTap,
      ),
    );
  }
}

