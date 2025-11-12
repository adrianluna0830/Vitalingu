import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/views/app_startup_loading_view.dart';
import 'package:vitalingu/views/language_view.dart';
import 'package:vitalingu/views/select_language_view.dart';
import 'package:vitalingu/views/settings_view.dart';
import 'package:vitalingu/views/word_info_view.dart';
import 'package:vitalingu/word/word.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LanguageRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: SelectLanguageRoute.page),
        AutoRoute(page: WordInfoRoute.page),
        AutoRoute(page: AppStartupLoadingRoute.page, initial: true),

      ];
}
