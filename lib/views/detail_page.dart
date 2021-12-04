import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swiddledick_news/models/Item.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  DetailPage({required this.selectedItem});

  final Item selectedItem;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MainWebView(
        selectedItem: widget.selectedItem,
        controller: _controller,
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   DetailPage({@required this.selectedItem});

//   final Item selectedItem;
//   Completer<WebViewController> _controller = Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: MainWebView(selectedItem: selectedItem, controller: _controller),
//     );
//   }
// }

class MainWebView extends StatelessWidget {
  const MainWebView({
    Key? key,
    required this.selectedItem,
    required Completer<WebViewController> controller,
  })  : _controller = controller,
        super(key: key);

  final Item selectedItem;
  final Completer<WebViewController> _controller;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: selectedItem.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }
}
