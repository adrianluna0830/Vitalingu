import 'package:vitalingu/core/services/navigation_service.dart';

abstract class ViewModelBase {
  final NavigationService navigationService;

  ViewModelBase({
    required this.navigationService,
  });
}
