import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/language/cefr_enum.dart';
import 'package:vitalingu/features/startup/view_models/startup_level_configure_view_model.dart';

@RoutePage()
class StartupLevelConfigurePage extends StatefulWidget {
  const StartupLevelConfigurePage({super.key});

  @override
  State<StartupLevelConfigurePage> createState() =>
      _StartupLevelConfigurePageState();
}

class _StartupLevelConfigurePageState extends State<StartupLevelConfigurePage> {
  final viewModel = getIt<StartupLevelConfigureViewModel>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: () async => viewModel.changeLevel(CEFR.A1), child: Text('A1')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed:  () => viewModel.goToHomePage() ,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Next'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
                foregroundColor: Colors.white,
              ),
              child: Text('Previous'),
            )
          ],
        ),
      ),
    );
  }
}
