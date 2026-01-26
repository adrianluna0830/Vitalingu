import 'package:flutter/material.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/unit_learning_status_enum.dart';

class UnitItemData {
  final String title;
  final CEFR level;
  final UnitLearningStatus status;
  final String unitCode;
  final bool isSelected;

  UnitItemData(
    this.title,
    this.level,
    this.status,
    this.unitCode,
    this.isSelected,
  );

  UnitItemData copyWith({
    String? title,
    CEFR? level,
    UnitLearningStatus? status,
    String? unitCode,
    bool? isSelected,
    Color? color,
  }) {
    return UnitItemData(
      title ?? this.title,
      level ?? this.level,
      status ?? this.status,
      unitCode ?? this.unitCode,
      isSelected ?? this.isSelected,
    );
  }
}