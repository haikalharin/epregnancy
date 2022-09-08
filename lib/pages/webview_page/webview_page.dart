import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebViewPage extends StatefulWidget {
  final String? url;
   const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.

  }

  @override
  Widget build(BuildContext context) {
    print('url : ${widget.url}');
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(widget.url!)),
    );
  }
}