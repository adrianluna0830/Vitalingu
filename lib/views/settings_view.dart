import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/settings_viewmodel.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SettingsViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: viewModel.popBack,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Watch((context) {
        final loading = viewModel.isLoading.value;

        return Column(
          children: [
            TextField(controller: viewModel.geminiApiKeyController, enabled: !loading),
            TextField(controller: viewModel.pixabayApiKeyController, enabled: !loading),
            ElevatedButton(
              onPressed: loading ? null : viewModel.onSavePressed,
              child: const Text('Save'),
            ),
          ],
        );
      }),
    );
  }
}
