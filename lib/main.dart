import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:meituan/routes.dart';
import 'package:meituan/splash.dart';
import 'package:meituan/share_data.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
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
