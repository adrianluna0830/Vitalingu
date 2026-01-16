
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/view_models/startup_view_model.dart';
@RoutePage()

class StartupNativeLanguagePage extends StatelessWidget {
  const StartupNativeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () =>
              getIt<StartupViewModel>().next(context.tabsRouter),
          child: Text('Next'),
        ),
      ),
    );
  }
}