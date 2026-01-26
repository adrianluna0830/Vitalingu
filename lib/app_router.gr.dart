// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ChatPage]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    required LearningUnit learningUnit,
    List<PageRouteInfo>? children,
  }) : super(
         ChatRoute.name,
         args: ChatRouteArgs(key: key, learningUnit: learningUnit),
         initialChildren: children,
       );

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return ChatPage(key: args.key, learningUnit: args.learningUnit);
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.learningUnit});

  final Key? key;

  final LearningUnit learningUnit;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, learningUnit: $learningUnit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatRouteArgs) return false;
    return key == other.key && learningUnit == other.learningUnit;
  }

  @override
  int get hashCode => key.hashCode ^ learningUnit.hashCode;
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [HomeSettingsPage]
class HomeSettingsRoute extends PageRouteInfo<void> {
  const HomeSettingsRoute({List<PageRouteInfo>? children})
    : super(HomeSettingsRoute.name, initialChildren: children);

  static const String name = 'HomeSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeSettingsPage();
    },
  );
}

/// generated route for
/// [HomeTabPage]
class HomeTabRoute extends PageRouteInfo<void> {
  const HomeTabRoute({List<PageRouteInfo>? children})
    : super(HomeTabRoute.name, initialChildren: children);

  static const String name = 'HomeTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeTabPage();
    },
  );
}

/// generated route for
/// [HomeUnitsPage]
class HomeUnitsRoute extends PageRouteInfo<void> {
  const HomeUnitsRoute({List<PageRouteInfo>? children})
    : super(HomeUnitsRoute.name, initialChildren: children);

  static const String name = 'HomeUnitsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeUnitsPage();
    },
  );
}

/// generated route for
/// [HomeWordsPage]
class HomeWordsRoute extends PageRouteInfo<void> {
  const HomeWordsRoute({List<PageRouteInfo>? children})
    : super(HomeWordsRoute.name, initialChildren: children);

  static const String name = 'HomeWordsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeWordsPage();
    },
  );
}

/// generated route for
/// [StartupIntroductionPage]
class StartupIntroductionRoute extends PageRouteInfo<void> {
  const StartupIntroductionRoute({List<PageRouteInfo>? children})
    : super(StartupIntroductionRoute.name, initialChildren: children);

  static const String name = 'StartupIntroductionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartupIntroductionPage();
    },
  );
}

/// generated route for
/// [StartupLevelConfigurePage]
class StartupLevelConfigureRoute extends PageRouteInfo<void> {
  const StartupLevelConfigureRoute({List<PageRouteInfo>? children})
    : super(StartupLevelConfigureRoute.name, initialChildren: children);

  static const String name = 'StartupLevelConfigureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartupLevelConfigurePage();
    },
  );
}

/// generated route for
/// [StartupNativeLanguagePage]
class StartupNativeLanguageRoute extends PageRouteInfo<void> {
  const StartupNativeLanguageRoute({List<PageRouteInfo>? children})
    : super(StartupNativeLanguageRoute.name, initialChildren: children);

  static const String name = 'StartupNativeLanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartupNativeLanguagePage();
    },
  );
}

/// generated route for
/// [StartupTargetLanguagePage]
class StartupTargetLanguageRoute extends PageRouteInfo<void> {
  const StartupTargetLanguageRoute({List<PageRouteInfo>? children})
    : super(StartupTargetLanguageRoute.name, initialChildren: children);

  static const String name = 'StartupTargetLanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartupTargetLanguagePage();
    },
  );
}
