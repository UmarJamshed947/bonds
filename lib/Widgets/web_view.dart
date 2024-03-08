import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String initialUrl;

  WebViewScreen({required this.initialUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('WebView')),
      body: WebView(
        initialUrl: "https://savings.gov.pk/prize-bonds/",
        onWebViewCreated: (WebViewController webViewController) {
          // Do something with the WebViewController if needed
        },
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          // Customize navigation here if needed
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}