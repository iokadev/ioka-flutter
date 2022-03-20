// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/src/models/confirmation_model.dart';
import 'package:mockito/mockito.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MockWebViewController extends Mock implements WebViewController {
  @override
  Future<void> clearCache() =>
      (super.noSuchMethod(Invocation.method(#clearCache, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as Future<void>);
}

class TestNavigationRequest implements NavigationRequest {
  TestNavigationRequest({required this.url});

  @override
  final String url;

  @override
  bool get isForMainFrame => true;
}

class TestConfirmationModel extends ConfirmationModel<String> {
  TestConfirmationModel({
    required String url,
    required String redirectUrl,
    this.onRedirectCalled,
  }) : super(redirectUrl: redirectUrl, url: url);

  final VoidCallback? onRedirectCalled;

  @override
  Future<String> fetchData(BuildContext context) async => 'success';

  @override
  Future<String> onRedirect(BuildContext context) {
    if (onRedirectCalled != null) onRedirectCalled!();

    return super.onRedirect(context);
  }
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

    // Disabled for now: need to find a way to inject Navigator into the stack
    // test('catches a redirect successfully', () {
    //   final context = MockBuildContext();

    //   const url = 'https://example.com';
    //   const redirectUrl = 'https://example.com/redirect';

    //   var onRedirectCalled = false;
    //   final model = TestConfirmationModel(
    //     url: url,
    //     redirectUrl: redirectUrl,
    //     onRedirectCalled: () => onRedirectCalled = true,
    //   );

    //   final controller = MockWebViewController();
    //   model.onControllerInitialized(controller);

    //   model.navigationDelegate(context, TestNavigationRequest(url: url));
    //   expect(onRedirectCalled, false);

    //   model.navigationDelegate(
    //     context,
    //     TestNavigationRequest(url: redirectUrl),
    //   );
    //   expect(onRedirectCalled, true);
    // });

    // testWithBuildContext(
    //   'pops the value in [fetchData] when [onRedirect] is called',
    //   (context, observer) async {
    //     const url = 'https://example.com';
    //     const redirectUrl = 'https://example.com/redirect';
    //     final model = TestConfirmationModel(url: url, redirectUrl: redirectUrl);

    //     final data = await model.onRedirect(context);
    //     verify(observer.didPop(any, any)).called(1);
    //     expect(data, equals('success'));
    //   },
    // );
  });
}
