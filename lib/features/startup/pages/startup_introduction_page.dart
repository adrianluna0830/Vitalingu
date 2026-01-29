import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/features/startup/view_models/startup_introduction_view_model.dart';

@RoutePage()
class StartupIntroductionPage extends StatefulWidget {
  const StartupIntroductionPage({super.key});

  @override
  State<StartupIntroductionPage> createState() =>
      _StartupIntroductionPageState();
}

class _StartupIntroductionPageState extends State<StartupIntroductionPage> {
  final viewModel = getIt<StartupIntroductionViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Welcome to Vitalingu!'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => {viewModel.goToNativeLanguageSelectionPage()},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
                foregroundColor: Colors.white,
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
