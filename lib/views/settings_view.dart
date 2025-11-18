import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/settings_view_model.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
   final SettingsViewModel viewModel = getIt<SettingsViewModel>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: viewModel.popBack,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Watch((context) {
        final loading = viewModel.isLoading.value;
        final selectedLanguage = viewModel.selectedNativeLanguage.value;
        final availableVoices = viewModel.availableVoices;
        final selectedVoice = viewModel.selectedVoice.value;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField(
                  initialValue: selectedLanguage,
                  decoration: const InputDecoration(
                    labelText: 'Native Language',
                  ),
                  items: viewModel.availableLanguages.map((language) {
                    return DropdownMenuItem(
                      value: language,
                      child: Text(language.nativeLanguageName),
                    );
                  }).toList(),
                  onChanged: loading ? null : viewModel.setNativeLanguage,
                ),
                const SizedBox(height: 16),
                if (selectedLanguage != null && availableVoices.isNotEmpty)
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedVoice,
                          decoration: const InputDecoration(
                            labelText: 'Voice',
                          ),
                          items: availableVoices.map((voice) {
                            return DropdownMenuItem(
                              value: voice,
                              child: Text(voice),
                            );
                          }).toList(),
                          onChanged: loading ? null : viewModel.setVoice,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.volume_up),
                        onPressed: (loading || selectedVoice == null)
                            ? null
                            : () => viewModel.playVoice(selectedVoice),
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                TextField(
                  controller: viewModel.geminiApiKeyController,
                  enabled: !loading,
                  decoration: const InputDecoration(
                    labelText: 'Gemini API Key',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: viewModel.pixabayApiKeyController,
                  enabled: !loading,
                  decoration: const InputDecoration(
                    labelText: 'Pixabay API Key',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: viewModel.microsoftApiKeyController,
                  enabled: !loading,
                  decoration: const InputDecoration(
                    labelText: 'Microsoft Speech API Key',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: viewModel.microsoftEndpointController,
                  enabled: !loading,
                  decoration: const InputDecoration(
                    labelText: 'Microsoft Speech Endpoint',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: loading ? null : viewModel.onSavePressed,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
