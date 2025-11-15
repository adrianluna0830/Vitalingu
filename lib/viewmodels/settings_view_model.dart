import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/settings.dart';
import 'package:vitalingu/services/settings_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SettingsViewModel extends ViewModelBase {
  final SettingsService _settingsService;
  final geminiApiKeyController = TextEditingController();
  final pixabayApiKeyController = TextEditingController();
  final microsoftApiKeyController = TextEditingController();
  final microsoftRegionController = TextEditingController();

  final GeminiSettings _geminiSettings;
  final PixabaySettings _pixabaySettings;
  final MicrosoftSpeechSettings _microsoftSpeechSettings;
  final NativeLanguage _nativeLanguage;

  SettingsViewModel(
    this._geminiSettings,
    this._pixabaySettings,
    this._microsoftSpeechSettings,
    this._nativeLanguage, this._settingsService, {
    required super.navigationService,
  }) {
    _initializeSettings();
  }

  final isLoading = signal(false);
  final saveSuccess = signal<bool?>(null);

  List<Language> get availableLanguages => LanguageRegistry.languages;

  final selectedNativeLanguage = signal<Language?>(null);

  void _initializeSettings() {
    geminiApiKeyController.text = _geminiSettings.apiKey;
    pixabayApiKeyController.text = _pixabaySettings.apiKey;
    microsoftApiKeyController.text = _microsoftSpeechSettings.apiKey;
    microsoftRegionController.text = _microsoftSpeechSettings.region;
    selectedNativeLanguage.value = _nativeLanguage.language;
  }

  Future<void> _saveSettings() async {
    isLoading.value = true;
    saveSuccess.value = null;

    try {
      await _settingsService.saveAndLoadGeminiSettings(geminiApiKeyController.text.trim());
      await _settingsService.saveAndLoadPixabaySettings(pixabayApiKeyController.text.trim());
      await _settingsService.saveAndLoadMicrosoftSpeechSettings(
        microsoftApiKeyController.text.trim(),
        microsoftRegionController.text.trim(),
      );
      await _settingsService.saveAndLoadNativeLanguage(selectedNativeLanguage.value!);

      saveSuccess.value = true;
    } catch (e) {
      saveSuccess.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _goToSelectLanguageView() async {
    await navigationService.replaceWithSelectLanguageView();
  }

  void setNativeLanguage(Language? language) {
    if (language != null) {
      selectedNativeLanguage.value = language;
    }
  }

  Future<void> onSavePressed() async {
    await _saveSettings();
    if (saveSuccess.value == true) {
      await _goToSelectLanguageView();
    }
  }

  void dispose() {
    geminiApiKeyController.dispose();
    pixabayApiKeyController.dispose();
    microsoftApiKeyController.dispose();
    microsoftRegionController.dispose();
  }

  void popBack() {
    navigationService.popBack();
  }
}
