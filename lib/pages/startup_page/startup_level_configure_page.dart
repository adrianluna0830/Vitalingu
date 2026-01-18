import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/view_models/startup/startup_level_configure_view_model.dart';

@RoutePage()
class StartupLevelConfigurePage extends StatefulWidget {
  const StartupLevelConfigurePage({super.key, required this.onLevelSelected, required this.onNext});
  final Function(CEFR level) onLevelSelected;
  final VoidCallback onNext;

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
                value: currentState.selectedLevel.toDouble(),
                min: 0,
                max: 4,
                divisions: 4,
                onChanged: (newValue) {
                  viewModel.changeCEFRLevel(newValue.toInt());
                  widget.onLevelSelected(CEFR.values[newValue.toInt()]);
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: currentState.canContinue
                  ? () async {
                      await viewModel.goToNextStep();
                      widget.onNext();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: currentState.canContinue
                    ? Colors.blue
                    : Colors.grey,
                foregroundColor: Colors.white,
              ),
              child: Text('Next'),
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
