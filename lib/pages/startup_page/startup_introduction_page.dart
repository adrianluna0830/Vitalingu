import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/app_router.dart';

@RoutePage()
class StartupIntroductionPage extends StatelessWidget {
  const StartupIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () =>
              context.tabsRouter.navigate(const StartupNativeLanguageRoute()),
          child: Text('Next'),
        ),
      ),
    );
  }
}
