import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';

class StartupLevelConfigureState extends BaseStartupState {
  final int selectedLevel;
  final CEFR? targetLanguageLevel;

  StartupLevelConfigureState({
    required this.selectedLevel,
    required this.targetLanguageLevel,
  }) : super(canContinue: true);
}

@injectable
class StartupLevelConfigureViewModel
    extends BaseStartupViewModel<StartupLevelConfigureState> {
  StartupLevelConfigureViewModel()
      : super(StartupLevelConfigureState(
          selectedLevel: 0,
          targetLanguageLevel: CEFR.values[0],
        ));

  int get selectedLevel => state.value.selectedLevel;

  CEFR? get targetLanguageLevel => state.value.targetLanguageLevel;

  void changeCEFRLevel(int levelIndex) {
    updateState(StartupLevelConfigureState(
      selectedLevel: levelIndex,
      targetLanguageLevel: CEFR.values[levelIndex],
    ));
  }
}
