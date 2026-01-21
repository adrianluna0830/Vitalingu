import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/private_settings.dart';

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
