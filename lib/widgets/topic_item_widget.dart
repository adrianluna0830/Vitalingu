import 'package:flutter/material.dart';

class TopicItemWidget extends StatelessWidget {
  final bool isCompleted;
  final bool isSelectable;
  final bool isSelected;
  final String title;
  final String level;
  final String status;
  final VoidCallback onStatusTap;
  final VoidCallback onTopicTap;
  final VoidCallback onLongTap;
  final Color levelColor;

  const TopicItemWidget({
    super.key,
    required this.isCompleted,
    required this.isSelectable,
    required this.isSelected,
    required this.title,
    required this.level,
    required this.status,
    required this.onTopicTap,
    required this.levelColor,
    required this.onLongTap, required this.onStatusTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongTap,
      leading: Text(
        level,
        style: TextStyle(color: levelColor, fontSize: 20),
      ),
      title: Text(title, style: const TextStyle(fontSize: 20)),
      subtitle: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              status,
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
            ),
          ),
          IconButton(onPressed: onStatusTap, icon: const Icon(Icons.edit)),
          const SizedBox(width: 8),
          SizedBox(
            width: 24, 
            child: isCompleted
                ? const Icon(Icons.check_circle_outline, color: Colors.black)
                : null,
          ),
        ],
      ),
      trailing: isSelectable
          ? Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
            )
          : null,
      onTap: onTopicTap,
    );
  }
}