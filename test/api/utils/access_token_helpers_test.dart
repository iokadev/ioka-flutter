import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/utils/access_token_helpers.dart';

void main() {
  group('idFromAccessToken', () {
    test('extracts id from an access token', () {
      const orderAccessToken = 'ord_XTZSZ43S_secret_assfsdfSDFSDgf34r34';

      final id = idFromAccessToken(orderAccessToken);

      expect(id, equals('ord_XTZSZ43S'));
    });

    test('throws [FormatException] on an invalid access token', () {
      const invalidAccessToken = 'invalid_access_token';

      expect(
        () => idFromAccessToken(invalidAccessToken),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('apiModeFromPublicKey', () {
    test('extracts [IokaApiMode.staging] from a valid public key', () {
      const publicKey = '123123123_test_public_123123123';

      final apiMode = apiModeFromPublicKey(publicKey);

      expect(apiMode, equals(IokaApiMode.staging));
    });

    test('extracts [IokaApiMode.production] from a valid public key', () {
      const publicKey = '123123123_live_public_123123123';

      final apiMode = apiModeFromPublicKey(publicKey);

      expect(apiMode, equals(IokaApiMode.production));
    });

    test('throws [FormatException] on an invalid public key', () {
      const publicKey = 'invalid_public_key';

      expect(
        () => idFromAccessToken(publicKey),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
