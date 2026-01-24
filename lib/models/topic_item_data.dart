import 'package:flutter/material.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';

class TopicItemData {
  final String title;
  final CEFR level;
  final TopicLearningStatus status;
  final String topicCode;
  final bool isSelected;

  TopicItemData(
    this.title,
    this.level,
    this.status,
    this.topicCode,
    this.isSelected,
  );

  TopicItemData copyWith({
    String? title,
    CEFR? level,
    TopicLearningStatus? status,
    String? topicCode,
    bool? isSelected,
    Color? color,
  }) {
    return TopicItemData(
      title ?? this.title,
      level ?? this.level,
      status ?? this.status,
      topicCode ?? this.topicCode,
      isSelected ?? this.isSelected,
    );
  }
}