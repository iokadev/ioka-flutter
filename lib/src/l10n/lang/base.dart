/// Базовый класс локализации.
/// 
/// - Русский язык: [RuIokaLocalization]
/// 
/// - Английский язык: [EnIokaLocalization]
abstract class IokaLocalization {
  String checkoutWithNewCardViewTitle(int amount);
  String checkoutWithNewCardViewPayAction(int amount);

  String get cvcConfirmationDialogTitle;
  String get cvcConfirmationDialogSubmitAction;

  String get paymentConfirmationViewTitle;

  String get paymentFailureDialogTitle;
  String get paymentFailureDialogRetryAction;

  String get paymentFailureViewRetryAction;
  String get paymentFailureViewLabel;

  String get paymentSuccessViewLabel;
  String paymentSuccessViewOrderNumberLabel(String orderNumber);
  String get paymentSuccessViewDismissAction;

  String get saveCardViewTitle;
  String get saveCardViewSaveAction;

  String get cardInputFormSaveCardLabel;

  String get cvcTooltipHint;

  String get transactionsSecureLabel;

  String get cardNumberInputHint;
  String get cardNumberInputError;

  String get cardCvcInputHint;
  String get cardCvcInputError;

  String get cardExpiryDateInputHint;
  String get cardExpiryDateInputError;

  String formatMoneyAmount(int amount, {String currency = '₸'}) {
    final whole = amount ~/ 100;
    final fraction = amount % 100;

    final wholeString = whole.toString();
    var wholeFormattedString = '';

    for (var i = 0; i < wholeString.length; i++) {
      wholeFormattedString += wholeString[i];

      if ((wholeString.length - i - 1) % 3 == 0 &&
          i != wholeString.length - 1) {
        wholeFormattedString += ' ';
      }
    }

    if (fraction == 0) {
      return '$wholeFormattedString $currency';
    } else {
      return '$wholeFormattedString,$fraction $currency';
    }
  }
}
