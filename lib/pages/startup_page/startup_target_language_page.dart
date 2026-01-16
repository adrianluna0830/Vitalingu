
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/app_router.dart';
@RoutePage()

class StartupTargetLanguagePage extends StatelessWidget {
  const StartupTargetLanguagePage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () =>
              context.tabsRouter.navigate(const StartupLevelConfigureRoute()),
          child: Text('Next'),
        ),
      ),
    );
  }
}