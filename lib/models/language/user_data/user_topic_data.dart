import 'package:vitalingu/models/language/topic_learning_status_enum.dart';

class UserTopicData {
  int? id;
  String topicCode;
  double topicMastery;
  TopicLearningStatus topicLearningStatus;

  UserTopicData({
    this.id,
    required this.topicCode,
    this.topicMastery = 0.0,
    this.topicLearningStatus = TopicLearningStatus.notStarted,
  });

  Map<String, dynamic> toJson() {
    return {
      'topicCode': topicCode,
      'topicMastery': topicMastery,
      'topicLearningStatus': topicLearningStatus.name,
    };
  }

  factory UserTopicData.fromJson(Map<String, dynamic> json, int id) {
    return UserTopicData(
      id: id,
      topicCode: json['topicCode'],
      topicMastery: json['topicMastery'],
      topicLearningStatus:
          TopicLearningStatus.values.byName(json['topicLearningStatus']),
    );
  }

  UserTopicData copyWith({
    int? id,
    String? topicCode,
    double? topicMastery,
    TopicLearningStatus? topicLearningStatus,
  }) {
    return UserTopicData(
      id: id ?? this.id,
      topicCode: topicCode ?? this.topicCode,
      topicMastery: topicMastery ?? this.topicMastery,
      topicLearningStatus: topicLearningStatus ?? this.topicLearningStatus,
    );
  }
}
