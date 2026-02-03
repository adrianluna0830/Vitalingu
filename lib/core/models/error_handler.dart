import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/core/router/app_router.dart';

@singleton
class ErrorHandler
{
  final AppRouter _appRouter;

  final Signal<Exception?> _errorSignal = Signal<Exception?>(null);
  late final errorSignal = computed(  () => _errorSignal.value);
  ErrorHandler(this._appRouter);

  void setError(Exception error)
  {
    _errorSignal.value = error;
  }
  void goToHome()
  {
    _appRouter.replaceAll([const HomeRoute()]);
  }


}
