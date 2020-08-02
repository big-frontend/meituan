import 'package:flutter/material.dart';
import 'package:spacecraftflutter/share_data.dart';
import 'dart:ui';
import 'package:spacecraftflutter/ui_widget/button.dart';
import 'package:spacecraftflutter/ui_widget/item.dart';

class Screen_4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen_4_State();
}

class _Screen_4_State extends State<Screen_4> {
  List<Item> itemList = [
    Item(
        leftText: '我的钱包',
        rightText: '办信用卡',
        leftIcon: 'images/mine/icon_mine_wallet.png'),
    Item(
        leftText: '余额',
        rightText: '￥95872385',
        leftIcon: 'images/mine/icon_mine_balance.png'),
    Item(
        leftText: '抵用券',
        rightText: '63',
        leftIcon: 'images/mine/icon_mine_voucher.png'),
    Item(
        leftText: '会员卡',
        rightText: '2',
        leftIcon: 'images/mine/icon_mine_membercard.png'),
    Item(leftText: '好友去哪', leftIcon: 'images/mine/icon_mine_friends.png'),
    Item(leftText: '我的评价', leftIcon: 'images/mine/icon_mine_comment.png'),
    Item(leftText: '我的收藏', leftIcon: 'images/mine/icon_mine_collection.png'),
    Item(
        leftText: '会员中心',
        rightText: 'v15',
        leftIcon: 'images/mine/icon_mine_membercenter.png'),
    Item(
        leftText: '积分商城',
        rightText: '好礼已上线',
        leftIcon: 'images/mine/icon_mine_member.png'),
    Item(
        leftText: '客服中心',
        leftIcon: 'images/mine/icon_mine_customerService.png'),
    Item(
        leftText: '关于美团',
        rightText: '我要合作',
        leftIcon: 'images/mine/icon_mine_aboutmeituan.png')
  ];
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
                          LayoutButton.icon(
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
                            mode: LayoutMode.leftText,
                          ),
                          LayoutButton.icon(
                            onPressed: () => print('个人信息'),
                            label: Text("个人信息",
                                style: TextStyle(
                                    color: Color(0xfff3f3f3), fontSize: 13)),
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xfff3f3f3),
                              size: 18,
                            ),
                            mode: LayoutMode.leftText,
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
          // ListView.separated(
          //   itemCount: 100,
          //   itemBuilder: (BuildContext context, int index) {
          //     return ListTile(title: Text("$index"));
          //   },
          //   separatorBuilder: (BuildContext context, int index) {
          //     return index % 2 == 0 ? divider1 : divider2;
          //   },
          // ),

          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Item item = itemList[index];
                return Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3)),
                    ),
                    child: TextIconItem(item: item));
              },
              childCount: itemList.length, //50个列表项
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
