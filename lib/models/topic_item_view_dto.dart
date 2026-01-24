import 'package:flutter/material.dart';

class TopicItemViewDTO {
  final String title;
  final String level;
  final String status;
  final bool isCompleted;
  final bool isSelected;
  final Color color;

  TopicItemViewDTO(
    this.title,
    this.level,
    this.status,
    this.isCompleted,
    this.isSelected,
    this.color,
  );
}
