import 'package:flutter/material.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';

class TopicItemData {
  final String title;
  final CEFR level;
  final TopicLearningStatus status;
  final int topicId;
  final bool isSelected;

  TopicItemData(
    this.title,
    this.level,
    this.status,
    this.topicId,
    this.isSelected,
  );

  TopicItemData copyWith({
    String? title,
    CEFR? level,
    TopicLearningStatus? status,
    int? topicId,
    bool? isSelected,
    Color? color,
  }) {
    return TopicItemData(
      title ?? this.title,
      level ?? this.level,
      status ?? this.status,
      topicId ?? this.topicId,
      isSelected ?? this.isSelected,
    );
  }
}