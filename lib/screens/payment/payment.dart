import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shop_app/utils/globals.dart' as globals;

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
          initialUrl: ('https://syamsul.promaydo.net/index.php?api=' +
              globals.api.toString()),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          onPageStarted: (url) {
            print('newwebsite: ' + url);
          }),
    );
  }
}
