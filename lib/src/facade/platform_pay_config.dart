import 'dart:convert';

/// Абстрактный класс для описания параметров платформного платежа, т.е.
/// Apple Pay или Google Pay.
/// 
/// Мерчанты должны использовать классы [ApplePayConfiguration] или 
/// [GooglePayConfiguration].
/// 
/// Метод [toJson] трансформирует данные конфигурации в JSON объект для
/// использования с пакетом [package:pay].
abstract class PlatformPayConfiguration {
  PlatformPayConfiguration({
    required this.merchantIdentifier,
    required this.countryCode,
  });

  final String merchantIdentifier;
  final String countryCode;

  Map<String, dynamic> toJson();
  String toJsonString() => jsonEncode(toJson());
}

class ApplePayConfiguration extends PlatformPayConfiguration {
  ApplePayConfiguration({
    required this.merchantName,
    required String merchantIdentifier,
    required String countryCode,
  }) : super(
          merchantIdentifier: merchantIdentifier,
          countryCode: countryCode,
        );

  final String merchantName;

  @override
  Map<String, dynamic> toJson() => {
        'provider': 'apple_pay',
        'data': {
          'merchantIdentifier': merchantIdentifier,
          'displayName': merchantName,
          'countryCode': countryCode,
          'supportedNetworks': [
            'discover',
            'amex',
            'visa',
            'mastercard',
            'mir',
            'unionpay',
          ],
          'merchantCapabilities': [
            '3DS',
          ],
        },
      };
}

class GooglePayConfiguration extends PlatformPayConfiguration {
  GooglePayConfiguration({
    required String merchantIdentifier,
    required String countryCode,
  }) : super(
          merchantIdentifier: merchantIdentifier,
          countryCode: countryCode,
        );

  @override
  Map<String, dynamic> toJson() => {
        'provider': 'google_pay',
        'data': {
          'apiVersion': 2,
          'apiVersionMinor': 0,
          'allowedPaymentMethods': [
            {
              'type': 'CARD',
              'parameters': {
                'allowedAuthMethods': ['PAN_ONLY', 'CRYPTOGRAM_3DS'],
                'allowedCardNetworks': [
                  'AMEX',
                  'DISCOVER',
                  'VISA',
                  'MASTERCARD',
                  'MIR',
                  'UNIONPAY',
                ],
                'allowPrepaidCards': false,
                'billingAddressRequired': true,
                'billingAddressParameters': {
                  'format': 'FULL',
                  'phoneNumberRequired': true
                }
              },
              'tokenizationSpecification': {
                'type': 'PAYMENT_GATEWAY',
                'parameters': {
                  'gateway': 'sberbank',
                  'gatewayMerchantId': merchantIdentifier,
                }
              },
            }
          ],
        },
      };
}
