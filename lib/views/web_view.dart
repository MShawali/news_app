import 'package:flutter/material.dart';
import 'package:flutter_application_news/constent.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String url, title;

  const NewsWebView({Key? key, required this.url, required this.title}) : super(key: key);

  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeryKeyBlue,
      appBar: AppBar(
          leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimeryKeyWhite,
          ),
        ),
        backgroundColor: kPrimeryKeyBlue,
        title: Text(widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body:  WebViewWidget(
        controller: _controller
        ),
    );
  }
}