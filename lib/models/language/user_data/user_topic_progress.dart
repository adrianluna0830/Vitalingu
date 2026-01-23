import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
class UserTopicProgress {
  int topicId;
  double topicMastery;
  TopicLearningStatus topiclearningStatus;
  UserTopicProgress({required this.topicId, required this.topicMastery, required this.topiclearningStatus});
}
