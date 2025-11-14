import 'package:hive_ce/hive.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/language/language.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<AppSettings>(),
  AdapterSpec<LanguageSettings>(),
  AdapterSpec<Language>(),
])
void _registerAdapters() {}