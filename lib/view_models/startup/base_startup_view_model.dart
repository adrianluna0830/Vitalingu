import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/view_models/base_view_model.dart';

class BaseStartupState {
  final bool canContinue;

  BaseStartupState({required this.canContinue});
}

abstract class BaseStartupViewModel<T extends BaseStartupState>
    extends BaseViewModel<T> {
  BaseStartupViewModel(super.initialState);

  void navigateNext(TabsRouter tabsRouter) {
    if (tabsRouter.activeIndex < tabsRouter.pageCount - 1) {
      tabsRouter.setActiveIndex(tabsRouter.activeIndex + 1);
    }
  }

  void navigatePrevious(TabsRouter tabsRouter) {
    if (tabsRouter.activeIndex > 0) {
      tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1);
    }
  }
}
