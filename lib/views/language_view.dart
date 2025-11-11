import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/language_viewmodel.dart';

@RoutePage()
class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<LanguageViewModel>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: viewModel.goToSettings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}