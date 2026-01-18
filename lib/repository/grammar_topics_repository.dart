import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/repository/base_hive_repository.dart';

@singleton
class GrammarTopicsRepository extends BaseHiveRepository<GrammarTopic> {
  GrammarTopicsRepository({required super.box});


  @FactoryMethod(preResolve: true)
  static Future<GrammarTopicsRepository> create() async {
    var box = await Hive.openBox<GrammarTopic>('GrammarTopics_box');
    return GrammarTopicsRepository(box: box);
  }

  List<GrammarTopic> topicByLanguage(SupportedLanguagesBcp47 language) {
    return box.values
        .where((topic) => topic.bcp47 == language)
        .toList();
  }

}