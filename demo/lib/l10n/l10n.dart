import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      DemoLocalizations.languages().contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  static final _localizedValues = <String, Map<String, dynamic>>{
    'ru': {
      'cartPageTitle': 'Корзина',
      'sampleItemName': 'Набор керамики',
      'sampleLocation': 'улица Абая, 328',
      'sampleTime': '14 февраля, 15:00',
      'cartPageCheckoutAction': 'Оформить',
      'checkoutPageTitle': 'Оформление заказа',
      'checkoutPageSelectPaymentMethodHint': 'Выберите способ оплаты',
      'cashPaymentMethod': 'Наличными курьеру',
      'cardPaymentMethod': 'Банковской картой',
      'checkoutPageCheckoutAction': 'Оплатить',
      'deleteCardDialogLabel': (v) =>
          'Вы уверены, что хотите удалить карту $v?',
      'deleteCardDialogDeleteAction': 'Удалить',
      'deleteCardDialogCancelAction': 'Отмена',
      'languageSelectionPageTitle': 'Язык',
      'profilePageTitle': 'Профиль',
      'savedCardsPageTitle': 'Сохраненные карты',
      'darkTheme': 'Темная тема',
      'savedCardsPageAddCardAction': 'Добавить новую карту',
      'paymentOptionPageTitle': 'Способ оплаты',
      'paymentOptionPageSaveAction': 'Сохранить',
    },
    'en': {
      'cartPageTitle': 'Cart',
      'sampleItemName': 'Ceramics set',
      'sampleLocation': 'Abay st., 328',
      'sampleTime': 'February 14th, 15:00',
      'cartPageCheckoutAction': 'Checkout',
      'checkoutPageTitle': 'Checkout',
      'checkoutPageSelectPaymentMethodHint': 'Select a payment method',
      'cashPaymentMethod': 'Cash',
      'cardPaymentMethod': 'Credit card',
      'checkoutPageCheckoutAction': 'Pay',
      'deleteCardDialogLabel': (v) =>
          'Are you sure that you want to delete your card $v?',
      'deleteCardDialogDeleteAction': 'Delete',
      'deleteCardDialogCancelAction': 'Cancel',
      'languageSelectionPageTitle': 'Language',
      'profilePageTitle': 'Profile',
      'savedCardsPageTitle': 'Saved cards',
      'darkTheme': 'Dark mode',
      'savedCardsPageAddCardAction': 'Add another card',
      'paymentOptionPageTitle': 'Payment method',
      'paymentOptionPageSaveAction': 'Save',
    },
  };

  static List<String> languages() => _localizedValues.keys.toList();

  Map<String, dynamic> get _values => _localizedValues[locale.languageCode]!;

  String get cartPageTitle => _values['cartPageTitle'];
  String get sampleItemName => _values['sampleItemName'];
  String get sampleLocation => _values['sampleLocation'];
  String get sampleTime => _values['sampleTime'];
  String get cartPageCheckoutAction => _values['cartPageCheckoutAction'];
  String get checkoutPageTitle => _values['checkoutPageTitle'];
  String get checkoutPageSelectPaymentMethodHint =>
      _values['checkoutPageSelectPaymentMethodHint'];
  String get cashPaymentMethod => _values['cashPaymentMethod'];
  String get cardPaymentMethod => _values['cardPaymentMethod'];
  String get checkoutPageCheckoutAction =>
      _values['checkoutPageCheckoutAction'];
  String deleteCardDialogLabel(String maskedPan) =>
      _values['deleteCardDialogLabel'](maskedPan);
  String get deleteCardDialogDeleteAction =>
      _values['deleteCardDialogDeleteAction'];
  String get deleteCardDialogCancelAction =>
      _values['deleteCardDialogCancelAction'];
  String get languageSelectionPageTitle =>
      _values['languageSelectionPageTitle'];
  String get profilePageTitle => _values['profilePageTitle'];
  String get savedCardsPageTitle => _values['savedCardsPageTitle'];
  String get darkTheme => _values['darkTheme'];
  String get savedCardsPageAddCardAction =>
      _values['savedCardsPageAddCardAction'];
  String get paymentOptionPageTitle => _values['paymentOptionPageTitle'];
  String get paymentOptionPageSaveAction =>
      _values['paymentOptionPageSaveAction'];
}
