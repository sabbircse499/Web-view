import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:core';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     "w3schools",
        //     style: TextStyle(
        //       fontSize: 20,
        //       color: Colors.white,
        //     ),
        //   ),
        //   centerTitle: true,
        //   backgroundColor: Colors.cyan,
        // ),
        body: SafeArea(
          child: WebViewWithLoadingIndicator(),
        ),
      ),
    );
  }
}

class WebViewWithLoadingIndicator extends StatefulWidget {
  const WebViewWithLoadingIndicator({Key? key}) : super(key: key);

  @override
  _WebViewWithLoadingIndicatorState createState() =>
      _WebViewWithLoadingIndicatorState();
}

class _WebViewWithLoadingIndicatorState extends State<WebViewWithLoadingIndicator> {
  late bool isLoading;
  late InAppWebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
      //    initialUrlRequest: URLRequest(url: Uri.parse("https://www.w3schools.com")),
          initialUrlRequest:
          URLRequest(url: WebUri("https://www.w3schools.com")),

          onLoadStart: (controller, url) {
            setState(() {
              isLoading = true;
              _webViewController = controller;
            });
          },
          onLoadStop: (controller, url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        if (isLoading)
          Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
