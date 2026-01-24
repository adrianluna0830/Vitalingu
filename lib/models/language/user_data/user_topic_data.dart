import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
class UserTopicData {
  int? id;
  int topicId;
  double topicMastery;
  TopicLearningStatus topicLearningStatus;

  UserTopicData({
    this.id,
    required this.topicId,
    this.topicMastery = 0.0,
    this.topicLearningStatus = TopicLearningStatus.notStarted,
  });

  Map<String, dynamic> toJson() {
    return {
      'topicId': topicId,
      'topicMastery': topicMastery,
      'topicLearningStatus': topicLearningStatus.name,
    };
  }

  factory UserTopicData.fromJson(Map<String, dynamic> json, int id) {
    return UserTopicData(
      id: id,
      topicId: json['topicId'],
      topicMastery: json['topicMastery'],
      topicLearningStatus: TopicLearningStatus.values.byName(json['topicLearningStatus']),
    );
  }

  UserTopicData copyWith({
    int? id,
    int? topicId,
    double? topicMastery,
    TopicLearningStatus? topicLearningStatus,
  }) {
    return UserTopicData(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      topicMastery: topicMastery ?? this.topicMastery,
      topicLearningStatus: topicLearningStatus ?? this.topicLearningStatus,
    );
  }
}
