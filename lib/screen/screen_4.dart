import 'package:flutter/material.dart';
import 'package:spacecraftflutter/share_data.dart';
import 'dart:ui';
import 'package:spacecraftflutter/button.dart';

class Screen_4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen_4_State();
}

class _Screen_4_State extends State<Screen_4> {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    Options opt = Options.of(context);
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            // expandedHeight: MediaQueryData.fromWindow(window).padding.top,
            expandedHeight: 150.0,
            backgroundColor: Color(0xff06C1AE),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 44),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('images/mine/avatar.png'),
                          width: 40.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 44),
                      height: 50,
                      child: Column(
                        children: <Widget>[
                          RightButton.icon(
                            label: Text(
                              "吃地瓜的电解质",
                              style: TextStyle(color: Color(0xfff3f3f3)),
                            ),
                            icon: Image(
                              image: AssetImage(
                                  'images/mine/beauty_technician_v15.png'),
                              width: 19.0,
                            ),
                            onPressed: () => print('吃地瓜的电解质'),
                          ),
                          RightButton.icon(
                            onPressed: () => print('个人信息'),
                            label: Text("个人信息",
                                style: TextStyle(
                                    color: Color(0xfff3f3f3), fontSize: 13)),
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xfff3f3f3),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.settings), onPressed: () async {}),
              IconButton(icon: Icon(Icons.sms), onPressed: () async {})
            ],
          ),
          // Expanded(
          //   child: ListView.separated(
          //     itemCount: 100,
          //     itemBuilder: (BuildContext context, int index) {
          //       return ListTile(title: Text("$index"));
          //     },
          //     separatorBuilder: (BuildContext context, int index) {
          //       return index % 2 == 0 ? divider1 : divider2;
          //     },
          //   ),
          // )
          SliverFixedExtentList(
            itemExtent: 20,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              },
              childCount: 50, //50个列表项
            ),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen 4 didChangeDependencies");
  }
}
