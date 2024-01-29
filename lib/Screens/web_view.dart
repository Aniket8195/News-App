import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
class WebView extends StatefulWidget {
  const WebView({super.key,required this.url});
  final String url;
  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  double progress = 0;
  late InAppWebViewController webViewController;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          IconButton(
              onPressed: (){
                webViewController.reload();
              },
              icon: const Icon(Icons.refresh)
              ),

        ],
      ),
        body: Stack(
          children: [
            InAppWebView(
             initialUrlRequest: URLRequest(url:WebUri(widget.url)),
              onWebViewCreated: (InAppWebViewController controller) {
                webViewController = controller;
              },

              onProgressChanged: (InAppWebViewController controller,int progress){
                setState(() {
                  this.progress = progress/100;
                });
              },

            ),
            progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container(),

          ],
        ),
    );
  }
}
