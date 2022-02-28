import 'package:ioka/ioka.dart';

String orderIdFromAccessToken(String orderAccessToken) {
  return orderAccessToken.split('_secret_').first;
}

String customerIdFromAccessToken(String customerAccessToken) {
  return customerAccessToken.split('_secret_').first;
}

IokaApiMode apiModeFromPublicKey(String publicKey) {
  final type = publicKey.split('_')[1];

  if (type == 'test') {
    return IokaApiMode.staging;
  } else if (type == 'live') {
    return IokaApiMode.production;
  }

  throw Exception('Invalid public key format');
}
