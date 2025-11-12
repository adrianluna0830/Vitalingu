import 'package:hive_ce/hive.dart';
import 'package:vitalingu/models/app_settings_persistent.dart';

@GenerateAdapters([
  AdapterSpec<AppSettingsPersistent>(),
])
part 'hive_adapters.g.dart';
