import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constant/api_constant.dart';
import '../services/webview_service.dart';

class LangoLandWebview extends StatefulWidget {
  const LangoLandWebview({super.key});

  @override
  State<LangoLandWebview> createState() => _LangoLandWebviewState();
}

class _LangoLandWebviewState extends State<LangoLandWebview> {
  final webviewService = WebviewService();

  @override
  void initState() {
    super.initState();
    webviewService.init(kNeedleURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarContent(),
      body: _buildWebViewContent(),
    );
  }

  PreferredSizeWidget _buildAppBarContent() {
    return AppBar(
      title: Text("WEB VIEW TEST"),
      centerTitle: true,
    );
  }

  Widget _buildWebViewContent() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: WebViewWidget(
        controller: webviewService.webViewController!,
      ),
    );
  }
}
