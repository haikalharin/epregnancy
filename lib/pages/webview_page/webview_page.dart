import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebViewPage extends StatefulWidget {
  final String? url;
  final String? title;
   const WebViewPage({Key? key, required this.url, required this.title}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.close), color: Colors.black,)
        ],
        title: Text(widget.title!, style: const TextStyle(color: Colors.black),),
        leading: const SizedBox.shrink(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InAppWebView(
          onLoadResource: (_controller, resource){

          },
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url!)),
        ),
      ),
    );
  }
}