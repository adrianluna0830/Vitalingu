import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/services/ai/azure_speech_service.dart';
import 'package:vitalingu/features/language_management/data/model/language.dart';
import 'package:vitalingu/features/settings/data/model/settings.dart';
import 'package:vitalingu/core/services/settings_service.dart';
import 'package:vitalingu/core/base/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SettingsViewModel extends ViewModelBase {
  final SettingsService _settingsService;
  final AzureSpeechService _microsoftSpeechService;
  final GeminiSettings _geminiSettings;
  final PixabaySettings _pixabaySettings;
  final MicrosoftSpeechSettings _microsoftSpeechSettings;
  final NativeLanguage _nativeLanguage;

  final geminiApiKeyController = TextEditingController();
  final pixabayApiKeyController = TextEditingController();
  final microsoftApiKeyController = TextEditingController();
  final microsoftEndpointController = TextEditingController();

  final isLoading = signal(false);
  final saveSuccess = signal<bool?>(null);
  final selectedNativeLanguage = signal<Language?>(null);
  final selectedVoice = signal<String?>(null);

  SettingsViewModel(
    this._settingsService,
    this._microsoftSpeechService,
    this._geminiSettings,
    this._pixabaySettings,
    this._microsoftSpeechSettings,
    this._nativeLanguage, {
    required super.navigationService,
  }) {
    _initializeSettings();
  }

  void _initializeSettings() {
    _initializeControllers();
    _initializeLanguageAndVoice();
  }

  void _initializeControllers() {
    geminiApiKeyController.text = _geminiSettings.apiKey ?? '';
    pixabayApiKeyController.text = _pixabaySettings.apiKey ?? '';
    microsoftApiKeyController.text = _microsoftSpeechSettings.apiKey ?? '';
    microsoftEndpointController.text = _microsoftSpeechSettings.endpoint ?? '';
  }

  void _initializeLanguageAndVoice() {
    selectedNativeLanguage.value = _nativeLanguage.language ?? availableLanguages.firstOrNull;
    selectedVoice.value = _nativeLanguage.voice ?? selectedNativeLanguage.value?.voices.firstOrNull;
  }

  List<Language> get availableLanguages => LanguageRegistry.languages;

  List<String> get availableVoices => selectedNativeLanguage.value?.voices ?? [];

  void setNativeLanguage(Language? language) {
    if (language != null) {
      selectedNativeLanguage.value = language;
      selectedVoice.value = language.voices.firstOrNull;
    }
  }

  void setVoice(String? voice) {
    selectedVoice.value = voice;
  }

  Future<void> playVoice(String voiceCode) async {
    throw UnimplementedError('playVoice not yet implemented');
  }

  Future<void> onSavePressed() async {
    isLoading.value = true;
    saveSuccess.value = null;

    try {
      await _saveAllSettings();
      saveSuccess.value = true;
      await navigationService.replaceWithSelectLanguageView();
    } catch (_) {
      saveSuccess.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveAllSettings() async {
    await _settingsService.saveAndLoadGeminiSettings(geminiApiKeyController.text.trim());
    await _settingsService.saveAndLoadPixabaySettings(pixabayApiKeyController.text.trim());
    await _settingsService.saveAndLoadMicrosoftSpeechSettings(
      microsoftApiKeyController.text.trim(),
      microsoftEndpointController.text.trim(),
    );
    await _settingsService.saveAndLoadNativeLanguage(selectedNativeLanguage.value!);
    if (selectedVoice.value != null) {
      await _settingsService.saveAndLoadNativeLanguageVoice(selectedVoice.value!);
    }
  }

  void popBack() {
    navigationService.popBack();
  }

  @override
  void dispose() {
    geminiApiKeyController.dispose();
    pixabayApiKeyController.dispose();
    microsoftApiKeyController.dispose();
    microsoftEndpointController.dispose();
  }
}

