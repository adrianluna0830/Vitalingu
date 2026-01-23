import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
class UserTopicProgress {
  int? id;
  int topicId;
  double topicMastery;
  TopicLearningStatus topiclearningStatus;

  UserTopicProgress({
    this.id,
    required this.topicId,
    this.topicMastery = 0.0,
    this.topiclearningStatus = TopicLearningStatus.notStarted,
  });

  Map<String, dynamic> toJson() {
    return {
      'topicId': topicId,
      'topicMastery': topicMastery,
      'topiclearningStatus': topiclearningStatus.name,
    };
  }

  factory UserTopicProgress.fromJson(Map<String, dynamic> json, int id) {
    return UserTopicProgress(
      id: id,
      topicId: json['topicId'],
      topicMastery: json['topicMastery'],
      topiclearningStatus: TopicLearningStatus.values.byName(json['topiclearningStatus']),
    );
  }
}
