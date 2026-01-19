import 'package:injectable/injectable.dart';
import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/topic_translation.dart';
import 'package:vitalingu/models/language/user_data/user_topic_progress.dart';
import 'package:path_provider/path_provider.dart';
@module
abstract class IsarModule {
  @preResolve
  Future<Isar> provideIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar =  Isar.open(
      schemas: [GrammarTopicSchema, UserTopicProgressSchema, TopicTranslationSchema],
      directory: dir.path,
    );
    return isar;
  }

}