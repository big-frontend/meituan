import 'package:flutter/material.dart';

class LayoutButton extends StatelessWidget {
  const LayoutButton(
      {Key key, this.label, this.icon, @required this.onPressed, this.mode});
  final Widget label;
  final Widget icon;
  final VoidCallback onPressed;
  final LayoutMode mode;
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List();
    Axis d;

    if (mode == LayoutMode.leftText) {
      children.add(label);
      children.add(icon);
      d = Axis.horizontal;
    } else if (mode == LayoutMode.topText) {
      children.add(label);
      children.add(icon);
      d = Axis.vertical;
    } else if (mode == LayoutMode.rightText) {
      children.add(icon);
      children.add(label);
      d = Axis.horizontal;
    } else if (mode == LayoutMode.bottomText) {
      children.add(icon);
      children.add(label);
      d = Axis.vertical;
    }
    return Flex(
      direction: d,
      children: children,
    );
  }

  // static void icon(Widget label, Widget icon, VoidCallback onPresse) {
  // return LayoutButton(label, icon, onPressed);
  // }
  factory LayoutButton.icon({
    Key key,
    Widget label,
    Widget icon,
    LayoutMode mode,
    @required VoidCallback onPressed,
  }) {
    return _LayoutButtonWithIcon(
      key: key,
      label: label,
      icon: icon,
      mode: mode,
      onPressed: onPressed,
    );
  }
}

class _LayoutButtonWithIcon extends LayoutButton
    with MaterialButtonWithIconMixin {
  _LayoutButtonWithIcon({
    Key key,
    Widget label,
    Widget icon,
    LayoutMode mode,
    @required onPressed,
  }) : super(
            key: key,
            label: label,
            icon: icon,
            mode: mode,
            onPressed: onPressed);
}

enum LayoutMode {
  leftText,
  topText,
  rightText,
  bottomText,
}
