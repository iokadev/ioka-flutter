import 'package:ioka/ioka.dart';

/// Получает идентификатор из токена.
///
/// Формат customerAccessToken и orderAccessToken включает в себя
/// идентификатор объекта:
///
/// ```
/// {id}_secret_{secret}
/// ```
///
/// В случае неверного токена генерируется исключение типа FormatException.
String idFromAccessToken(String accessToken) {
  final parts = accessToken.split('_secret_');

  if (parts.length != 2) {
    throw const FormatException('Invalid access token format');
  }

  return parts.first;
}

/// Получает режим API из публичного ключа.
///
/// Формат publicKey включает в себя режим API:
///
/// ```
/// {shop_id}_{mode}_public_{key}
/// ```
///
/// В случае неверного токена генерируется исключение типа FormatException.
IokaApiMode apiModeFromPublicKey(String publicKey) {
  final parts = publicKey.split('_public_');

  if (parts.length == 2) {
    final type = parts[0];

    if (type.endsWith('_test')) {
      return IokaApiMode.staging;
    } else if (type.endsWith('_live')) {
      return IokaApiMode.production;
    }
  }

  throw const FormatException('Invalid public key format');
}
