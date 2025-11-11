import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/database/app_settings_database.dart';

@injectable
class SettingsViewModel {
  final AppSettingsDatabase _database;

  final geminiApiKeyController = TextEditingController();
  final pixabayApiKeyController = TextEditingController();

  final isLoading = signal(false);
  final saveSuccess = signal<bool?>(null);

  SettingsViewModel(this._database) {
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

  void dispose() {
    geminiApiKeyController.dispose();
    pixabayApiKeyController.dispose();
  }
}
