import 'package:flutter/cupertino.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CupertinoPaymentConfirmationView extends StatefulWidget {
  const CupertinoPaymentConfirmationView({
    Key? key,
    required this.url,
  }) : super(key: key);
  
  final String url;

  @override
  State<CupertinoPaymentConfirmationView> createState() =>
      _CupertinoPaymentConfirmationViewState();
}

class _CupertinoPaymentConfirmationViewState
    extends State<CupertinoPaymentConfirmationView> {
  WebViewController? _controller;
  bool _isLoading = true;

  @override
  void dispose() {
    _controller?.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const IokaCupertinoNavigationBar(
        middle: Text('Подтверждение оплаты'),
      ),
      child: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            navigationDelegate: (request) {
              final url = request.url;

              if (url.contains('kekland')) {
                Navigator.of(context).pop(true);
              }

              return NavigationDecision.navigate;
            },
            onWebViewCreated: (v) {
              _controller = v;
              setState(() {});
            },
            onPageFinished: (v) {
              _isLoading = false;
              setState(() {});
            },
          ),
          if (_isLoading)
            const Center(
              child: CupertinoActivityIndicator(),
            ),
        ],
      ),
    );
  }
}
