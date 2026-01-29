import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/core/router/app_router.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/private_settings.dart';

class StartupCompletedGuard extends AutoRouteGuard {
  final startupCompletedSignal = getIt<IsStartupCompletedSignal>();


  @override
  Future<void> onNavigation(
    NavigationResolver resolver, 
    StackRouter router,
  ) async {
        if(startupCompletedSignal.value == true) {
          resolver.next();
        } else 
        {
          resolver.redirectUntil(
            StartupIntroductionRoute(
              
            ),
          );
        }
  }
}
