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
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
      : super(LanguageRoute.name, initialChildren: children);

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageView();
    },
  );
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
/// [WordInfoView]
class WordInfoRoute extends PageRouteInfo<WordInfoRouteArgs> {
  WordInfoRoute({Key? key, required Word word, List<PageRouteInfo>? children})
      : super(
          WordInfoRoute.name,
          args: WordInfoRouteArgs(key: key, word: word),
          initialChildren: children,
        );

  static const String name = 'WordInfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WordInfoRouteArgs>();
      return WordInfoView(key: args.key, word: args.word);
    },
  );
}

class WordInfoRouteArgs {
  const WordInfoRouteArgs({this.key, required this.word});

  final Key? key;

  final Word word;

  @override
  String toString() {
    return 'WordInfoRouteArgs{key: $key, word: $word}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WordInfoRouteArgs) return false;
    return key == other.key && word == other.word;
  }

  @override
  int get hashCode => key.hashCode ^ word.hashCode;
}
