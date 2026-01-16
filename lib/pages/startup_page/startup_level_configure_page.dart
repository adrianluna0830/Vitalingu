import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/view_models/startup/startup_level_configure_view_model.dart';

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
    final currentState = viewModel.state.watch(context);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 600,
              child: Slider(
                value: viewModel.selectedLevel.toDouble(),
                min: 0,
                max: 5,
                divisions: 5,
                onChanged: (newValue) {
                  viewModel.changeCEFRLevel(newValue.toInt());
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: currentState.canContinue
                  ? () => viewModel.navigateNext(context.tabsRouter)
                  : null,
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: currentState.canContinue
                    ? Colors.blue
                    : Colors.grey,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.navigatePrevious(context.tabsRouter),
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
