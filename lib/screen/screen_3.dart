import 'package:flutter/material.dart';
import 'package:spacecraftflutter/share_data.dart';

class Screen_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen_3_State();
}

class _Screen_3_State extends State<Screen_3> {
  int _counter = 0;
  int _currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Options opt = Options.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Screen_3 ${opt.themeMode}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('change theme mode'),
              onPressed: () => Options.update(
                context,
                Options(
                    themeMode: opt.themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark),
              ),
            ),
            Text(
              'You have pushed the button this many times:1',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.asset('images/home/icon_homepage_foottreat_category.png'),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen 3 didChangeDependencies");
  }
}
