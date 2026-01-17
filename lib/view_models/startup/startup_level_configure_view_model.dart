import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/services/navigation_service.dart';
import 'package:vitalingu/services/private_app_service.dart';
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
  StartupLevelConfigureViewModel(this._navigationService, this._privateAppService)
      : super(StartupLevelConfigureState(
          selectedLevel: 0,
          targetLanguageLevel: CEFR.values[0],
        ));

  final NavigationService _navigationService;
  final PrivateAppService _privateAppService;


  void changeCEFRLevel(int levelIndex) {
    updateState(StartupLevelConfigureState(
      selectedLevel: levelIndex,
      targetLanguageLevel: CEFR.values[levelIndex],
    ));
  }

  Future<void> goToNextStep() async {
    await _privateAppService.setIsFirstLaunch(false);
    _navigationService.goToHome();
  }
}
