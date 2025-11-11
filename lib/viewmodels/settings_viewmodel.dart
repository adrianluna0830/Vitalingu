import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/database/app_settings_database.dart';
import 'package:vitalingu/services/navigation_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';

@injectable
class SettingsViewModel extends ViewModelBase {
  final AppSettingsDatabase _database;

  final geminiApiKeyController = TextEditingController();
  final pixabayApiKeyController = TextEditingController();

  final isLoading = signal(false);
  final saveSuccess = signal<bool?>(null);

  SettingsViewModel( this._database, {required super.navigationService}) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    isLoading.value = true;
    try {
      geminiApiKeyController.text = await _database.getGeminiApiKey();
      pixabayApiKeyController.text = await _database.getPixabayApiKey();
    } catch (e) {
      print('Error loading settings: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveSettings() async {
    isLoading.value = true;
    saveSuccess.value = null;

    try {
      await _database.saveGeminiApiKey(geminiApiKeyController.text.trim());
      await _database.savePixabayApiKey(pixabayApiKeyController.text.trim());
      saveSuccess.value = true;
    } catch (e) {
      print('Error saving settings: $e');
      saveSuccess.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onSavePressed() async {
    await saveSettings();
    if (saveSuccess.value == true) {
      await saveAndNavigate();
    }
  }

  void dispose() {
    geminiApiKeyController.dispose();
    pixabayApiKeyController.dispose();
  }

  void popBack() {
    navigationService.popBack();
  }

  Future<void> saveAndNavigate() async {
    await navigationService.replaceWithLanguageView();
  }
}
