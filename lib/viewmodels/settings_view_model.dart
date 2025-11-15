import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/services/app_settings_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SettingsViewModel extends ViewModelBase {
  final AppSettingsService _appSettingsService;

  final geminiApiKeyController = TextEditingController();
  final pixabayApiKeyController = TextEditingController();
  final microsoftApiKeyController = TextEditingController();
  final microsoftRegionController = TextEditingController();

  final isLoading = signal(false);
  final saveSuccess = signal<bool?>(null);

  List<Language> get availableLanguages => LanguageRegistry.languages;
  
  final selectedNativeLanguage = signal<Language?>(null);

  SettingsViewModel(
    this._appSettingsService, {
    required super.navigationService,
    required super.scopeManagerService,
  }) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    isLoading.value = true;
    try {
      final settings = await _appSettingsService.getSettings();
      if (settings != null) {
        geminiApiKeyController.text = settings.geminiApiKey;
        pixabayApiKeyController.text = settings.pixabayApiKey;
        microsoftApiKeyController.text = settings.microsoftSpeechApiKey;
        microsoftRegionController.text = settings.microsoftSpeechRegion;
        final matchingLanguage = availableLanguages.firstWhere(
          (lang) => lang.bcp47Code == settings.nativeLanguage.bcp47Code,
          orElse: () => availableLanguages.first,
        );
        selectedNativeLanguage.value = matchingLanguage;
      } else {
        selectedNativeLanguage.value = availableLanguages.isNotEmpty ? availableLanguages.first : null;
      }
    } catch (e) {
      selectedNativeLanguage.value = availableLanguages.isNotEmpty ? availableLanguages.first : null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<AppSettings?> _saveSettings() async {
    isLoading.value = true;
    saveSuccess.value = null;

    try {
      final settings = AppSettings(
        geminiApiKey: geminiApiKeyController.text.trim(),
        pixabayApiKey: pixabayApiKeyController.text.trim(),
        microsoftSpeechApiKey: microsoftApiKeyController.text.trim(),
        microsoftSpeechRegion: microsoftRegionController.text.trim(),
        nativeLanguage: selectedNativeLanguage.value!,
      );

      await _appSettingsService.saveSettings(settings);
      await scopeManagerService.createMainScope( settings.geminiApiKey, settings.pixabayApiKey);

      saveSuccess.value = true;
      return settings;
    } catch (e) {
      saveSuccess.value = false;
    } finally {
      isLoading.value = false;

    }
    return null;
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
    AppSettings? settings = await _saveSettings();
    if (settings != null) {
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
