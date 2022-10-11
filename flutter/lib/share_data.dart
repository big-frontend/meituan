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

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);
  final T data;
  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    return true;
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;
  static T of<T>(BuildContext context) {
    // final type = _typeOf<InheritedProvider<T>>();
    final provider =
        context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
