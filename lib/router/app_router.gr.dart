// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppStartupLoadingView]
class AppStartupLoadingRoute extends PageRouteInfo<void> {
  const AppStartupLoadingRoute({List<PageRouteInfo>? children})
      : super(AppStartupLoadingRoute.name, initialChildren: children);

  static const String name = 'AppStartupLoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppStartupLoadingView();
    },
  );
}

/// generated route for
/// [LanguageView]
class LanguageRoute extends PageRouteInfo<LanguageRouteArgs> {
  LanguageRoute({Key? key, List<PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          args: LanguageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LanguageRouteArgs>(
        orElse: () => const LanguageRouteArgs(),
      );
      return LanguageView(key: args.key);
    },
  );
}

class LanguageRouteArgs {
  const LanguageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LanguageRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LanguageRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [SelectLanguageView]
class SelectLanguageRoute extends PageRouteInfo<void> {
  const SelectLanguageRoute({List<PageRouteInfo>? children})
      : super(SelectLanguageRoute.name, initialChildren: children);

  static const String name = 'SelectLanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SelectLanguageView();
    },
  );
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsView();
    },
  );
}

/// generated route for
/// [VoiceChatView]
class VoiceChatRoute extends PageRouteInfo<VoiceChatRouteArgs> {
  VoiceChatRoute({Key? key, List<PageRouteInfo>? children})
      : super(
          VoiceChatRoute.name,
          args: VoiceChatRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'VoiceChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VoiceChatRouteArgs>(
        orElse: () => const VoiceChatRouteArgs(),
      );
      return VoiceChatView(key: args.key);
    },
  );
}

class VoiceChatRouteArgs {
  const VoiceChatRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'VoiceChatRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VoiceChatRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
