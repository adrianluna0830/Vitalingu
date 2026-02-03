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
import 'package:vitalingu/core/models/ai/ai_client.dart' as _i101;
import 'package:vitalingu/core/models/ai/gemini_ai_client.dart' as _i431;
import 'package:vitalingu/core/models/error_handler.dart' as _i482;
import 'package:vitalingu/core/models/modules/dio_module.dart' as _i156;
import 'package:vitalingu/core/models/modules/sembast_module.dart' as _i1052;
import 'package:vitalingu/core/models/settings/language_specific_settings.dart'
    as _i154;
import 'package:vitalingu/core/models/settings/private_settings.dart' as _i168;
import 'package:vitalingu/core/models/settings/user_app_settings.dart' as _i392;
import 'package:vitalingu/core/models/signals_stores.dart' as _i534;
import 'package:vitalingu/core/repositories/learning_units_repository.dart'
    as _i1067;
import 'package:vitalingu/core/repositories/user_unit_data_repository.dart'
    as _i7;
import 'package:vitalingu/core/router/app_router.dart' as _i344;
import 'package:vitalingu/features/chat/view_models/chat_view_model.dart'
    as _i719;
import 'package:vitalingu/features/home/pages/home_page.dart' as _i618;
import 'package:vitalingu/features/home/view_models/home_settings_view_model.dart'
    as _i871;
import 'package:vitalingu/features/home/view_models/home_units_view_model.dart'
    as _i807;
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
    gh.factory<_i534.SharedPreferencesStore>(
      () => _i534.SharedPreferencesStore(),
    );
    gh.factory<_i534.EncryptedSharedPreferencesStore>(
      () => _i534.EncryptedSharedPreferencesStore(),
    );
    await gh.singletonAsync<_i1067.LearningUnitsRepository>(
      () => _i1067.LearningUnitsRepository.create(),
      preResolve: true,
    );
    gh.singleton<_i344.AppRouter>(() => _i344.AppRouter());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i7.UserUnitDataRepository>(
      () => _i7.UserUnitDataRepository(gh<_i310.Database>()),
    );
    gh.factory<_i382.StartupIntroductionViewModel>(
      () =>
          _i382.StartupIntroductionViewModel(appRouter: gh<_i344.AppRouter>()),
    );
    await gh.singletonAsync<_i392.GeminiApiKeySignal>(
      () => _i392.GeminiApiKeySignal.create(
        encryptedStore: gh<_i534.EncryptedSharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    gh.singleton<_i482.ErrorHandler>(
      () => _i482.ErrorHandler(gh<_i344.AppRouter>()),
    );
    gh.factory<_i618.HomePageViewmodel>(
      () => _i618.HomePageViewmodel(gh<_i344.AppRouter>()),
    );
    await gh.singletonAsync<_i168.HasLoadedDataSignal>(
      () => _i168.HasLoadedDataSignal.create(
        sharedPreferencesStore: gh<_i534.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i168.IsStartupCompletedSignal>(
      () => _i168.IsStartupCompletedSignal.create(
        sharedPreferencesStore: gh<_i534.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i392.NativeLanguageSignal>(
      () => _i392.NativeLanguageSignal.create(
        sharedPreferencesStore: gh<_i534.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i392.TargetLanguageSignal>(
      () => _i392.TargetLanguageSignal.create(
        sharedPreferencesStore: gh<_i534.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i392.StopTrackingAtRatioSignal>(
      () => _i392.StopTrackingAtRatioSignal.create(
        sharedPreferencesStore: gh<_i534.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i392.AlwaysTranslateSignal>(
      () => _i392.AlwaysTranslateSignal.create(
        sharedPreferencesStore: gh<_i534.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    gh.singleton<_i101.AiClient>(
      () =>
          _i431.GeminiAiClient(gh<_i361.Dio>(), gh<_i392.GeminiApiKeySignal>()),
    );
    gh.factoryParamAsync<_i168.UnitExplanationCacheSignal, String?, dynamic>(
      (unitCode, _) => _i168.UnitExplanationCacheSignal.create(
        sharedPreferencesStore: gh<_i534.SharedPreferencesStore>(),
        unitCode: unitCode,
      ),
    );
    gh.factory<_i871.HomeSettingsViewModel>(
      () => _i871.HomeSettingsViewModel(
        gh<_i392.NativeLanguageSignal>(),
        gh<_i392.TargetLanguageSignal>(),
        gh<_i392.GeminiApiKeySignal>(),
        gh<_i392.AlwaysTranslateSignal>(),
      ),
    );
    gh.factory<_i719.ChatViewModel>(
      () => _i719.ChatViewModel(gh<_i101.AiClient>(), gh<_i482.ErrorHandler>()),
    );
    gh.factoryAsync<_i154.SpeakingSkillSignal>(
      () => _i154.SpeakingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i392.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i154.HearingSkillSignal>(
      () => _i154.HearingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i392.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i154.ListeningSkillSignal>(
      () => _i154.ListeningSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i392.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i154.WritingSkillSignal>(
      () => _i154.WritingSkillSignal.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i392.TargetLanguageSignal>(),
      ),
    );
    gh.factoryAsync<_i154.HasStartedLanguage>(
      () => _i154.HasStartedLanguage.create(
        db: gh<_i854.Database>(),
        targetLanguage: gh<_i392.TargetLanguageSignal>(),
      ),
    );
    gh.factory<_i631.StartupTargetLanguageViewModel>(
      () => _i631.StartupTargetLanguageViewModel(
        gh<_i392.TargetLanguageSignal>(),
        gh<_i344.AppRouter>(),
        nativeLanguageSignal: gh<_i392.NativeLanguageSignal>(),
      ),
    );
    gh.factory<_i807.HomeUnitsViewModel>(
      () => _i807.HomeUnitsViewModel(
        gh<_i392.NativeLanguageSignal>(),
        gh<_i392.TargetLanguageSignal>(),
        gh<_i1067.LearningUnitsRepository>(),
        gh<_i7.UserUnitDataRepository>(),
      ),
    );
    gh.factory<_i778.StartupNativeLanguageViewModel>(
      () => _i778.StartupNativeLanguageViewModel(
        gh<_i392.NativeLanguageSignal>(),
        gh<_i344.AppRouter>(),
      ),
    );
    gh.factory<_i191.StartupLevelConfigureViewModel>(
      () => _i191.StartupLevelConfigureViewModel(
        gh<_i344.AppRouter>(),
        gh<_i168.IsStartupCompletedSignal>(),
      ),
    );
    return this;
  }
}

class _$SembastModule extends _i1052.SembastModule {}

class _$DioModule extends _i156.DioModule {}
