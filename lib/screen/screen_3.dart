import 'package:flutter/material.dart';
import 'package:spacecraftflutter/share_data.dart';
import 'package:spacecraftflutter/ui_widget/item.dart';
import 'package:spacecraftflutter/ui_widget/button.dart';

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
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 161.0,
            leading: Container(
              margin: EdgeInsets.only(left: 15),
              alignment: Alignment.center,
              child: Text(
                '订单',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                  padding: EdgeInsets.only(
                      top: AppBar().preferredSize.height +
                          MediaQuery.of(context).padding.top),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: TextIconItem(
                          height: 40,
                          item: Item(leftText: '我的订单', rightText: '全部订单'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LayoutButton.icon(
                            label: Text("待付款"),
                            icon: Image.asset(
                              'images/order/order_tab_need_pay.png',
                              width: 30,
                              height: 30,
                            ),
                            mode: LayoutMode.bottomText,
                          ),
                          LayoutButton.icon(
                            label: Text("待使用"),
                            icon: Image.asset(
                              'images/order/order_tab_need_use.png',
                              width: 30,
                              height: 30,
                            ),
                            mode: LayoutMode.bottomText,
                          ),
                          LayoutButton.icon(
                            label: Text("待评价"),
                            icon: Image.asset(
                              'images/order/order_tab_need_review.png',
                              width: 30,
                              height: 30,
                            ),
                            mode: LayoutMode.bottomText,
                          ),
                          LayoutButton.icon(
                            label: Text("退款/售后"),
                            icon: Image.asset(
                              'images/order/order_tab_needoffer_aftersale.png',
                              width: 30,
                              height: 30,
                            ),
                            mode: LayoutMode.bottomText,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            // 下滑线浅灰色，宽度1像素
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[200], width: 10.0))),
                      )
                    ],
                  )),
            ),
          ),
          //PreferredSize(
          // preferredSize: Size.fromHeight(40.0),
          // ),
          SliverFixedExtentList(
            itemExtent: 100, //100
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.3))),
                    child: ImageTextItem(
                      item: ImageText(
                        title: '南京大排档',
                        subtitle:
                            '全部订单全部订单全部订单全部订单全部订单全部订单全部订单全部订单全部订单全部订单全部订单全部订单',
                        price: "85元",
                        // url:
                        //     "http://p1.meituan.net/w.h/deal/91b3517c6cab016fb71a23b98fb56acf56588.jpg@0_6_640_387a%7C388h_640w_2e_100q",
                        url: 'https://picsum.photos/250?image=9',
                      ),
                    ));
              },
              childCount: 50, //50个列表项
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen 3 didChangeDependencies");
  }
}
