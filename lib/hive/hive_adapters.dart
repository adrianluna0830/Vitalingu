import 'package:hive_ce/hive.dart';
import 'package:vitalingu/models/app_settings_persistent.dart';
import 'package:vitalingu/models/language_session_settings_persistent.dart';
import 'package:vitalingu/language/language.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<AppSettingsPersistent>(),
  AdapterSpec<LanguageSessionSettingsPersistent>(),
  AdapterSpec<Language>(),
])
void _registerAdapters() {}