import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';

/// Абстрактная модель для форм оплаты.
///
/// Используется для:
/// - [CheckoutWithNewCardModel]
/// - [CheckoutWithSavedCardModel]
abstract class CheckoutModel extends ChangeNotifier {
  CheckoutModel({
    required this.orderAccessToken,
    required this.order,
  });

  final String orderAccessToken;
  final OrderOut order;

  int get amount => order.amount!;

  /// Ключ формы оплаты - используется для того, чтобы вернуть форму в начальное
  /// состояние.
  var _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  /// Уведомляет слушателей о состоянии формы - можно ли взаимодействовать или
  /// нет.
  final isInteractableNotifier = ValueNotifier<bool>(true);
  bool get isInteractable => isInteractableNotifier.value;

  /// Абстрактная функция - проверяет валидность данных формы.
  bool get isValid;

  /// Абстрактная функция - создаёт запрос оплаты на сервере и возвращает
  /// результат.
  Future<ExtendedPayment> createPayment();

  /// Начинает процесс оплаты.
  ///
  /// Если [shouldPopRoute] равен `true`, то вызовет [Navigator.pop] в конце
  /// функции. Это необходимо для того, чтобы закрыть форму оплаты после
  /// завершения операции.
  ///
  /// Логика:
  /// - Создаём платеж через [createPayment].
  /// - В случае, если статус [PaymentStatus.requiresAction] и есть [action] -
  ///   показываем форму 3D Secure, и получаем новый статус платежа.
  /// - Если статус [PaymentStatus.captured] или [PaymentStatus.approved] -
  ///   показываем страницу успеха оплаты.
  /// - В противном случае или в случае ошибки показываем страницу ошибки через
  ///   [onFailure].
  Future<ExtendedPayment?> submit(
    BuildContext context, {
    bool shouldPopRoute = true,
  }) async {
    assert(isValid);

    // Блокируем форму для пользователя.
    isInteractableNotifier.value = false;
    notifyListeners();

    ExtendedPayment? payment;
    var retry = false;

    try {
      // Создаём платеж на сервере.
      payment = await createPayment();

      // По надобности, показываем форму 3D Secure.
      if (payment.status == PaymentStatus.requiresAction &&
          payment.action != null) {
        // Получаем новый объект платежа.
        final newPayment = await onPaymentConfirmation(
          context,
          url: payment.action!.url!,
          paymentId: payment.id!,
        );

        // Если новый объект платежа `null` - т.е. пользователь отменил платеж,
        // то прерываем операцию.
        if (newPayment == null) {
          // Разблокируем форму для пользователя.
          isInteractableNotifier.value = true;
          notifyListeners();

          return null;
        }

        // Сохраняем новый объект платежа
        payment = newPayment;
      }

      if (payment.status == PaymentStatus.captured ||
          payment.status == PaymentStatus.approved) {
        // Успешная операция - показываем пользователю окно успеха
        await onSuccess(context);
      } else {
        var reason = payment.error?.message;

        // Статус платежа не может быть [pending].
        if (payment.status == PaymentStatus.pending) {
          reason = context.l10n.errorUnknown;
        }

        // Ошибка оплаты - показываем пользователю окно ошибки.
        retry = await onFailure(
          context,
          reason: reason,
        );

        payment = null;
      }
    } catch (e) {
      // Ошибка оплаты - показываем пользователю окно ошибки.
      retry = await onFailure(
        context,
        reason: formatError(context, e),
      );

      payment = null;
    }

    // Если мы закрываем окно в конце операции и пользователь решил не повторять
    // платёж, то закрываем окно.
    if (shouldPopRoute && !retry) {
      Navigator.of(context).pop(payment);
    }

    // Разблокируем форму для пользователя.
    isInteractableNotifier.value = true;
    notifyListeners();

    return payment;
  }

  /// Показывает форму успеха платежа.
  Future<void> onSuccess(BuildContext context) {
    return IokaNavigation.showPaymentSuccessView(
      context,
      orderAmount: order.amount,
      orderNumber: order.externalId,
    );
  }

  /// Показывает форму 3D Secure.
  Future<ExtendedPayment?> onPaymentConfirmation(
    BuildContext context, {
    required String url,
    required String paymentId,
  }) {
    return IokaNavigation.showPaymentConfirmationView(
      context,
      orderAccessToken: orderAccessToken,
      url: url,
      paymentId: paymentId,
    );
  }

  /// Показывает форму провала платежа.
  Future<bool> onFailure(BuildContext context, {String? reason}) async {
    // Метод возвращает `true` в случае, если пользователь решил повторить
    // платеж.
    final retry = await IokaNavigation.showPaymentFailureView(
      context,
      reason: reason,
    );

    if (retry) {
      // Обнуляем поля в форме в случае повтора платежа.
      reset();
    }

    return retry;
  }

  @override
  void dispose() {
    isInteractableNotifier.dispose();
    super.dispose();
  }

  /// Обнуляет все поля в форме.
  void reset() {
    _formKey = GlobalKey<FormState>();
    notifyListeners();
  }
}
