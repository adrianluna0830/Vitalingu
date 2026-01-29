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
import 'package:vitalingu/core/models/ai_client.dart' as _i632;
import 'package:vitalingu/core/models/dio_module.dart' as _i590;
import 'package:vitalingu/core/models/gemini_ai_client.dart' as _i770;
import 'package:vitalingu/core/models/language_specific_settings.dart' as _i808;
import 'package:vitalingu/core/models/private_settings.dart' as _i593;
import 'package:vitalingu/core/models/sembast_module.dart' as _i935;
import 'package:vitalingu/core/models/shared_preferences_store.dart' as _i999;
import 'package:vitalingu/core/models/user_app_settings.dart' as _i568;
import 'package:vitalingu/core/router/app_router.dart' as _i344;
import 'package:vitalingu/features/chat/services/ai_client_chat.dart' as _i661;
import 'package:vitalingu/features/chat/view_models/chat_view_model.dart'
    as _i719;
import 'package:vitalingu/features/home/view_models/home_settings_view_model.dart'
    as _i871;
import 'package:vitalingu/features/home/view_models/home_units_view_model.dart'
    as _i807;
import 'package:vitalingu/features/learning/repositories/learning_units_repository.dart'
    as _i226;
import 'package:vitalingu/features/learning/repositories/user_unit_data_repository.dart'
    as _i26;
import 'package:vitalingu/features/learning/view_models/unit_explanation_page_view_model.dart'
    as _i328;
import 'package:vitalingu/features/startup/view_models/startup_introduction_view_model.dart'
    as _i382;
import 'package:vitalingu/features/startup/view_models/startup_level_configure_view_model.dart'
    as _i191;
import 'package:vitalingu/features/startup/view_models/startup_native_language_view_model.dart'
    as _i778;
import 'package:vitalingu/features/startup/view_models/startup_target_language_view_model.dart'
    as _i631;

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
    gh.factory<_i999.SharedPreferencesStore>(
      () => _i999.SharedPreferencesStore(),
    );
    gh.factory<_i999.EncryptedSharedPreferencesStore>(
      () => _i999.EncryptedSharedPreferencesStore(),
    );
    gh.singleton<_i344.AppRouter>(() => _i344.AppRouter());
    await gh.singletonAsync<_i226.LearningUnitsRepository>(
      () => _i226.LearningUnitsRepository.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    await gh.singletonAsync<_i568.GeminiApiKeySignal>(
      () => _i568.GeminiApiKeySignal.create(
        encryptedStore: gh<_i999.EncryptedSharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    gh.singleton<_i26.UserUnitDataRepository>(
      () => _i26.UserUnitDataRepository(gh<_i310.Database>()),
    );
    await gh.singletonAsync<_i593.HasLoadedDataSignal>(
      () => _i593.HasLoadedDataSignal.create(
        sharedPreferencesStore: gh<_i999.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i593.IsStartupCompletedSignal>(
      () => _i593.IsStartupCompletedSignal.create(
        sharedPreferencesStore: gh<_i999.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i568.NativeLanguageSignal>(
      () => _i568.NativeLanguageSignal.create(
        sharedPreferencesStore: gh<_i999.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i568.TargetLanguageSignal>(
      () => _i568.TargetLanguageSignal.create(
        sharedPreferencesStore: gh<_i999.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i568.StopTrackingAtRatioSignal>(
      () => _i568.StopTrackingAtRatioSignal.create(
        sharedPreferencesStore: gh<_i999.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    gh.factory<_i807.HomeUnitsViewModel>(
      () => _i807.HomeUnitsViewModel(
        gh<_i568.NativeLanguageSignal>(),
        gh<_i568.TargetLanguageSignal>(),
        gh<_i226.LearningUnitsRepository>(),
        gh<_i26.UserUnitDataRepository>(),
        gh<_i344.AppRouter>(),
      ),
    );
    gh.factory<_i382.StartupIntroductionViewModel>(
      () =>
          _i382.StartupIntroductionViewModel(appRouter: gh<_i344.AppRouter>()),
    );
    gh.factory<_i871.HomeSettingsViewModel>(
      () => _i871.HomeSettingsViewModel(
        gh<_i568.NativeLanguageSignal>(),
        gh<_i568.TargetLanguageSignal>(),
        gh<_i568.GeminiApiKeySignal>(),
      ),
    );
    gh.factoryAsync<_i808.SpeakingSkillSignal>(
      () => _i808.SpeakingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i568.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i808.HearingSkillSignal>(
      () => _i808.HearingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i568.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i808.ListeningSkillSignal>(
      () => _i808.ListeningSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i568.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i808.WritingSkillSignal>(
      () => _i808.WritingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i568.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i808.HasStartedLanguage>(
      () => _i808.HasStartedLanguage.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i568.TargetLanguageSignal>(),
      ),
    );
    gh.factory<_i191.StartupLevelConfigureViewModel>(
      () => _i191.StartupLevelConfigureViewModel(
        gh<_i344.AppRouter>(),
        gh<_i593.IsStartupCompletedSignal>(),
      ),
    );
    gh.factory<_i631.StartupTargetLanguageViewModel>(
      () => _i631.StartupTargetLanguageViewModel(
        gh<_i568.TargetLanguageSignal>(),
        gh<_i344.AppRouter>(),
        nativeLanguageSignal: gh<_i568.NativeLanguageSignal>(),
      ),
    );
    gh.factory<_i778.StartupNativeLanguageViewModel>(
      () => _i778.StartupNativeLanguageViewModel(
        gh<_i568.NativeLanguageSignal>(),
        gh<_i344.AppRouter>(),
      ),
    );
    gh.factoryParamAsync<_i593.UnitExplanationCacheSignal, String?, dynamic>(
      (unitCode, _) => _i593.UnitExplanationCacheSignal.create(
        sharedPreferencesStore: gh<_i999.SharedPreferencesStore>(),
        unitCode: unitCode,
      ),
    );
    gh.singleton<_i632.AiClient>(
      () =>
          _i770.GeminiAiClient(gh<_i361.Dio>(), gh<_i568.GeminiApiKeySignal>()),
    );
    gh.factoryParam<_i661.AiClientChat, String?, dynamic>(
      (systemInstruction, _) =>
          _i661.AiClientChat.create(gh<_i632.AiClient>(), systemInstruction),
    );
    gh.factory<_i328.UnitExplanationPageViewModel>(
      () => _i328.UnitExplanationPageViewModel(
        gh<_i632.AiClient>(),
        gh<_i568.NativeLanguageSignal>(),
        gh<_i568.TargetLanguageSignal>(),
        gh<_i632.AiClient>(),
      ),
    );
    gh.factory<_i719.ChatViewModel>(
      () => _i719.ChatViewModel(
        gh<_i632.AiClient>(),
        gh<_i568.NativeLanguageSignal>(),
        gh<_i568.TargetLanguageSignal>(),
      ),
    );
    return this;
  }
}

class _$SembastModule extends _i935.SembastModule {}

class _$DioModule extends _i590.DioModule {}
