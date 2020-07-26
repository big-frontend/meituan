import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

class ApplyOptions extends StatelessWidget {
  const ApplyOptions({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final options = Options.of(context);
    print('ApplyOptions: ' + options.themeMode.toString());
    Widget widget = MediaQuery(
      data: MediaQuery.of(context).copyWith(),
      child: child,
    );
    return widget;
  }
}

class Options {
  const Options({
    this.themeMode,
    Locale locale,
  });
  final ThemeMode themeMode;
  SystemUiOverlayStyle resolvedSystemUiOverlayStyle() {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
      default:
        brightness = WidgetsBinding.instance.window.platformBrightness;
    }

    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return overlayStyle;
  }

  static Options of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_SharedDataScope>();
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, Options newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_SharedDataScope>();
    return scope.modelBindingState.updateModel(newModel);
  }
}

class SharedDataWidget extends StatefulWidget {
  SharedDataWidget({Key key, this.initialModel = const Options(), this.child})
      : assert(initialModel != null),
        super(key: key);
  final Options initialModel;
  final Widget child;
  @override
  State<StatefulWidget> createState() {
    return _SharedDataState();
  }
}

class _SharedDataState extends State<SharedDataWidget> {
  Options currentModel;
  @override
  void initState() {
    super.initState();
    print('_SharedDataState initState');
    currentModel = widget.initialModel;
  }

  @override
  void dispose() {
    super.dispose();
    print('_SharedDataState dispose');
  }

  void updateModel(Options newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _SharedDataScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}

class _SharedDataScope extends InheritedWidget {
  _SharedDataScope({
    Key key,
    @required this.modelBindingState,
    Widget child,
  })  : assert(modelBindingState != null),
        super(key: key, child: child);
  final _SharedDataState modelBindingState;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
