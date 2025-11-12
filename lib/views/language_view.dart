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
  late final LanguageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<LanguageViewModel>();
    print(viewModel.language.languageWord.getWordPrompt(word: 'Set', nativeLanguage: 'Spanish', targetLanguage: 'English'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(),
    );
  }
}
