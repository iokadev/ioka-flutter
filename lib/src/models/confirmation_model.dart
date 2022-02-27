import 'dart:async';

import 'package:flutter/widgets.dart';
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

  final _urlNotifier = ValueNotifier<String?>(null);

  WebViewController? _controller;
  WebViewController? get controller => _controller;

  void onControllerInitialized(WebViewController controller) {
    assert(_controller == null);
    _controller = controller;
  }

  Timer? _debounceTimer;

  void onPageFinished(BuildContext context, String url) {
    isLoadingNotifier.value = false;

    _urlNotifier.value = url;

    if (url.startsWith(redirectUrl)) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(
        const Duration(seconds: 1),
        () => _onRedirect(context),
      );
      
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
