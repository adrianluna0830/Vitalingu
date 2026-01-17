
import 'package:injectable/injectable.dart';
import 'package:vitalingu/app_router.dart';

@singleton
class NavigationService {
  final AppRouter _router;

  NavigationService(this._router);

  Future<void> goToHome() async {
    await _router.replaceAll([const HomeRoute()]);
  }

}