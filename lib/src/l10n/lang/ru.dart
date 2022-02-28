import 'package:ioka/src/l10n/l10n.dart';

class RuIokaLocalization extends IokaLocalization {
  @override
  String get cardCvcInputError => 'Неверный CVV';

  @override
  String get cardCvcInputHint => 'CVV';

  @override
  String get cardExpiryDateInputError => 'Неверная дата';

  @override
  String get cardExpiryDateInputHint => 'ММ/ГГ';

  @override
  String get cardInputFormSaveCardLabel => 'Сохранить карту';

  @override
  String get cardNumberInputError => 'Неверный номер карты';

  @override
  String get cardNumberInputHint => 'Введите номер карты';

  @override
  String checkoutWithNewCardViewPayAction(int amount) =>
      'Оплатить ${formatMoneyAmount(amount)}';

  @override
  String checkoutWithNewCardViewTitle(int amount) =>
      'К оплате ${formatMoneyAmount(amount)}';

  @override
  String get cvcConfirmationDialogSubmitAction => 'Подтвердить';

  @override
  String get cvcConfirmationDialogTitle => 'Подтверждение оплаты';

  @override
  String get cvcTooltipHint => '3 цифры на\nобороте карты';

  @override
  String get paymentConfirmationViewTitle => 'Подтверждение оплаты';

  @override
  String get paymentFailureDialogRetryAction => 'Попробовать заново';

  @override
  String get paymentFailureDialogTitle => 'Платеж не прошел';

  @override
  String get paymentFailureViewRetryAction => 'Попробовать заново';

  @override
  String get paymentFailureViewLabel => 'Платеж не прошел';

  @override
  String get paymentSuccessViewDismissAction => 'Понятно';

  @override
  String get paymentSuccessViewLabel => 'Заказ оплачен';

  @override
  String paymentSuccessViewOrderNumberLabel(String orderNumber) =>
      'Заказ №$orderNumber';

  @override
  String get saveCardViewSaveAction => 'Сохранить';

  @override
  String get saveCardViewTitle => 'Новая карта';

  @override
  String get transactionsSecureLabel => 'Все транзакции защищены';
}
