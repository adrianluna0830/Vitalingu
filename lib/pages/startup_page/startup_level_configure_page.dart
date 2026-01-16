
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()

class StartupLevelConfigurePage extends StatelessWidget {
  const StartupLevelConfigurePage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => {},
          child: Text('Next'),
        ),
      ),
    );
  }
}