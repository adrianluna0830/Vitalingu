import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/router/app_router.dart';
import 'package:vitalingu/core/models/language/cefr_enum.dart';
import 'package:vitalingu/core/models/private_settings.dart';

@injectable
class StartupLevelConfigureViewModel {
  final IsStartupCompletedSignal isStartupCompletedSignal;
  final AppRouter _appRouter;

  StartupLevelConfigureViewModel(this._appRouter, this.isStartupCompletedSignal);

  Signal<CEFR> selectedLevel = Signal<CEFR>(CEFR.A1);

  Future<void> changeLevel(CEFR level) async {
    selectedLevel.value = level;
    await isStartupCompletedSignal.save(true);
    isStartupCompletedSignal.value = true;
  }

  void goToHomePage() {
    print(isStartupCompletedSignal.value);
    _appRouter.replace(HomeTabRoute());
  }
  
}