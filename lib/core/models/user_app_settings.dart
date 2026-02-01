
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/core/models/shared_preferences_store.dart';
@singleton
class NativeLanguageSignal extends PersistedEnumSignal<Language> {
  NativeLanguageSignal({required SharedPreferencesStore sharedPreferencesStore})
      : super(
          Language.English,
          'nativeLanguage', 
          Language.values, 
          store: sharedPreferencesStore,
        );

  @FactoryMethod(preResolve: true)
  static Future<NativeLanguageSignal> create({
    required SharedPreferencesStore sharedPreferencesStore
  }) async {
    final signal = NativeLanguageSignal(
      sharedPreferencesStore: sharedPreferencesStore
    );
    await signal.init();
    return signal;
  }
}

@singleton
class TargetLanguageSignal extends PersistedEnumSignal<Language> {
  TargetLanguageSignal({required SharedPreferencesStore sharedPreferencesStore})
      : super(
          Language.Spanish,
          'targetLanguage',  
          Language.values,
          store: sharedPreferencesStore,
        );

  @FactoryMethod(preResolve: true)
  static Future<TargetLanguageSignal> create({
    required SharedPreferencesStore sharedPreferencesStore
  }) async {
    final signal = TargetLanguageSignal(
      sharedPreferencesStore: sharedPreferencesStore
    );
    await signal.init();
    return signal;
  }
}
@singleton
class GeminiApiKeySignal extends PersistedSignal<String> {
  GeminiApiKeySignal({
    required EncryptedSharedPreferencesStore encryptedStore,
  }) : super(
          '',
          key: 'gemini_api_key',
          store: encryptedStore,
          autoInit: false,
        );

  @FactoryMethod(preResolve: true)
  static Future<GeminiApiKeySignal> create({
    required EncryptedSharedPreferencesStore encryptedStore,
  }) async {
    final signal =
        GeminiApiKeySignal(encryptedStore: encryptedStore);
    // await signal.init();
    return signal;
  }
}


@singleton
class StopTrackingAtRatioSignal extends PersistedSignal<double> {
  StopTrackingAtRatioSignal({
    required SharedPreferencesStore sharedPreferencesStore,
  }) : super(
          0.8,
          key: 'stop_tracking_at_value',
          store: sharedPreferencesStore,
          autoInit: false,
        );

  @FactoryMethod(preResolve: true)
  static Future<StopTrackingAtRatioSignal> create({
    required SharedPreferencesStore sharedPreferencesStore,
  }) async {
    final signal =
        StopTrackingAtRatioSignal(sharedPreferencesStore: sharedPreferencesStore);
    await signal.init();
    return signal;
  }
}


@singleton
class AlwaysTranslateSignal extends PersistedSignal<bool> {
  AlwaysTranslateSignal({
    required SharedPreferencesStore sharedPreferencesStore,
  }) : super(
          false,
          key: 'always_translate',
          store: sharedPreferencesStore,
          autoInit: false,
        );

  @FactoryMethod(preResolve: true)
  static Future<AlwaysTranslateSignal> create({
    required SharedPreferencesStore sharedPreferencesStore,
  }) async {
    final signal =
        AlwaysTranslateSignal(sharedPreferencesStore: sharedPreferencesStore);
    await signal.init();
    return signal;
  }
}