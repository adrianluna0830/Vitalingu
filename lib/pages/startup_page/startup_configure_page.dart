import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/widgets/page_slider/navigation_controls.dart';

@RoutePage()
class StartupConfigurePage extends StatefulWidget {
  const StartupConfigurePage({super.key, required this.onConfigurationComplete});
  final Function(StartupConfigureValues values) onConfigurationComplete;

  @override
  State<StartupConfigurePage> createState() => _StartupConfigurePageState();
}

class _StartupConfigurePageState extends State<StartupConfigurePage> {

  late SupportedLanguagesBcp47 nativeLanguage;
  late SupportedLanguagesBcp47 targetLanguage;
  late CEFR selectedLevel;


  void onResult()
  {
    StartupConfigureValues values = StartupConfigureValues(
      nativeLanguage: nativeLanguage,
      targetLanguage: targetLanguage,
      selectedLevel: selectedLevel,
    );
    widget.onConfigurationComplete(values);
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes:  [
        StartupIntroductionRoute(),
        StartupNativeLanguageRoute(onLanguageSelected: (SupportedLanguagesBcp47 p1) { nativeLanguage = p1; }),
        StartupTargetLanguageRoute(onLanguageSelected: (SupportedLanguagesBcp47 p1) { targetLanguage = p1; }),
        StartupLevelConfigureRoute(onLevelSelected: (CEFR p1) { selectedLevel = p1; }, onNext: () { onResult(); }),
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

class StartupConfigureValues
{
  final SupportedLanguagesBcp47 nativeLanguage;
  final SupportedLanguagesBcp47 targetLanguage;
  final CEFR selectedLevel;

  StartupConfigureValues({
    required this.nativeLanguage,
    required this.targetLanguage,
    required this.selectedLevel,
  });
}