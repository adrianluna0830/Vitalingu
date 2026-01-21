import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
part 'user_topic_progress.g.dart';
@collection
class UserTopicProgress {
  @Id()
  int id = 0;
  
  int topicId;
  double topicMastery;
  TopicLearningStatus topiclearningStatus;
  UserTopicProgress({required this.topicId, required this.topicMastery, required this.topiclearningStatus});
}
