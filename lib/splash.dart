import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spacecraftflutter/routes.dart';
import 'package:spacecraftflutter/share_data.dart';
import 'package:spacecraftflutter/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  void jump(BuildContext context) async {
    // Options.update(context, Options(themeMode: ThemeMode.light))
    // Navigator.of(context).pushNamed(r'^/home');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(new Duration(seconds: 5), () {
      jump(context);
    });
    return Scaffold(
      body: Center(
        child: Text('hello splash'),
      ),
    );
  }
}
