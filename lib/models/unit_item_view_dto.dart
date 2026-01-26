import 'package:flutter/material.dart';

class UnitItemViewDTO {
  final String title;
  final String level;
  final String status;
  final bool isCompleted;
  final bool isSelected;
  final Color color;

  UnitItemViewDTO(
    this.title,
    this.level,
    this.status,
    this.isCompleted,
    this.isSelected,
    this.color,
  );
}
