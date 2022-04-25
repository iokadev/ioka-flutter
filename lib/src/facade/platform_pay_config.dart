import 'dart:convert';

import 'package:ioka/src/api/generated/ioka_api.swagger.dart' as generated;
import 'package:ioka/src/utils/utils.dart';

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
    required this.merchantName,
    required this.merchantIdentifier,
    required this.countryCode,
  });

  final String merchantName;
  final String merchantIdentifier;
  final String countryCode;

  Map<String, dynamic> toJson();
  String toJsonString() => jsonEncode(toJson());

  Map<String, dynamic> toJsonForOrder(generated.OrderOut order);
  String toJsonStringForOrder(generated.OrderOut order) =>
      jsonEncode(toJsonForOrder(order));
}

class ApplePayConfiguration extends PlatformPayConfiguration {
  ApplePayConfiguration({
    required String merchantName,
    required String merchantIdentifier,
    required String countryCode,
  }) : super(
          merchantName: merchantName,
          merchantIdentifier: merchantIdentifier,
          countryCode: countryCode,
        );

  @override
  Map<String, dynamic> toJson() => {
        'provider': 'apple_pay',
        'data': {
          'merchantIdentifier': merchantIdentifier,
          'displayName': merchantName,
          'countryCode': countryCode.toUpperCase(),
          'supportedNetworks': [
            'discover',
            'amex',
            'visa',
            'masterCard',
            'mir',
            'unionpay',
          ],
          'merchantCapabilities': [
            '3DS',
          ],
        },
      };

  @override
  Map<String, dynamic> toJsonForOrder(generated.OrderOut order) {
    final json = toJson();
    json['data']['currencyCode'] = enumToString(order.currency).toUpperCase();
    return json;
  }

  ApplePayConfiguration copyWith({
    String? merchantName,
    String? merchantIdentifier,
    String? countryCode,
  }) {
    return ApplePayConfiguration(
      merchantName: merchantName ?? this.merchantName,
      merchantIdentifier: merchantIdentifier ?? this.merchantIdentifier,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}

class GooglePayConfiguration extends PlatformPayConfiguration {
  GooglePayConfiguration({
    required String merchantName,
    required String merchantIdentifier,
    required String countryCode,
    this.environment = 'TEST',
  }) : super(
          merchantName: merchantName,
          merchantIdentifier: merchantIdentifier,
          countryCode: countryCode,
        );

  final String environment;

  @override
  Map<String, dynamic> toJson() => {
        'provider': 'google_pay',
        'data': {
          'environment': 'TEST',
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
          'merchantInfo': {
            'merchantId': merchantIdentifier,
            'merchantName': merchantName,
          },
          'transactionInfo': {
            'countryCode': countryCode.toUpperCase(),
          },
        },
      };

  @override
  Map<String, dynamic> toJsonForOrder(generated.OrderOut order) {
    final json = toJson();
    json['data']['transactionInfo']['currencyCode'] =
        enumToString(order.currency).toUpperCase();

    return json;
  }

  GooglePayConfiguration copyWith({
    String? merchantName,
    String? merchantIdentifier,
    String? countryCode,
    String? environment,
  }) {
    return GooglePayConfiguration(
      merchantName: merchantName ?? this.merchantName,
      merchantIdentifier: merchantIdentifier ?? this.merchantIdentifier,
      countryCode: countryCode ?? this.countryCode,
      environment: environment ?? this.environment,
    );
  }
}
