import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/core/models/language/learning_unit.dart';
import 'package:vitalingu/features/chat/pages/chat_page.dart';
import 'package:vitalingu/core/router/guards/has_configured_guard.dart';
import 'package:vitalingu/features/home/pages/home_page.dart';
import 'package:vitalingu/features/home/pages/home_settings_page.dart';
import 'package:vitalingu/features/home/pages/home_tab_page.dart';
import 'package:vitalingu/features/home/pages/home_units_page.dart';
import 'package:vitalingu/features/home/pages/home_words_page.dart';
import 'package:vitalingu/features/startup/pages/startup_introduction_page.dart';
import 'package:vitalingu/features/startup/pages/startup_level_configure_page.dart';
import 'package:vitalingu/features/startup/pages/startup_native_language_page.dart';
import 'package:vitalingu/features/startup/pages/startup_target_language_page.dart';
import 'package:vitalingu/features/learning/pages/unit_explanation_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {

 
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: StartupIntroductionRoute.page),
        AutoRoute(page: StartupNativeLanguageRoute.page),
        AutoRoute(page: StartupTargetLanguageRoute.page),
        AutoRoute(page: StartupLevelConfigureRoute.page),
      
    
    AutoRoute(page: HomeTabRoute.page,initial: true, guards: [StartupCompletedGuard()], children: 
    [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: HomeUnitsRoute.page),
      AutoRoute(page: HomeWordsRoute.page),
      AutoRoute(page: HomeSettingsRoute.page),
    ]),
    AutoRoute(page: ChatRoute.page),
    AutoRoute(page: UnitExplanationRoute.page),
  ];
}
