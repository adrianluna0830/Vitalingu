// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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
/// [HomeTopicsPage]
class HomeTopicsRoute extends PageRouteInfo<void> {
  const HomeTopicsRoute({List<PageRouteInfo>? children})
    : super(HomeTopicsRoute.name, initialChildren: children);

  static const String name = 'HomeTopicsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeTopicsPage();
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
/// [StartupConfigurePage]
class StartupConfigureRoute extends PageRouteInfo<StartupConfigureRouteArgs> {
  StartupConfigureRoute({
    Key? key,
    required dynamic Function(StartupConfigureValues) onConfigurationComplete,
    List<PageRouteInfo>? children,
  }) : super(
         StartupConfigureRoute.name,
         args: StartupConfigureRouteArgs(
           key: key,
           onConfigurationComplete: onConfigurationComplete,
         ),
         initialChildren: children,
       );

  static const String name = 'StartupConfigureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StartupConfigureRouteArgs>();
      return StartupConfigurePage(
        key: args.key,
        onConfigurationComplete: args.onConfigurationComplete,
      );
    },
  );
}

class StartupConfigureRouteArgs {
  const StartupConfigureRouteArgs({
    this.key,
    required this.onConfigurationComplete,
  });

  final Key? key;

  final dynamic Function(StartupConfigureValues) onConfigurationComplete;

  @override
  String toString() {
    return 'StartupConfigureRouteArgs{key: $key, onConfigurationComplete: $onConfigurationComplete}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StartupConfigureRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
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
class StartupLevelConfigureRoute
    extends PageRouteInfo<StartupLevelConfigureRouteArgs> {
  StartupLevelConfigureRoute({
    Key? key,
    required dynamic Function(CEFR) onLevelSelected,
    required VoidCallback onNext,
    List<PageRouteInfo>? children,
  }) : super(
         StartupLevelConfigureRoute.name,
         args: StartupLevelConfigureRouteArgs(
           key: key,
           onLevelSelected: onLevelSelected,
           onNext: onNext,
         ),
         initialChildren: children,
       );

  static const String name = 'StartupLevelConfigureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StartupLevelConfigureRouteArgs>();
      return StartupLevelConfigurePage(
        key: args.key,
        onLevelSelected: args.onLevelSelected,
        onNext: args.onNext,
      );
    },
  );
}

class StartupLevelConfigureRouteArgs {
  const StartupLevelConfigureRouteArgs({
    this.key,
    required this.onLevelSelected,
    required this.onNext,
  });

  final Key? key;

  final dynamic Function(CEFR) onLevelSelected;

  final VoidCallback onNext;

  @override
  String toString() {
    return 'StartupLevelConfigureRouteArgs{key: $key, onLevelSelected: $onLevelSelected, onNext: $onNext}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StartupLevelConfigureRouteArgs) return false;
    return key == other.key && onNext == other.onNext;
  }

  @override
  int get hashCode => key.hashCode ^ onNext.hashCode;
}

/// generated route for
/// [StartupNativeLanguagePage]
class StartupNativeLanguageRoute
    extends PageRouteInfo<StartupNativeLanguageRouteArgs> {
  StartupNativeLanguageRoute({
    Key? key,
    required dynamic Function(SupportedLanguagesBcp47) onLanguageSelected,
    List<PageRouteInfo>? children,
  }) : super(
         StartupNativeLanguageRoute.name,
         args: StartupNativeLanguageRouteArgs(
           key: key,
           onLanguageSelected: onLanguageSelected,
         ),
         initialChildren: children,
       );

  static const String name = 'StartupNativeLanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StartupNativeLanguageRouteArgs>();
      return StartupNativeLanguagePage(
        key: args.key,
        onLanguageSelected: args.onLanguageSelected,
      );
    },
  );
}

class StartupNativeLanguageRouteArgs {
  const StartupNativeLanguageRouteArgs({
    this.key,
    required this.onLanguageSelected,
  });

  final Key? key;

  final dynamic Function(SupportedLanguagesBcp47) onLanguageSelected;

  @override
  String toString() {
    return 'StartupNativeLanguageRouteArgs{key: $key, onLanguageSelected: $onLanguageSelected}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StartupNativeLanguageRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [StartupTargetLanguagePage]
class StartupTargetLanguageRoute
    extends PageRouteInfo<StartupTargetLanguageRouteArgs> {
  StartupTargetLanguageRoute({
    Key? key,
    required dynamic Function(SupportedLanguagesBcp47) onLanguageSelected,
    List<PageRouteInfo>? children,
  }) : super(
         StartupTargetLanguageRoute.name,
         args: StartupTargetLanguageRouteArgs(
           key: key,
           onLanguageSelected: onLanguageSelected,
         ),
         initialChildren: children,
       );

  static const String name = 'StartupTargetLanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StartupTargetLanguageRouteArgs>();
      return StartupTargetLanguagePage(
        key: args.key,
        onLanguageSelected: args.onLanguageSelected,
      );
    },
  );
}

class StartupTargetLanguageRouteArgs {
  const StartupTargetLanguageRouteArgs({
    this.key,
    required this.onLanguageSelected,
  });

  final Key? key;

  final dynamic Function(SupportedLanguagesBcp47) onLanguageSelected;

  @override
  String toString() {
    return 'StartupTargetLanguageRouteArgs{key: $key, onLanguageSelected: $onLanguageSelected}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StartupTargetLanguageRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
