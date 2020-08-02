import 'package:flutter/material.dart';
import 'package:spacecraftflutter/util.dart';

class Item {
  Item({
    this.leftText,
    this.leftIcon,
    this.rightText,
    this.rightIcon,
  });
  final String leftText;
  final String leftIcon;
  final String rightText;
  final String rightIcon;
}

class TextIconItem extends StatelessWidget {
  // TextIconItem({
  //   this.leftText,
  //   this.leftIcon,
  //   this.rightText,
  //   this.rightIcon,
  // });

  TextIconItem({double height, @required Item item})
      : leftText = item.leftText,
        leftIcon = item.leftIcon,
        rightText = item.rightText,
        rightIcon = item.rightIcon,
        height = height;

  final String leftText;
  final String leftIcon;
  final String rightText;
  final String rightIcon;
  final double height;
  @override
  Widget build(BuildContext context) {
    List<Widget> left = new List<Widget>();
    List<Widget> right = new List<Widget>();
    if (!isEmpty(this.leftIcon)) {
      left.add(Container(
        margin: EdgeInsets.only(right: 8),
        child: Image.asset(
          this.leftIcon,
          width: 18,
          height: 18,
        ),
      ));
    }
    if (!isEmpty(this.leftText)) {
      left.add(Text(
        this.leftText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ));
    }
    if (!isEmpty(this.rightText)) {
      right.add(Text(
        this.rightText,
        style: TextStyle(fontSize: 13),
      ));
    }
    Widget rightIcon;
    if (isEmpty(this.rightIcon)) {
      rightIcon = Icon(
        Icons.keyboard_arrow_right,
        size: 18,
      );
    } else {
      rightIcon = Image.asset(
        this.rightIcon,
        width: 18,
        height: 18,
      );
    }
    right.add(Container(margin: EdgeInsets.only(left: 8), child: rightIcon));
    Container c = Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 8,
            child: Row(
              children: left,
            ),
          ),
          Positioned(
            right: 8,
            child: Row(
              children: right,
            ),
          ),
        ],
      ),
    );

    return height != null
        ? SizedBox(
            height: height,
            child: c,
          )
        : c;
  }
}

class ImageText {
  ImageText({this.height, this.url, this.title, this.subtitle, this.price});
  final double height;
  final String url;
  final String title;
  final String subtitle;
  final String price;
}

class ImageTextItem extends StatelessWidget {
  ImageTextItem({this.item});
  final ImageText item;
  @override
  Widget build(BuildContext context) {
    Container c = Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Image.asset(item.url, width: 50, height: 50),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/bg_customReview_image_default.png',
              image: item.url,
              imageErrorBuilder: (BuildContext c, Object o, StackTrace s) {},
              width: 90,
              height: 90,
            ),
          ),
          // ListTile(
          //   title:
          //       Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
          //   subtitle:
          //       Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
          // ),

          Container(
            margin: EdgeInsets.only(left: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ListTile(
                //   title: Text(item.subtitle,
                //       maxLines: 1,
                //       style: TextStyle(fontWeight: FontWeight.normal)),
                // ),

                Text(
                  item.price,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
    // return item.height != null
    //     ? SizedBox(
    //         height: item.height,
    //         child: c,
    //       )
    //     : c;
    return Align(
      alignment: Alignment.center,
      child: ListTile(
        trailing: Text(
          item.price,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/bg_customReview_image_default.png',
            image: item.url,
            imageErrorBuilder: (BuildContext c, Object o, StackTrace s) {},
            // width: 100,
            // height: 100,
          ),
        ),
        subtitle: Text(
          item.subtitle,
        ),
        title: Text(
          item.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
