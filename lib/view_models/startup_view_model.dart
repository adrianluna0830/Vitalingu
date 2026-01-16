import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:auto_route/auto_route.dart';

@injectable
class StartupViewModel {
  final Signal<int> _currentIndex = signal(0);

  int get currentIndex => _currentIndex.value;
  Signal<int> get currentIndexSignal => _currentIndex;

  void setIndex(int index) {
    _currentIndex.value = index;
  }

  void next(TabsRouter tabsRouter) {
    if (tabsRouter.activeIndex < tabsRouter.pageCount - 1) {
      tabsRouter.setActiveIndex(tabsRouter.activeIndex + 1);
    } else {
    }
  }

  void previous(TabsRouter tabsRouter) {
    if (tabsRouter.activeIndex > 0) {
      tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1);
    }
  }
}
