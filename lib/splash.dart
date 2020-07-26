import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spacecraftflutter/routes.dart';
import 'package:spacecraftflutter/share_data.dart';
import 'package:spacecraftflutter/home.dart';
import 'package:quiver/async.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SplashPage> {
  void jump(BuildContext context) {
    // Options.update(context, Options(themeMode: ThemeMode.light))
    // Navigator.of(context).pushNamed(r'^/home');

    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
    //   return HomePage();
    // }), (route) => route == null);
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }

  @override
  void initState() {
    super.initState();
    print("splash initState");
    startTimer();
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      print("splash addPostFrameCallback be invoke");
    });
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("splash didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("splash deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("splash dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("splash reassemble");
    startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("splash didChangeDependencies");
  }

  int _start = 3;
  int _current = 4;

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
      jump(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("splash build");

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'hello splash',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 28,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(_current.toString() + '/' + _start.toString()),
          ),
        ]),
      ),
    );
  }
}
