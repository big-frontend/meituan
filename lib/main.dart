import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spacecraftflutter/routes.dart';
import 'package:spacecraftflutter/pages/splash.dart';

const s = 'adfdf';
void main() {
  print(s);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const app_title = 'Flutter Demo';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app_title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return const ApplyTextOptions(
    //   child:SplashPage(
    //     // child:Backdrop(),
    //   ),
    // );
    return SplashPage(title: 'Flutter Demo Home Page');
  }
}
