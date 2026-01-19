import 'package:isar_plus/isar_plus.dart';
part 'user_topic_progress.g.dart';
@collection
class UserTopicProgress {
  @Id()
  int id = 0;
  double globalMastery = 0;
  List<double> currentLocalMasteryHistory = [];
  int topicId;
  bool isUnlocked = false;
  UserTopicProgress({required this.topicId});
}
