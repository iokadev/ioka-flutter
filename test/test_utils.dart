import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';

Widget necessaryAncestors({
  required Widget child,
  NavigatorObserver? observer,
}) {
  return MaterialApp(
    home: child,
    navigatorObservers: observer != null ? [observer] : [],
  );
}

Widget viewWrapper({
  required Widget child,
  Platform platform = Platform.cupertino,
  IokaTheme? theme,
  Brightness? brightness,
  Locale? locale,
}) {
  var _theme = theme;

  _theme ??= brightness == Brightness.dark
      ? IokaTheme.simpleDark(fontFamily: 'Inter')
      : IokaTheme.simpleLight(fontFamily: 'Inter');

  return IokaViewWrapper(
    platform: platform,
    theme: _theme,
    locale: locale ?? const Locale('ru'),
    child: child,
  );
}

extension IokaMockGrabber on IokaApi {
  MockIokaApi get asMock => this as MockIokaApi;
}

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {
  @override
  void didPush(Route<dynamic>? a, Route<dynamic>? b) =>
      super.noSuchMethod(Invocation.method(#didPush, [a, b]));

  @override
  void didPop(Route<dynamic>? a, Route<dynamic>? b) =>
      super.noSuchMethod(Invocation.method(#didPop, [a, b]));
}

@isTest
void testWithBuildContext(
  String description,
  Future<void> Function(BuildContext, MockNavigatorObserver) test,
) {
  testWidgets(description, (WidgetTester tester) async {
    final observer = MockNavigatorObserver();

    late BuildContext _context;

    await tester.pumpWidget(
      necessaryAncestors(
        observer: observer,
        child: viewWrapper(
          child: Builder(
            builder: (context) {
              _context = context;
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );

    await test(_context, observer);
  });
}

class MockValueNotifier<T> extends Mock implements ValueNotifier<T> {}
