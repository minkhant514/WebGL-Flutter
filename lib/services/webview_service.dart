import 'dart:developer';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewService {
  WebviewService._();
  static final _singleton = WebviewService._();
  factory WebviewService() => _singleton;

  WebViewController? webViewController;

  void init(String uri) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Optionally handle progress updates, e.g., show a loading indicator.
          },
          onPageStarted: (String url) {
            // Optionally handle actions when a page starts loading.
          },
          onPageFinished: (String url) {
            // Optionally handle actions when a page finishes loading.
          },
          onHttpError: (HttpResponseError error) {
            // Log or handle HTTP errors gracefully.
            log('HTTP error: ${error.response}');
          },
          onWebResourceError: (WebResourceError error) {
            // Log or handle web resource errors gracefully.
            log('Web resource error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            // Prevent navigation to specific URLs if needed.
            if (request.url.startsWith('https://www.youtube.com/')) {
              log('Navigation to ${request.url} blocked.');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(uri));
  }
}
