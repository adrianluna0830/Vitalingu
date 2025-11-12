import 'package:vitalingu/services/navigation_service.dart';
import 'package:vitalingu/services/scope_manager_service.dart';

abstract class ViewModelBase {
  final NavigationService navigationService;
  final ScopeManagerService scopeManagerService;

  ViewModelBase({
    required this.navigationService,
    required this.scopeManagerService,
  });
}