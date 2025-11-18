import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/features/startup/presentation/view/app_startup_loading_view.dart';
import 'package:vitalingu/features/language_management/presentation/view/language_view.dart';
import 'package:vitalingu/features/language_management/presentation/view/select_language_view.dart';
import 'package:vitalingu/features/settings/presentation/view/settings_view.dart';
import 'package:vitalingu/features/voice_chat/presentation/view/voice_chat_view.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: VoiceChatRoute.page),
        AutoRoute(page: LanguageRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: SelectLanguageRoute.page),
        AutoRoute(page: AppStartupLoadingRoute.page, initial: true),
      ];
}

