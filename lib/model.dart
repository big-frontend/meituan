import 'dart:convert';

class Order {
  Server server;
  List<OrderData> data;
  Tab tab;
  dynamic topics;
  String stid;
  Paging paging;
  List<Stid> stids;
  Order.fromJson(Map<String, dynamic> json)
      : server = Server.fromJson(json['server']),
        data =
            List.from(json['data']).map((e) => OrderData.fromJson(e)).toList(),
        tab = Tab.fromJson(json['tab']),
        topics = json['topics'],
        stid = json['stid'],
        paging = Paging.fromJson(json['paging']),
        stids = List.from(json['stids']).map((e) => Stid.fromJson(e)).toList();
  Map<String, dynamic> toJson() => <String, dynamic>{
        'server': server,
        'data': data,
        'tab': tab,
        'topics': topics,
        'stid': stid,
        'paging': paging,
        'stids': stids,
      };
  @override
  String toString() =>
      '{"server":$server,"data":$data,"tab":$tab,"topics":$topics,"stid":$stid,"paging":$paging,"stids":$stids}';
}

class OrderData {
  String mealcount;
  List<Pricecalendar> pricecalendar;
  String rating;
  String channel;
  String range;
  // Optionalattrs optionalattrs;
  int couponendtime;
  String mname;
  String title;
  String brandname;
  int dt;
  String imgurl;
  int rateCount;
  String mlls;
  String price;
  int solds;
  String digestion;
  int end;
  int id;
  int state;
  String value;
  int nobooking;
  String slug;
  String squareimgurl;
  String mtitle;
  String smstitle;
  int festcanuse;
  bool isAvailableToday;
  String cate;
  int couponbegintime;
  String frontPoiCates;
  String subcate;
  int start;
  int dtype;
  String bookinginfo;
  dynamic titleTag;
  String showtype;
  int satisfaction;
  int ctype;
  int applelottery;
  int deposit;
  List<AttrJson> attrJson;
  int status;
  OrderData.fromJson(Map<String, dynamic> json)
      : mealcount = json['mealcount'],
        pricecalendar = (List.from(json['pricecalendar']))
            .map((e) => Pricecalendar.fromJson(e))
            .toList(),
        rating = json['rating'].toString(),
        channel = json['channel'],
        range = json['range'],
        couponendtime = json['couponendtime'],
        mname = json['mname'],
        title = json['title'],
        brandname = json['brandname'],
        dt = json['dt'],
        imgurl = json['imgurl'],
        rateCount = json['rateCount'],
        mlls = json['mlls'],
        price = json['price'].toString(),
        solds = json['solds'],
        digestion = json['digestion'],
        end = json['end'],
        id = json['id'],
        state = json['state'],
        value = json['value'].toString(),
        nobooking = json['nobooking'],
        slug = json['slug'],
        squareimgurl = json['squareimgurl'],
        mtitle = json['mtitle'],
        smstitle = json['smstitle'],
        festcanuse = json['festcanuse'],
        isAvailableToday = json['isAvailableToday'],
        cate = json['cate'],
        couponbegintime = json['couponbegintime'],
        frontPoiCates = json['frontPoiCates'],
        subcate = json['subcate'],
        start = json['start'],
        dtype = json['dtype'],
        bookinginfo = json['bookinginfo'],
        titleTag = json['titleTag'],
        showtype = json['showtype'],
        satisfaction = json['satisfaction'],
        ctype = json['ctype'],
        applelottery = json['applelottery'],
        deposit = json['deposit'],
        attrJson = List.from(json['attrJson']).map((e) {
          return AttrJson.fromJson(e);
        }).toList(),
        // attrJson = json['attrJson'].map((e) {
        //   return AttrJson.fromJson(e);
        // }).toList(),
        status = json['status'] {}
  @override
  String toString() =>
      '{"mealcount":$mealcount,"pricecalendar":$pricecalendar,"rating":$rating,"channel":$channel,"range":$range,"couponendtime":$couponendtime,"mname":$mname,"title":$title,"brandname":$brandname,"dt":$dt,"imgurl":$imgurl,"rateCount":$rateCount,"mlls":$mlls,"price":$price,"solds":$solds,"digestion":$digestion,"end":$end,"id":$id,"state":$state,"value":$value,"nobooking":$nobooking,"slug":$slug,"squareimgurl":$squareimgurl,"mtitle":$mtitle,"smstitle":$smstitle,"festcanuse":$festcanuse,"isAvailableToday":$isAvailableToday,"cate":$cate,"couponbegintime":$couponbegintime,"frontPoiCates":$frontPoiCates,"subcate":$subcate,"start":$start,"dtype":$dtype,"bookinginfo":$bookinginfo,"titleTag":$titleTag,"showtype":$showtype,"satisfaction":$satisfaction,"ctype":$ctype,"applelottery":$applelottery,"deposit":$deposit,"attrJson":$attrJson,"status":$status}';
}

// class Optionalattrs {
//   String 11;
//   String 13;
// }
class AttrJson {
  String iconname;
  int key;
  int status;
  AttrJson.fromJson(Map<String, dynamic> json)
      : iconname = json['iconname'],
        key = json['key'],
        status = json['status'];
  @override
  String toString() => '{"iconname":$iconname,"key":$key,"status":$status}';
}

class Pricecalendar {
  int buyprice;
  int dealid;
  String price;
  List<dynamic> range;
  int endtime;
  int id;
  int starttime;
  int type;
  String desc;
  Pricecalendar.fromJson(Map<String, dynamic> json)
      : buyprice = json['buyprice'],
        dealid = json['dealid'],
        price = json['price'].toString(),
        range = json['range'],
        endtime = json['endtime'],
        id = json['id'],
        starttime = json['starttime'],
        type = json['type'],
        desc = json['desc'];
  @override
  String toString() =>
      '{"buyprice":$buyprice,"dealid":$dealid,"price":$price,"range":$range,"endtime":$endtime,"id":$id,"starttime":$starttime,"type":$type,"desc":$desc}';
}

class Server {
  int time;
  Server.fromJson(Map<String, dynamic> json) : time = json['time'];
  @override
  String toString() => '{"time":$time}';
}

class Stid {
  int dealid;
  String stid;
  Stid.fromJson(Map<String, dynamic> json)
      : dealid = json['dealid'],
        stid = json['stid'];
  @override
  String toString() => '{"dealid":$dealid,"stid":$stid}';
}

class Paging {
  int count;
  Paging.fromJson(Map<String, dynamic> json) : count = json['count'];
  @override
  String toString() => '{"count":$count}';
}

class Tab {
  String tabTitle;
  String normalTitle;
  Tab.fromJson(Map<String, dynamic> json)
      : tabTitle = json['tabTitle'],
        normalTitle = json['normalTitle'];
  @override
  String toString() => '{"tabTitle":$tabTitle,"normalTitle":$normalTitle}';
}

class Promotion {
  String stid;
  List<PromotionData> data;
  Server server;
  Paging paging;
  Promotion.fromJson(Map<String, dynamic> json)
      : stid = json['stid'],
        server = Server.fromJson(json['server']),
        data = List.from(json['data'])
            .map((e) => PromotionData.fromJson(e))
            .toList(),
        paging = Paging.fromJson(json['paging']);
  @override
  String toString() =>
      '{"stid":$stid,"server":$server,"paging":$paging,"data":$data}';
}

class PromotionData {
  String typeface_color;
  int position;
  bool module;
  String maintitle;
  int type;
  String deputytitle;
  int solds;
  int id;
  Share share;
  String title;
  String deputy_typeface_color;
  String tplurl;
  String imageurl;
  PromotionData.fromJson(Map<String, dynamic> json)
      : typeface_color = json['typeface_color'],
        position = json['position'],
        module = json['module'],
        maintitle = json['maintitle'],
        type = json['type'],
        deputytitle = json['deputytitle'],
        solds = json['solds'],
        id = json['id'],
        share = Share.fromJson(json['share']),
        title = json['title'],
        deputy_typeface_color = json['deputy_typeface_color'],
        tplurl = json['tplurl'],
        imageurl = json['imageurl'];
  @override
  String toString() =>
      '{"typeface_color":$typeface_color,"position":$position,"module":$module,"maintitle":$maintitle,"type":$type,"deputytitle":$deputytitle,"solds":$solds,"id":$id,"share":$share,"title":$title,"deputy_typeface_color":$deputy_typeface_color,"tplurl":$tplurl,"imageurl":$imageurl}';
}

class Share {
  String message;
  String url;
  Share.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        url = json['url'];
  @override
  String toString() => '{"message":$message,"url":$url}';
}
