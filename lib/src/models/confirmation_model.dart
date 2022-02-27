import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class ConfirmationModel<T> extends ChangeNotifier {
  ConfirmationModel({
    required this.url,
    required this.redirectUrl,
  });

  final String url;
  final String redirectUrl;

  final isLoadingNotifier = ValueNotifier<bool>(true);
  bool get isLoading => isLoadingNotifier.value;

  WebViewController? _controller;
  WebViewController? get controller => _controller;

  void onControllerInitialized(WebViewController controller) {
    assert(_controller == null);
    _controller = controller;
  }

  void onPageFinished(BuildContext context, String url) {
    isLoadingNotifier.value = false;

    if (url.startsWith(redirectUrl)) {
      _onRedirect(context);
    }
  }

  Future<void> _onRedirect(BuildContext context) async {
    isLoadingNotifier.value = true;

    final data = await fetchData(context);

    isLoadingNotifier.value = false;
    Navigator.of(context).pop(data);
  }

  Future<T> fetchData(BuildContext context);

  @override
  void dispose() {
    _controller?.clearCache();
    isLoadingNotifier.dispose();
    super.dispose();
  }
}
