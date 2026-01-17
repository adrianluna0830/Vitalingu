import 'package:hive_ce/hive_ce.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/models/language/user_data/grammar_topic_user_data.dart';
import 'package:vitalingu/models/language/user_data/user_language_skills_data.dart';
@GenerateAdapters(
  [
  AdapterSpec<SupportedLanguagesBcp47>(),
  AdapterSpec<CEFR>(),
  AdapterSpec<GrammarTopic>(),
  AdapterSpec<UserLanguageSkillsData>(),
  AdapterSpec<GrammarTopicUserData>(),
  ]
)


part 'hive_adapters.g.dart';