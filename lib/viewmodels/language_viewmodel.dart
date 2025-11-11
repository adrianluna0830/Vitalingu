import 'package:injectable/injectable.dart';
import 'package:vitalingu/services/navigation_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';

@injectable
class LanguageViewModel  extends ViewModelBase {
  final NavigationService _navigationService;

  LanguageViewModel(this._navigationService, {required super.navigationService});

  void goToSettings() {
    _navigationService.goToSettings();
  }
}
