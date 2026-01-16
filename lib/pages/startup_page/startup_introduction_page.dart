import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/view_models/base_startup_view_model.dart';

@RoutePage()
class StartupIntroductionPage extends StatefulWidget {
  const StartupIntroductionPage({super.key});

  @override
  State<StartupIntroductionPage> createState() =>
      _StartupIntroductionPageState();
}

class _StartupIntroductionPageState extends State<StartupIntroductionPage> {
  final viewModel = getIt<BaseStartupViewModel>();

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
              onPressed: () => viewModel.navigateNext(context.tabsRouter),
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
