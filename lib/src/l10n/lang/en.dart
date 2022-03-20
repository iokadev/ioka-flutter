import 'package:ioka/src/l10n/l10n.dart';

class EnIokaLocalization extends IokaLocalization {
  @override
  String get cardCvcInputError => 'Invalid CVV';

  @override
  String get cardCvcInputHint => 'CVV';

  @override
  String get cardExpiryDateInputError => 'Invalid expiration date';

  @override
  String get cardExpiryDateInputHint => 'MM/YY';

  @override
  String get cardInputFormSaveCardLabel => 'Save card';

  @override
  String get cardNumberInputError => 'Invalid card number';

  @override
  String get cardNumberInputHint => 'Enter a card number';

  @override
  String checkoutWithNewCardViewPayAction(int amount) =>
      'Pay ${formatMoneyAmount(amount)}';

  @override
  String checkoutWithNewCardViewTitle(int amount) =>
      'Pay ${formatMoneyAmount(amount)}';

  @override
  String get cvcConfirmationDialogSubmitAction => 'Submit';

  @override
  String get cvcConfirmationDialogTitle => 'Payment confirmation';

  @override
  String get cvcTooltipHint => '3 digits on the\nback of your card';

  @override
  String get paymentConfirmationViewTitle => 'Payment confirmation';

  @override
  String get paymentFailureDialogRetryAction => 'Try again';

  @override
  String get paymentFailureDialogTitle => 'Payment failed';

  @override
  String get paymentFailureViewRetryAction => 'Try again';

  @override
  String get paymentFailureViewLabel => 'Payment failed';

  @override
  String get paymentSuccessViewDismissAction => 'OK';

  @override
  String get paymentSuccessViewLabel => 'Payment successful';

  @override
  String paymentSuccessViewOrderNumberLabel(String orderNumber) =>
      'Order #$orderNumber';

  @override
  String get saveCardViewSaveAction => 'Save';

  @override
  String get saveCardViewTitle => 'New card';

  @override
  String get transactionsSecureLabel => 'All transactions are secure';

  @override
  String get errorUnknown => 'An unknown error occurred. Please, try again.';
}
