import 'package:flutter/material.dart';

class VoiceSelector extends StatelessWidget {
  final String title;
  final String? voiceCode;
  final List<String> availableVoices;
  final ValueChanged<String?> onVoiceChanged;
  final VoidCallback onPlayVoice;
  final TextStyle? titleStyle;
  final String dropdownLabel;
  final IconData playIcon;

  const VoiceSelector({
    super.key,
    required this.title,
    required this.voiceCode,
    required this.availableVoices,
    required this.onVoiceChanged,
    required this.onPlayVoice,
    this.titleStyle,
    String? dropdownLabel,
    this.playIcon = Icons.volume_up,
  }) : dropdownLabel = dropdownLabel ?? 'Select $title';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: titleStyle),
      subtitle: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              value: voiceCode,
              decoration: InputDecoration(
                labelText: dropdownLabel,
              ),
              items: availableVoices.map((voice) {
                return DropdownMenuItem(
                  value: voice,
                  child: Text(voice),
                );
              }).toList(),
              onChanged: onVoiceChanged,
            ),
          ),
          IconButton(
            icon: Icon(playIcon),
            onPressed: voiceCode == null ? null : onPlayVoice,
          ),
        ],
      ),
    );
  }
}

