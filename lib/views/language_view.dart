import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/viewmodels/language_viewmodel.dart';
import 'package:vitalingu/widgets/target_language_selectable_text.dart';

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
    viewModel = getIt<LanguageViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TargetLanguageSelectableText(
          fullText: 'hola como estas',
          translateSelectedTextCallback: (String expandedSelection) {print( expandedSelection);},
          explainSelectedTextDoubtCallback: (String expandedSelection) { print( expandedSelection);},
          getSelectedWord: (String expandedSelection) { print( expandedSelection); },
        ),
      ),
    );
  }
}
