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

class ImageTextItemTheme extends InheritedTheme {
  const ImageTextItemTheme();
  static ImageTextItemTheme of(BuildContext context) {
    final ImageTextItemTheme result =
        context.dependOnInheritedWidgetOfExactType<ImageTextItemTheme>();
    return result ?? const ImageTextItemTheme();
  }

  @override
  bool updateShouldNotify(ListTileTheme oldWidget) {
    return true;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ListTileTheme ancestorTheme =
        context.findAncestorWidgetOfExactType<ListTileTheme>();
    return identical(this, ancestorTheme) ? child : ListTileTheme();
  }
}

class ImageTextItem extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget price;
  final double height;
  const ImageTextItem({
    this.leading,
    this.title,
    this.subtitle,
    this.price,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    Container c = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          // Expanded(
          //   child: Column(
          //       // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       // crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [leading]),
          // ),
          leading,
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 18),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[Expanded(child: title)]),
                  Row(children: <Widget>[Expanded(child: subtitle)]),
                  price,
                ],
              ),
            ),
          )
        ],
      ),
    );
    return height != null ? SizedBox(height: height, child: c) : c;
  }
}
