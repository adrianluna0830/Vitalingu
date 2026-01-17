import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/private_app_service.dart';

class HasConfiguredGuard extends AutoRouteGuard {


  @override
  Future<void> onNavigation(
    NavigationResolver resolver, 
    StackRouter router,
  ) async {
       final service = await getIt<PrivateAppService>();
        final hasLoadedInitialData = await service.hasLoadedInitialData;
        if(hasLoadedInitialData) {
          resolver.next();
        } else 
        {
          resolver.redirectUntil(StartupConfigureRoute());
        }
  }
}
