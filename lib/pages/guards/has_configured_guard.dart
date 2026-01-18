import 'package:auto_route/auto_route.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/private_settings.dart';
import 'package:vitalingu/pages/startup_page/startup_configure_page.dart';

class HasConfiguredGuard extends AutoRouteGuard {
  final startupCompletedSignal = getIt<IsStartupCompletedSignal>();


  @override
  Future<void> onNavigation(
    NavigationResolver resolver, 
    StackRouter router,
  ) async {
         await startupCompletedSignal.init();
        if(startupCompletedSignal.value == true) {
          resolver.next();
        } else 
        {
          resolver.redirectUntil(
            StartupConfigureRoute(
              onConfigurationComplete: (StartupConfigureValues values) async {
                await startupCompletedSignal.save(true);
                resolver.next();
              },
            ),
          );
        }
  }
}
