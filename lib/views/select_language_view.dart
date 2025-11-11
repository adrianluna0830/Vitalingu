import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/select_language_view_models.dart';
@RoutePage()
class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
      final SelectLanguageViewModel viewModel = getIt<SelectLanguageViewModel>();

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: viewModel.goToSettings,
            icon: const Icon(Icons.settings),
          ),
      ],),
      body: ListView.builder(itemCount: viewModel.languages.length, itemBuilder: (context, index) {
        return ListTile(
          title: ElevatedButton(
            onPressed: () {viewModel.selectLanguage(viewModel.languages[index]);}, 
          child: Text(viewModel.languages[index].nativeName))
        );
      },),
    );
  }
}