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

  TextIconItem({@required Item item})
      : leftText = item.leftText,
        leftIcon = item.leftIcon,
        rightText = item.rightText,
        rightIcon = item.rightIcon;

  final String leftText;
  final String leftIcon;
  final String rightText;
  final String rightIcon;
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
    return Container(
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
  }
}
