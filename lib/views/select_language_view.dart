import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/select_language_view_models.dart';

@RoutePage()
class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key});

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  late final SelectLanguageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<SelectLanguageViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: viewModel.goToSettings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: viewModel.availableLanguages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: ElevatedButton(
              onPressed: () async {
                await viewModel.selectLanguage(viewModel.availableLanguages[index]);
              },
              child: Text(viewModel.availableLanguages[index].nativeName),
            ),
          );
        },
      ),
    );
  }
}