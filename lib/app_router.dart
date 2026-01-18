import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/pages/guards/has_configured_guard.dart';
import 'package:vitalingu/pages/home_page/home_page.dart';
import 'package:vitalingu/pages/home_page/home_settings_page.dart';
import 'package:vitalingu/pages/home_page/home_tab_page.dart';
import 'package:vitalingu/pages/home_page/home_topics_page.dart';
import 'package:vitalingu/pages/home_page/home_words_page.dart';
import 'package:vitalingu/pages/startup_page/startup_configure_page.dart';
import 'package:vitalingu/pages/startup_page/startup_introduction_page.dart';
import 'package:vitalingu/pages/startup_page/startup_level_configure_page.dart';
import 'package:vitalingu/pages/startup_page/startup_native_language_page.dart';
import 'package:vitalingu/pages/startup_page/startup_target_language_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {

 
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: StartupConfigureRoute.page,children: 
      [
        AutoRoute(page: StartupIntroductionRoute.page),
        AutoRoute(page: StartupNativeLanguageRoute.page),
        AutoRoute(page: StartupTargetLanguageRoute.page),
        AutoRoute(page: StartupLevelConfigureRoute.page),
      ]
    ),
    AutoRoute(page: HomeTabRoute.page,initial: true, guards: [HasConfiguredGuard()], children: 
    [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: HomeTopicsRoute.page),
      AutoRoute(page: HomeWordsRoute.page),
      AutoRoute(page: HomeSettingsRoute.page),
    ]),
  ];
}
