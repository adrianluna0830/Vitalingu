import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/views/language_view.dart';
import 'package:vitalingu/views/select_language_view.dart';
import 'package:vitalingu/views/settings_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LanguageRoute.page, initial: false),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: SelectLanguageRoute.page, initial: true),

      ];
}
