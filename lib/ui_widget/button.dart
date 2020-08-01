import 'package:flutter/material.dart';

class RightButton extends StatelessWidget {
  const RightButton({
    Key key,
    this.label,
    this.icon,
    @required this.onPressed,
  });
  final Widget label;
  final Widget icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: <Widget>[
    //     Text("吃地瓜的电解质", style: TextStyle(color: Color(0xfff3f3f3))),
    //   ],
    // );
    // RaisedButton.icon()
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.end,
      // verticalDirection: VerticalDirection.down,
      children: <Widget>[label, icon],
    );
  }

  // static void icon(Widget label, Widget icon, VoidCallback onPresse) {
  // return RightButton(label, icon, onPressed);
  // }
  factory RightButton.icon(
      {Key key, Widget label, Widget icon, @required VoidCallback onPressed}) {
    return _RightButtonWithIcon(
      key: key,
      label: label,
      icon: icon,
      onPressed: onPressed,
    );
  }
}

class _RightButtonWithIcon extends RightButton
    with MaterialButtonWithIconMixin {
  _RightButtonWithIcon({
    Key key,
    Widget label,
    Widget icon,
    @required onPressed,
  }) : super(key: key, label: label, icon: icon, onPressed: onPressed);
}
