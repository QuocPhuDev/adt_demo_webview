import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(WebViewPage());

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webview',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Webview'),
        ),
        body: WebView(
          initialUrl: "https://Aditechco.com",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
