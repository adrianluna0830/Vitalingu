// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sembast/sembast.dart' as _i310;
import 'package:sembast/sembast_io.dart' as _i156;
import 'package:sembast/utils/database_utils.dart' as _i854;
import 'package:vitalingu/app_router.dart' as _i641;
import 'package:vitalingu/models/ai_client.dart' as _i715;
import 'package:vitalingu/models/dio_module.dart' as _i31;
import 'package:vitalingu/models/gemini_ai_client.dart' as _i25;
import 'package:vitalingu/models/language_specific_settings.dart' as _i582;
import 'package:vitalingu/models/private_settings.dart' as _i806;
import 'package:vitalingu/models/sembast_module.dart' as _i228;
import 'package:vitalingu/models/shared_preferences_store.dart' as _i680;
import 'package:vitalingu/models/user_app_settings.dart' as _i70;
import 'package:vitalingu/repository/learning_units_repository.dart' as _i438;
import 'package:vitalingu/repository/user_unit_data_repository.dart' as _i186;
import 'package:vitalingu/services/ai_client_chat.dart' as _i547;
import 'package:vitalingu/view_models/chat_view_model.dart' as _i729;
import 'package:vitalingu/view_models/home_settings_view_model.dart' as _i764;
import 'package:vitalingu/view_models/home_units_view_model.dart' as _i342;
import 'package:vitalingu/view_models/startup/startup_introduction_view_model.dart'
    as _i377;
import 'package:vitalingu/view_models/startup/startup_level_configure_view_model.dart'
    as _i1048;
import 'package:vitalingu/view_models/startup/startup_native_language_view_model.dart'
    as _i75;
import 'package:vitalingu/view_models/startup/startup_target_language_view_model.dart'
    as _i731;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sembastModule = _$SembastModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i156.Database>(
      () => sembastModule.database,
      preResolve: true,
    );
    gh.factory<_i680.SharedPreferencesStore>(
      () => _i680.SharedPreferencesStore(),
    );
    gh.factory<_i680.EncryptedSharedPreferencesStore>(
      () => _i680.EncryptedSharedPreferencesStore(),
    );
    gh.singleton<_i641.AppRouter>(() => _i641.AppRouter());
    await gh.singletonAsync<_i438.LearningUnitsRepository>(
      () => _i438.LearningUnitsRepository.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i186.UserUnitDataRepository>(
      () => _i186.UserUnitDataRepository(gh<_i310.Database>()),
    );
    await gh.singletonAsync<_i70.GeminiApiKeySignal>(
      () => _i70.GeminiApiKeySignal.create(
        encryptedStore: gh<_i680.EncryptedSharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    gh.singleton<_i715.AiClient>(
      () => _i25.GeminiAiClient(gh<_i361.Dio>(), gh<_i70.GeminiApiKeySignal>()),
    );
    gh.factoryParam<_i547.AiClientChat, String?, dynamic>(
      (systemInstruction, _) =>
          _i547.AiClientChat.create(gh<_i715.AiClient>(), systemInstruction),
    );
    await gh.singletonAsync<_i806.HasLoadedDataSignal>(
      () => _i806.HasLoadedDataSignal.create(
        sharedPreferencesStore: gh<_i680.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i806.IsStartupCompletedSignal>(
      () => _i806.IsStartupCompletedSignal.create(
        sharedPreferencesStore: gh<_i680.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i70.NativeLanguageSignal>(
      () => _i70.NativeLanguageSignal.create(
        sharedPreferencesStore: gh<_i680.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i70.TargetLanguageSignal>(
      () => _i70.TargetLanguageSignal.create(
        sharedPreferencesStore: gh<_i680.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i70.StopTrackingAtRatioSignal>(
      () => _i70.StopTrackingAtRatioSignal.create(
        sharedPreferencesStore: gh<_i680.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    gh.factory<_i377.StartupIntroductionViewModel>(
      () =>
          _i377.StartupIntroductionViewModel(appRouter: gh<_i641.AppRouter>()),
    );
    gh.factory<_i1048.StartupLevelConfigureViewModel>(
      () => _i1048.StartupLevelConfigureViewModel(
        gh<_i641.AppRouter>(),
        gh<_i806.IsStartupCompletedSignal>(),
      ),
    );
    gh.factoryAsync<_i582.SpeakingSkillSignal>(
      () => _i582.SpeakingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i70.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i582.HearingSkillSignal>(
      () => _i582.HearingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i70.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i582.ListeningSkillSignal>(
      () => _i582.ListeningSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i70.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i582.WritingSkillSignal>(
      () => _i582.WritingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i70.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i582.HasStartedLanguage>(
      () => _i582.HasStartedLanguage.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i70.TargetLanguageSignal>(),
      ),
    );
    gh.factory<_i731.StartupTargetLanguageViewModel>(
      () => _i731.StartupTargetLanguageViewModel(
        gh<_i70.TargetLanguageSignal>(),
        gh<_i641.AppRouter>(),
        nativeLanguageSignal: gh<_i70.NativeLanguageSignal>(),
      ),
    );
    gh.factory<_i75.StartupNativeLanguageViewModel>(
      () => _i75.StartupNativeLanguageViewModel(
        gh<_i70.NativeLanguageSignal>(),
        gh<_i641.AppRouter>(),
      ),
    );
    gh.factory<_i342.HomeUnitsViewModel>(
      () => _i342.HomeUnitsViewModel(
        gh<_i70.NativeLanguageSignal>(),
        gh<_i70.TargetLanguageSignal>(),
        gh<_i438.LearningUnitsRepository>(),
        gh<_i186.UserUnitDataRepository>(),
        gh<_i641.AppRouter>(),
      ),
    );
    gh.factory<_i764.HomeSettingsViewModel>(
      () => _i764.HomeSettingsViewModel(
        gh<_i70.NativeLanguageSignal>(),
        gh<_i70.TargetLanguageSignal>(),
        gh<_i70.GeminiApiKeySignal>(),
      ),
    );
    gh.factory<_i729.ChatViewModel>(
      () => _i729.ChatViewModel(
        gh<_i715.AiClient>(),
        gh<_i70.NativeLanguageSignal>(),
        gh<_i70.TargetLanguageSignal>(),
      ),
    );
    return this;
  }
}

class _$SembastModule extends _i228.SembastModule {}

class _$DioModule extends _i31.DioModule {}
