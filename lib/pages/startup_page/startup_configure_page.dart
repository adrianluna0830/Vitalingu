import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/widgets/page_slider/navigation_controls.dart';

@RoutePage()
class StartupConfigurePage extends StatefulWidget {
  const StartupConfigurePage({super.key});

  @override
  State<StartupConfigurePage> createState() => _StartupConfigurePageState();
}

class _StartupConfigurePageState extends State<StartupConfigurePage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes:  [
        StartupIntroductionRoute(),
        StartupNativeLanguageRoute(),
        StartupTargetLanguageRoute(),
        StartupLevelConfigureRoute(),
      ],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        final totalPages = 4;
        
        return Scaffold(
          body: Stack(
            children: [
              child,
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: NavigationControls(
                  currentIndex: tabsRouter.activeIndex,
                  totalPages: totalPages,
                  onPrevious: () => tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1),
                  onNext: () => tabsRouter.setActiveIndex(tabsRouter.activeIndex + 1),
                ),
              ),
            ],
          ),
        );        
      },
    );
  }
}