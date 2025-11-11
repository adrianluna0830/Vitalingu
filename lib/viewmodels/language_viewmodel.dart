import 'package:injectable/injectable.dart';
import 'package:vitalingu/services/navigation_service.dart';

@injectable
class LanguageViewModel {
  final NavigationService _navigationService;

  LanguageViewModel(this._navigationService);

  void goToSettings() {
    _navigationService.goToSettings();
  }
}
