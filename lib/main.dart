import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spacecraftflutter/routes.dart';
import 'package:spacecraftflutter/splash.dart';
import 'package:spacecraftflutter/share_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const app_title = 'Flutter Demo';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SharedDataWidget(
      initialModel: Options(themeMode: ThemeMode.dark),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: app_title,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // home: MyHomePage(title: 'Flutter Demo Home Page'),
            onGenerateRoute: RouteConfiguration.onGenerateRoute,
          );
        },
      ),
    );
    // return MaterialApp(
    //   title: app_title,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   // home: MyHomePage(title: 'Flutter Demo Home Page'),
    //   onGenerateRoute: RouteConfiguration.onGenerateRoute,
    // );
  }
}

// class RootPage extends StatelessWidget {
//   const RootPage({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ApplyOptions(
//       child: SplashPage(),
//     );
//   }
// }
