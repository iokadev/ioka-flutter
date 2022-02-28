import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/src/models/confirmation_model.dart';
import 'package:mockito/mockito.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../test_utils.dart';

class MockWebViewController extends Mock implements WebViewController {}

class TestConfirmationModel extends ConfirmationModel<String> {
  TestConfirmationModel({required String url, required String redirectUrl})
      : super(redirectUrl: redirectUrl, url: url);

  @override
  Future<String> fetchData(BuildContext context) async => 'success';
}

void main() {
  group('ConfirmationModel', () {
    test('clears WebView cache after it\'s disposed', () {
      final model = TestConfirmationModel(
        url: 'https://example.com',
        redirectUrl: 'https://example.com/redirect',
      );

      final controller = MockWebViewController();

      model.onControllerInitialized(controller);
      model.dispose();

      verify(controller.clearCache()).called(1);
    });

    test('catches a redirect successfully', () {
      final context = MockBuildContext();

      const url = 'https://example.com';
      const redirectUrl = 'https://example.com/redirect';
      final model = TestConfirmationModel(url: url, redirectUrl: redirectUrl);

      final controller = MockWebViewController();
      controller.loadUrl('https://example.com');

      model.onControllerInitialized(controller);

      expect(model.onPageFinished(context, url), false);
      expect(model.onPageFinished(context, redirectUrl), true);
    });

    testWithBuildContext(
      'pops the value in [fetchData] when [onRedirect] is called',
      (context, observer) async {
        const url = 'https://example.com';
        const redirectUrl = 'https://example.com/redirect';
        final model = TestConfirmationModel(url: url, redirectUrl: redirectUrl);

        final data = await model.onRedirect(context);
        verify(observer.didPop(any, any)).called(1);
        expect(data, equals('success'));
      },
    );
  });
}
