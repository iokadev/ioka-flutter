import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Модель для подтверждения платежа через 3D Secure.
///
/// Используется в:
/// - [PaymentConfirmationModel]
/// - [BindingConfirmationModel]
abstract class ConfirmationModel<T> extends ChangeNotifier {
  ConfirmationModel({
    required this.url,
    required this.redirectUrl,
  });

  /// Ссылка на страницу подтверждения 3D Secure.
  final String url;

  /// Ссылка, на которую происходит редирект в случае подтверждения платежа.
  final String redirectUrl;

  /// Ссылка на страницу подтверждения 3D Secure с параметром [redirectUrl].
  String get urlWithRedirect => '$url?return_url=$redirectUrl';

  /// Уведомляет слушателей об изменении состояния загрузки страницы.
  final isLoadingNotifier = ValueNotifier<bool>(true);
  bool get isLoading => isLoadingNotifier.value;

  WebViewController? _controller;
  WebViewController? get controller => _controller;

  /// Вызывается при инициализации нативного [WebView].
  ///
  /// Сохраняет переданный контроллер в моделе.
  void onControllerInitialized(WebViewController controller) {
    assert(_controller == null);
    _controller = controller;

    // Уведомляем о том, что закончилась загрузка.
    isLoadingNotifier.value = false;
  }

  /// Делегат для случаев навигации в WebView.
  ///
  /// В случае, если URL страницы начинается с [redirectUrl], вызывает
  /// функцию [onRedirect].
  ///
  /// Всегда возвращает [NavigationDecision.navigate].
  FutureOr<NavigationDecision> navigationDelegate(
    BuildContext context,
    NavigationRequest request,
  ) {
    if (request.url.startsWith(redirectUrl)) {
      onRedirect(context);
    }

    return NavigationDecision.navigate;
  }

  /// Значение становится `true` если был вызван `onRedirect`.
  ///
  /// Блокирует вызов `onRedirect` больше одного раза.
  bool _didRedirect = false;

  /// Вызывается при редиректе на [redirectUrl].
  ///
  /// При получении редиректа вызывается метод [fetchData], и затем
  /// возвращаются данные через [Navigator.pop].
  Future<T?> onRedirect(BuildContext context) async {
    if (_didRedirect) return null;

    // Блокируем повторный вызов функции
    _didRedirect = true;

    isLoadingNotifier.value = true;

    final data = await fetchData(context);

    isLoadingNotifier.value = false;
    Navigator.of(context).pop(data);

    return data;
  }

  /// Абстрактная функция - возвращает объект, который был изменен после
  /// прохождения 3D Secure.
  ///
  /// Например - статус платежа.
  Future<T> fetchData(BuildContext context);

  @override
  void dispose() {
    // Очищаем кэш веб-вью.
    _controller?.clearCache();

    isLoadingNotifier.dispose();
    super.dispose();
  }
}
