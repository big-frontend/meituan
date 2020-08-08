import 'package:flutter/material.dart';
import 'package:meituan/share_data.dart';
import 'package:meituan/ui_widget/item.dart';
import 'package:meituan/ui_widget/button.dart';
import 'package:meituan/ui_widget/list.dart';
import 'dart:math';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:meituan/model.dart';
import 'package:meituan/util.dart';

class Screen_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen_3_State();
}

class _Screen_3_State extends State<Screen_3> {
  @override
  void initState() {}

  Future<List<ImageText>> _loadMorePosts() async {
    List<dynamic> re = await Future.wait([
      rootBundle.loadString('assets/json/order_list.json'),
      Future.delayed(Duration(seconds: 1)),
    ]);
    return getDataList(re[0]);
  }

  List<ImageText> getDataList(rawData) {
    return shuffle(Order.fromJson(json.decode(rawData)).data)
        .map((e) => ImageText(
            url: 'https://picsum.photos/250?image=${gen()}',
            // url: e.imgurl,
            title: e.mname,
            subtitle: e.title,
            price: e.price))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Options opt = Options.of(context);
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
              SliverAppBar(
                leading: Container(
                  margin: EdgeInsets.only(left: 15),
                  alignment: Alignment.center,
                  child: Text(
                    '订单',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                elevation: 10,
                expandedHeight: 201.0,
                pinned: true,
                backgroundColor: Colors.white,
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
                                // 下滑线浅灰色，宽度1像���
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey[200], width: 10.0))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: TextIconItem(
                              height: 40,
                              item: Item(leftText: '我的收藏', rightText: '查看全部'),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
        body: RefreshIndicatorWrapper<List<ImageText>>(
            future: _loadMorePosts,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return createList(snapshot.data);
            }));
  }

  Widget createList(List<ImageText> imagetextList) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        ImageText item = imagetextList[index];
        Widget itemWidget;
        // if (index % 2 == 0) {
        if (true) {
          itemWidget = ImageTextItem(
            // leading: Image(
            //     image: NetworkImage(item.url),
            //     height: 100),
            leading: FadeInImage.assetNetwork(
              image: item.url,
              height: 100,
              placeholder: 'images/home/bg_customReview_image_default.png',
            ),
            title:
                Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(item.subtitle),
            price: Text(item.price,
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold)),
          );
        } else {
          itemWidget = ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FadeInImage.assetNetwork(
                  placeholder: 'images/home/bg_customReview_image_default.png',
                  image: item.url),
            ),
            title:
                Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 6, bottom: 6),
                  child: Text(item.subtitle),
                ),
                Text(
                  item.price,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }
        return itemWidget;
        // return Container(
        //     decoration: BoxDecoration(
        //         border: Border(bottom: BorderSide(width: 0.3))),
        //     child: item);
      },
      itemCount: imagetextList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(thickness: 0.3, color: Colors.black38);
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen 3 didChangeDependencies");
  }
}

class ImageText {
  ImageText({this.height, this.url, this.title, this.subtitle, this.price});
  final double height;
  final String url;
  final String title;
  final String subtitle;
  final String price;
  @override
  String toString() =>
      '{"height":$height,"url":$url,"title":$title,"subtitle":$subtitle,"price":$price}';
}
