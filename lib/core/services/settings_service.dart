import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/features/language_management/data/model/language.dart';
import 'package:vitalingu/features/settings/data/model/settings.dart';
import 'package:vitalingu/register_languages.dart';

@singleton
class SettingsService {
  final storage = const FlutterSecureStorage();
  final GeminiSettings geminiSettings;
  final PixabaySettings pixabaySettings;
  final MicrosoftSpeechSettings microsoftSpeechSettings;
  final NativeLanguage nativeLanguage;

  SettingsService(
    this.geminiSettings,
    this.pixabaySettings,
    this.microsoftSpeechSettings,
    this.nativeLanguage,
  );

  // Keys for secure storage
  static const String geminiApiKeyKey = 'gemini_api_key';
  static const String pixabayApiKeyKey = 'pixabay_api_key';
  static const String microsoftApiKeyKey = 'microsoft_speech_api_key';
  static const String microsoftEndpointKey = 'microsoft_speech_endpoint';
  static const String nativeLanguageKey = 'native_language';
  static const String nativeLanguageVoiceKey = 'native_language_voice';

  Future<void> _loadSettings(String key, Function(String?) onLoad) async {
    final value = await storage.read(key: key);
    onLoad(value);
  }

  Future<void> _loadAllSettings() async {
    await Future.wait([
      _loadSettings(geminiApiKeyKey, (v) => geminiSettings.apiKey = v),
      _loadSettings(pixabayApiKeyKey, (v) => pixabaySettings.apiKey = v),
      _loadSettings(microsoftApiKeyKey, (v) => microsoftSpeechSettings.apiKey = v),
      _loadSettings(microsoftEndpointKey, (v) => microsoftSpeechSettings.endpoint = v),
      _loadSettings(nativeLanguageKey, (v) {
        nativeLanguage.language = v != null ? LanguageRegistry.getLanguageByCode(v) : null;
      }),
      _loadSettings(nativeLanguageVoiceKey, (v) => nativeLanguage.voice = v),
    ]);
  }

  Future<void> _saveSetting(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> saveAndLoadGeminiSettings(String apiKey) async {
    await _saveSetting(geminiApiKeyKey, apiKey);
    await _loadSettings(geminiApiKeyKey, (v) => geminiSettings.apiKey = v);
  }

  Future<void> saveAndLoadPixabaySettings(String apiKey) async {
    await _saveSetting(pixabayApiKeyKey, apiKey);
    await _loadSettings(pixabayApiKeyKey, (v) => pixabaySettings.apiKey = v);
  }

  Future<void> saveAndLoadMicrosoftSpeechSettings(String apiKey, String endpoint) async {
    await _saveSetting(microsoftApiKeyKey, apiKey);
    await _saveSetting(microsoftEndpointKey, endpoint);
    await _loadAllSettings();
  }

  Future<void> saveAndLoadNativeLanguage(Language language) async {
    await _saveSetting(nativeLanguageKey, language.bcp47Code);
    await _loadSettings(nativeLanguageKey, (v) {
      nativeLanguage.language = LanguageRegistry.getLanguageByCode(v!);
    });
  }

  Future<void> saveAndLoadNativeLanguageVoice(String voice) async {
    await _saveSetting(nativeLanguageVoiceKey, voice);
    await _loadSettings(nativeLanguageVoiceKey, (v) => nativeLanguage.voice = v);
  }

  Future<void> clearAllSettings() async {
    await storage.deleteAll();
    geminiSettings.apiKey = null;
    pixabaySettings.apiKey = null;
    microsoftSpeechSettings.apiKey = null;
    microsoftSpeechSettings.endpoint = null;
    nativeLanguage.language = null;
    nativeLanguage.voice = null;
  }

  Future<void> loadAllSettings() async {
    await _loadAllSettings();
  }

  bool areSettingsComplete() {
    return geminiSettings.apiKey != null &&
        pixabaySettings.apiKey != null &&
        microsoftSpeechSettings.apiKey != null &&
        microsoftSpeechSettings.endpoint != null &&
        nativeLanguage.language != null &&
        nativeLanguage.voice != null;
  }
}

