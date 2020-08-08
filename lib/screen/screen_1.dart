import 'package:flutter/material.dart';
import 'package:meituan/ui_widget/appbar.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:meituan/model.dart';
import 'package:meituan/ui_widget/list.dart';
import 'package:meituan/ui_widget/item.dart';
import 'package:meituan/util.dart';
import 'package:meituan/color.dart';
import 'package:meituan/webview.dart';

class Screen_1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen_1_State();
}

class _Screen_1_State extends State<Screen_1> {
  var menuInfos = [
    {'title': '美食', 'icon': 'images/home/icon_homepage_food_category.png'},
    {'title': '电影', 'icon': 'images/home/icon_homepage_movie_category.png'},
    {'title': '酒店', 'icon': 'images/home/icon_homepage_hotel_category.png'},
    {'title': 'KTV', 'icon': 'images/home/icon_homepage_ktv_category.png'},
    {'title': '优惠买单', 'icon': 'images/home/icon_homepage_default.png'},
    {
      'title': '周边游',
      'icon': 'images/home/icon_homepage_foottreat_category.png'
    },
    {
      'title': '生活服务',
      'icon': 'images/home/icon_homepage_life_service_category.png'
    },
    {
      'title': '休闲娱乐',
      'icon': 'images/home/icon_homepage_entertainment_category.png'
    },
    {'title': '丽人/美发', 'icon': 'images/home/icon_homepage_beauty_category.png'},
    {'title': '购物', 'icon': 'images/home/icon_homepage_shopping_category.png'},
    {'title': '丽人/美发', 'icon': 'images/home/icon_homepage_beauty_category.png'},
    {'title': '电影', 'icon': 'images/home/icon_homepage_movie_category.png'},
    {
      'title': '周边游',
      'icon': 'images/home/icon_homepage_foottreat_category.png'
    },
    {'title': '酒店', 'icon': 'images/home/icon_homepage_hotel_category.png'},
    {'title': '优惠买单', 'icon': 'images/home/icon_homepage_default.png'},
    {
      'title': '休闲娱乐',
      'icon': 'images/home/icon_homepage_entertainment_category.png'
    },
    {'title': 'KTV', 'icon': 'images/home/icon_homepage_ktv_category.png'},
  ];

  Future<HomeData> _loadMorePosts() async {
    List<dynamic> re = await Future.wait([
      rootBundle.loadString('assets/json/order_list.json'),
      rootBundle.loadString('assets/json/banner_list.json'),
      Future.delayed(Duration(seconds: 2))
    ]);
    return getDataList(re);
  }

  HomeData getDataList(ret) {
    List<OrderData> orderDatas =
        shuffle(Order.fromJson(json.decode(ret[0])).data);
    List<PromotionData> promotionDatas =
        shuffle(Promotion.fromJson(json.decode(ret[1])).data);
    return HomeData(promotionDatas: promotionDatas, orderDatas: orderDatas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Searchbar(),
      body: Material(
          child: RefreshIndicatorWrapper<HomeData>(
              future: _loadMorePosts,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return createList(snapshot.data);
              })),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  Widget createList(HomeData data) {
    List<OrderData> orderDatas = data.orderDatas;
    List<PromotionData> promotionDatas = data.promotionDatas;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: false,
          backgroundColor: Colors.white,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 12),
              alignment: Alignment.center,
              child: PageView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int pageIndex) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, //Grid按两列显示
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 2.0,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      if (pageIndex == 1) {
                        index = index + 10;
                      }
                      if (index >= menuInfos.length) return Text('');
                      var i = menuInfos[index];
                      return ClipOval(child: Image.asset(i['icon']));
                    },
                  );
                },
              ),
            ),
          ),
        ),
        SliverList(
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.grey[200], width: 10.0))));
        }, childCount: 1)),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              // mainAxisSpacing: 1.0,
              // crossAxisSpacing: 1.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var p = promotionDatas[index];
                var ret = index % 4;
                Border border;
                if (ret == 0) {
                  border = Border(bottom: BorderSide(width: 0.3));
                } else if (ret == 1) {
                  border = Border(left: BorderSide(width: 0.3));
                } else if (ret == 2) {
                  border = Border(right: BorderSide(width: 0.3));
                } else if (ret == 3) {
                  border = Border(top: BorderSide(width: 0.3));
                }
                return GestureDetector(
                  onTap: () =>
                      Webview.openWebview(context, p.tplurl.split('=')[1]),
                  child: Container(
                    decoration: BoxDecoration(border: border),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    // color: Colors.cyan[100 * (index % 9)],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              p.maintitle,
                              style: TextStyle(
                                  color: HexColor.fromHex(p.typeface_color)),
                            ),
                            Text(p.deputytitle),
                          ],
                        ),
                        ClipOval(
                          child: FadeInImage.assetNetwork(
                            image: 'https://picsum.photos/250?image=${gen()}',
                            height: 55,
                            placeholder:
                                'images/home/bg_customReview_image_default.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: promotionDatas.length,
            ),
          ),
        ),
        SliverList(
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
          return Column(children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[200], width: 10.0)))),
            Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.3))),
                padding: EdgeInsets.only(left: 8),
                child: TextIconItem(
                  height: 40,
                  item: Item(leftText: '猜你喜欢'),
                )),
          ]);
        }, childCount: 1)),
        SliverList(
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              OrderData item = orderDatas[index];
              var iti = ImageTextItem(
                leading: FadeInImage.assetNetwork(
                  // image: item.imgurl,
                  image: 'https://picsum.photos/250?image=${gen()}',
                  height: 100,
                  placeholder: 'images/home/bg_customReview_image_default.png',
                ),
                title: Text(item.mname,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item.title),
                price: Text(item.price,
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              );
              return Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3))),
                  child: iti);
            },
            childCount: orderDatas.length, //0个列表项
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen 1 didChangeDependencies");
  }
}

class HomeData {
  final List<PromotionData> promotionDatas;
  final List<OrderData> orderDatas;
  const HomeData({this.promotionDatas, this.orderDatas});
}
