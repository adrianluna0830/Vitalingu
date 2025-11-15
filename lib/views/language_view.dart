import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/selectable_text_service.dart';
import 'package:vitalingu/viewmodels/language_view_model.dart';
import 'package:vitalingu/widgets/custom_selectable_text.dart';

@RoutePage()
class LanguageView extends StatefulWidget {

   const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
   final LanguageViewModel viewModel = getIt<LanguageViewModel>();
   String text = "This is a sample context for translation.";
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
            },
            child: const Text("Press me"),
          ),
        ],
      ),
    );
  }
}
