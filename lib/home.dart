import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:meituan/routes.dart';
import 'package:meituan/share_data.dart';
import 'package:flutter/services.dart';
import 'package:meituan/screen/screen_1.dart';
import 'package:meituan/screen/screen_2.dart';
import 'package:meituan/screen/screen_3.dart';
import 'package:meituan/screen/screen_4.dart';
import 'package:meituan/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<Widget> screens = List<Widget>();
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    print("home initState");
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    screens.add(Screen_1());
    screens.add(Screen_2());
    screens.add(Screen_3());
    screens.add(Screen_4());
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("home didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("home deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("home dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("home reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("home didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: HexColor.fromHex('#979797'),
        selectedItemColor: Color(0xff06C1AE),
        selectedLabelStyle: TextStyle(color: Color(0xff06C1AE)),
        unselectedLabelStyle: TextStyle(color: HexColor.fromHex('#979797')),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              '首页',
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              title: Text(
                '附近',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edit,
              ),
              title: Text(
                '订单',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text(
                '我的',
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   child: IconTheme(
      //     data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      //     child: Row(
      //       children: <Widget>[
      //         IconButton(
      //           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //           icon: const Icon(Icons.menu),
      //           onPressed: () => print('icon button'),
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.search),
      //           onPressed: () => print('icon button'),
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.favorite),
      //           onPressed: () => print('icon button'),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
