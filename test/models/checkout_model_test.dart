import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/src/api/api.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart' as g;
import 'package:ioka/src/models/checkout_model.dart';
import 'package:mockito/mockito.dart';

import '../test_utils.dart';

typedef CreatePaymentFunction = Future<g.ExtendedPayment> Function();

final _defaultPayment = g.ExtendedPayment(id: '1');

Future<g.ExtendedPayment> _createCapturedPaymentFn() async =>
    _defaultPayment.copyWith(
      status: PaymentStatus.captured,
    );

Future<g.ExtendedPayment> _createApprovedPaymentFn() async =>
    _defaultPayment.copyWith(
      status: PaymentStatus.approved,
    );

Future<g.ExtendedPayment> _createDeclinedPaymentFn() async =>
    _defaultPayment.copyWith(
      status: PaymentStatus.declined,
      error: g.PaymentError(
        code: 'code',
        message: 'declined',
      ),
    );

Future<g.ExtendedPayment> _create3dsPaymentFn() async =>
    _defaultPayment.copyWith(
      status: PaymentStatus.pending,
      action: g.TDSAction(url: 'https://example.com'),
    );

final _defaultOrder = g.OrderOut(
  amount: 100,
);

class TestCheckoutModel extends CheckoutModel {
  TestCheckoutModel({
    required g.OrderOut order,
    required String orderAccessToken,
    this.onSuccessCalled,
    this.onPaymentConfirmationCalled,
    this.onFailureCalled,
    CreatePaymentFunction? createPayment,
    this.onResetCalled,
  })  : _createPayment = createPayment,
        super(order: order, orderAccessToken: orderAccessToken);

  CreatePaymentFunction? _createPayment;
  final VoidCallback? onSuccessCalled;
  final CreatePaymentFunction? onPaymentConfirmationCalled;
  final bool Function()? onFailureCalled;
  final CreatePaymentFunction? Function()? onResetCalled;

  @override
  // ignore: overridden_fields
  final MockValueNotifier<bool> isInteractableNotifier = MockValueNotifier();

  @override
  Future<g.ExtendedPayment> createPayment() =>
      _createPayment != null ? _createPayment!() : _createCapturedPaymentFn();

  @override
  Future<void> onSuccess(BuildContext context) async {
    onSuccessCalled?.call();
  }

  @override
  Future<g.ExtendedPayment?> onPaymentConfirmation(
    BuildContext context, {
    required String paymentId,
    required String url,
  }) async {
    if (onPaymentConfirmationCalled != null) {
      return onPaymentConfirmationCalled!();
    }

    return null;
  }

  @override
  Future<bool> onFailure(BuildContext context, {String? reason}) async {
    var retry = false;
    if (onFailureCalled != null) retry = onFailureCalled!();

    if (retry) {
      reset();
    }

    return retry;
  }

  @override
  void reset() {
    if (onResetCalled != null) {
      final value = onResetCalled!();
      if (value != null) _createPayment = value;
    }

    super.reset();
  }

  @override
  bool get isValid => true;
}

void main() {
  group('CheckoutModel', () {
    test('calls [onSuccess] when the payment is captured', () async {
      var onSuccessCalled = false;

      final model = TestCheckoutModel(
        order: _defaultOrder,
        createPayment: _createCapturedPaymentFn,
        onSuccessCalled: () => onSuccessCalled = true,
        orderAccessToken: '',
      );

      final value = await model.submit(
        MockBuildContext(),
        shouldPopRoute: false,
      );

      expect(value, equals(await _createCapturedPaymentFn()));
      expect(onSuccessCalled, isTrue);
    });
    test('calls [onSuccess] when the payment is approved', () async {
      var onSuccessCalled = false;

      final model = TestCheckoutModel(
        order: _defaultOrder,
        createPayment: _createApprovedPaymentFn,
        onSuccessCalled: () => onSuccessCalled = true,
        orderAccessToken: '',
      );

      final value = await model.submit(
        MockBuildContext(),
        shouldPopRoute: false,
      );

      expect(value, equals(await _createApprovedPaymentFn()));
      expect(onSuccessCalled, isTrue);
    });
    test('calls [onFailure] when the payment is declined', () async {
      var onFailureCalled = false;

      final model = TestCheckoutModel(
        order: _defaultOrder,
        createPayment: _createDeclinedPaymentFn,
        onFailureCalled: () {
          onFailureCalled = true;
          return false;
        },
        orderAccessToken: '',
      );

      final value = await model.submit(
        MockBuildContext(),
        shouldPopRoute: false,
      );

      expect(value, isNull);
      expect(onFailureCalled, isTrue);
    });
    test('calls [reset] and retries when the payment is declined', () async {
      var onSuccessCalled = false;
      var onFailureCalled = false;
      var onResetCalled = false;

      final model = TestCheckoutModel(
        order: _defaultOrder,
        createPayment: _createDeclinedPaymentFn,
        onSuccessCalled: () => onSuccessCalled = true,
        onFailureCalled: () {
          onFailureCalled = true;
          return true;
        },
        onResetCalled: () {
          onResetCalled = true;
          return _createCapturedPaymentFn;
        },
        orderAccessToken: '',
      );

      final value = await model.submit(
        MockBuildContext(),
        shouldPopRoute: false,
      );

      expect(value, isNull);
      expect(onSuccessCalled, isFalse);
      expect(onResetCalled, isTrue);
      expect(onFailureCalled, isTrue);

      onSuccessCalled = false;
      onFailureCalled = false;
      onResetCalled = false;

      final newValue = await model.submit(
        MockBuildContext(),
        shouldPopRoute: false,
      );

      expect(newValue, equals(await _createCapturedPaymentFn()));
      expect(onSuccessCalled, isTrue);
      expect(onResetCalled, isFalse);
      expect(onFailureCalled, isFalse);
    });
    test(
      // ignore: lines_longer_than_80_chars
      'calls [onPaymentConfirmation] when the payment is pending and calls [onSuccess] after confirmation',
      () async {
        var onSuccessCalled = false;
        var onPaymentConfirmationCalled = false;

        final model = TestCheckoutModel(
          order: _defaultOrder,
          createPayment: _create3dsPaymentFn,
          onSuccessCalled: () => onSuccessCalled = true,
          onPaymentConfirmationCalled: () {
            onPaymentConfirmationCalled = true;
            return _createCapturedPaymentFn();
          },
          orderAccessToken: '',
        );

        final value = await model.submit(
          MockBuildContext(),
          shouldPopRoute: false,
        );

        expect(value, equals(await _createCapturedPaymentFn()));
        expect(onSuccessCalled, isTrue);
        expect(onPaymentConfirmationCalled, isTrue);
      },
    );
    test(
      // ignore: lines_longer_than_80_chars
      'calls [onPaymentConfirmation] when the payment is pending and calls [onFailure] after confirmation',
      () async {
        var onFailureCalled = false;
        var onPaymentConfirmationCalled = false;

        final model = TestCheckoutModel(
          order: _defaultOrder,
          createPayment: _create3dsPaymentFn,
          onFailureCalled: () {
            onFailureCalled = true;
            return false;
          },
          onPaymentConfirmationCalled: () {
            onPaymentConfirmationCalled = true;
            return _createDeclinedPaymentFn();
          },
          orderAccessToken: '',
        );

        final value = await model.submit(
          MockBuildContext(),
          shouldPopRoute: false,
        );

        expect(value, isNull);
        expect(onFailureCalled, isTrue);
        expect(onPaymentConfirmationCalled, isTrue);
      },
    );
    test('blocks interactions upon calling [submit]', () async {
      final model = TestCheckoutModel(
        order: _defaultOrder,
        orderAccessToken: '',
      );

      final future = model.submit(MockBuildContext(), shouldPopRoute: false);

      verify(model.isInteractableNotifier.value = false).called(1);

      await future;

      verify(model.isInteractableNotifier.value = true).called(1);
    });
    test('resets the form upon calling [reset]', () {
      final model = TestCheckoutModel(
        order: _defaultOrder,
        orderAccessToken: '',
      );

      final initialFormKeyHashCode = model.formKey.hashCode;
      model.reset();

      expect(model.formKey.hashCode, isNot(equals(initialFormKeyHashCode)));
    });
  });
}
