import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/di/di.dart';
import 'package:vitalingu/viewmodels/settings_viewmodel.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late final SettingsViewModel _viewModel;
  late final EffectCleanup _effectCleanup;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<SettingsViewModel>();
    
    _effectCleanup = effect(() {
      final success = _viewModel.saveSuccess.value;
      if (success != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success ? 'Settings saved successfully' : 'Failed to save settings'),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
        // Reset después de mostrar el snackbar
        Future.delayed(const Duration(milliseconds: 500), () {
          _viewModel.saveSuccess.value = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _effectCleanup();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Watch((context) {
        if (_viewModel.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _viewModel.geminiApiKeyController,
                decoration: const InputDecoration(
                  labelText: 'Gemini API Key',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _viewModel.pixabayApiKeyController,
                decoration: const InputDecoration(
                  labelText: 'Pixabay API Key',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _viewModel.saveSettings,
                child: const Text('Save'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
