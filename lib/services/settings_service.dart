import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/settings.dart';
import 'dart:convert' as convert;

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

  static const String _geminiApiKeyKey = 'gemini_api_key';
  static const String _pixabayApiKeyKey = 'pixabay_api_key';
  static const String _microsoftApiKeyKey = 'microsoft_speech_api_key';
  static const String _microsoftEndpointKey = 'microsoft_speech_endpoint';
  static const String _nativeLanguageKey = 'native_language';

  Future<void> _loadGeminiSettings() async {
    final apiKey = await storage.read(key: _geminiApiKeyKey);
    if (apiKey != null) {
      geminiSettings.apiKey = apiKey;
    }
  }

  Future<void> _loadPixabaySettings() async {
    final apiKey = await storage.read(key: _pixabayApiKeyKey);
    if (apiKey != null) {
      pixabaySettings.apiKey = apiKey;
    }
  }

  Future<void> _loadMicrosoftSpeechSettings() async {
    final apiKey = await storage.read(key: _microsoftApiKeyKey);
    final endpoint = await storage.read(key: _microsoftEndpointKey);
    
    if (apiKey != null) {
      microsoftSpeechSettings.apiKey = apiKey;
    }
    if (endpoint != null) {
      microsoftSpeechSettings.endpoint = endpoint;
    }
  }

  Future<void> _loadNativeLanguage() async {
    final languageJson = await storage.read(key: _nativeLanguageKey);
    if (languageJson != null) {
      try {
        nativeLanguage.language = Language.fromJson(
          Map<String, dynamic>.from(convert.jsonDecode(languageJson)),
        );
      } catch (e) {
        // Log error and set default value
        nativeLanguage.language = null;
      }
    } else {
      nativeLanguage.language = null;
    }
  }

  Future<void> saveAndLoadGeminiSettings(String apiKey) async {
    await storage.write(key: _geminiApiKeyKey, value: apiKey);
    await _loadGeminiSettings();
  }

  Future<void> saveAndLoadPixabaySettings(String apiKey) async {
    await storage.write(key: _pixabayApiKeyKey, value: apiKey);
    await _loadPixabaySettings();
  }

  Future<void> saveAndLoadMicrosoftSpeechSettings(String apiKey, String endpoint) async {
    await storage.write(key: _microsoftApiKeyKey, value: apiKey);
    await storage.write(key: _microsoftEndpointKey, value: endpoint);
    await _loadMicrosoftSpeechSettings();
  }

  Future<void> saveAndLoadNativeLanguage(Language language) async {
    await storage.write(key: _nativeLanguageKey, value: convert.jsonEncode(language.toJson()));
    await _loadNativeLanguage();
  }

  Future<void> clearNativeLanguage() async {
    await storage.delete(key: _nativeLanguageKey);
  }

  Future<void> loadAllSettings() async {
    await Future.wait([
      _loadGeminiSettings(),
      _loadPixabaySettings(),
      _loadMicrosoftSpeechSettings(),
      _loadNativeLanguage(),
    ]);
  }

  Future<void> clearAllSettings() async {
    await storage.deleteAll();
    geminiSettings.apiKey = null;
    pixabaySettings.apiKey = null;
    microsoftSpeechSettings.apiKey = null;
    microsoftSpeechSettings.endpoint = null;
    nativeLanguage.language = null;
  }

  bool areSettingsComplete() {
    return geminiSettings.apiKey != null &&
        pixabaySettings.apiKey != null &&
        microsoftSpeechSettings.apiKey != null &&
        microsoftSpeechSettings.endpoint != null &&
        nativeLanguage.language != null;
  }
}
