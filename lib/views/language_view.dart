import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/viewmodels/language_viewmodel.dart';

@RoutePage()
class LanguageView extends StatefulWidget {
  final Language language;
  const LanguageView({super.key, required this.language});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  late final LanguageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<LanguageViewModel>(param1: widget.language);
    print(viewModel.language.languageWord.defaultToJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(viewModel.language.languageWord.defaultToJson()),),
    );
  }
}
