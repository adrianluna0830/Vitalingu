
import 'package:injectable/injectable.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';
class StartupIntroductionState extends BaseStartupState {
  StartupIntroductionState({required super.canContinue});
}

@injectable
class StartupIntroductionViewModel extends BaseStartupViewModel<StartupIntroductionState> {
  StartupIntroductionViewModel()
      : super(StartupIntroductionState(canContinue: true));
}

