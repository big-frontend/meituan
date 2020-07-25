import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spacecraftflutter/main.dart';
import 'package:spacecraftflutter/home.dart';
import 'package:spacecraftflutter/splash.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String);

class Path {
  const Path(this.pattern, this.builder);
  final String pattern;
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(r'^/', (context, match) => const SplashPage()),
    Path(r'^/home', (context, match) => const HomePage()),
    // Path(r'^/home', (context, match) => const HomePage())
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMath = regExpPattern.firstMatch(settings.name);
        final match = (firstMath.groupCount == 1) ? firstMath.group(1) : null;
        if (kIsWeb) {
          return NoAnimationMaterialPageRoute<void>(
              builder: (context) => path.builder(context, match));
        }

        return MaterialPageRoute<void>(
            builder: (context) => path.builder(context, match),
            settings: settings);
      }
    }
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
