import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatelessWidget {
  final String url;
  const Webview({@required this.url});
  static void openWebview(context, url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Webview(
            // 路由参数
            url: url,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return WebView(
    //   initialUrl: url,
    //   onWebViewCreated: (WebViewController webViewController) {
    //     // _controller = webViewController;
    //   },
    // );
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
