import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';

void main() {
  group('MockIokaApi', () {
    group('getCards', () {
      test('returns saved cards', () async {
        final api = MockIokaApi();

        final cards = await api.getCards(
          customerAccessToken: MockIokaApi.defaultCustomerAccessToken,
        );

        expect(cards, isEmpty);

        final card = MockIokaApi.defaultSuccessfulCards.values.first;
        final response = await api.createBinding(
          customerAccessToken: MockIokaApi.defaultCustomerAccessToken,
          pan: card.cardNumber,
          expiryDate: card.expiryDate,
          cvc: card.cvc,
        );

        expect(response.expiryDate, equals(card.expiryDate));

        final newCards = await api.getCards(
          customerAccessToken: MockIokaApi.defaultCustomerAccessToken,
        );

        expect(newCards, isNotEmpty);
        expect(newCards[0], equals(response));
      });

      test('throws on invalid customer access token', () async {
        final api = MockIokaApi();

        expect(
          () => api.getCards(customerAccessToken: 'invalid'),
          throwsA(isA<IokaError>()),
        );
      });
    });

    group('mockCreateOrder', () {
      test('can create an order', () async {
        final api = MockIokaApi();

        final orderAccessToken = await api.mockCreateOrder(amount: 100);
        final order =
            await api.getOrderById(orderAccessToken: orderAccessToken);

        expect(order.amount, equals(100));
      });
    });

    group('createNewCardPayment', () {
      test(
        'can create a successful payment',
        () async {
          final api = MockIokaApi();

          final orderAccessToken = await api.mockCreateOrder(amount: 100);

          final card = MockIokaApi.defaultSuccessfulCards.values.first;
          final payment = await api.createNewCardPayment(
            orderAccessToken: orderAccessToken,
            pan: card.cardNumber,
            expiryDate: card.expiryDate,
            cvc: card.cvc,
          );

          expect(payment.status, equals(PaymentStatus.captured));
          expect(payment.capturedAmount, equals(100));

          final order = await api.getOrderById(
            orderAccessToken: orderAccessToken,
          );

          expect(order.status, equals(OrderStatus.paid));
        },
      );

      test(
        'can create a failed payment',
        () async {
          final api = MockIokaApi();

          final orderAccessToken = await api.mockCreateOrder(amount: 100);

          final payment = await api.createNewCardPayment(
            orderAccessToken: orderAccessToken,
            pan: '1111111111111111',
            expiryDate: '12/20',
            cvc: '123',
          );

          expect(payment.status, equals(PaymentStatus.declined));

          final order = await api.getOrderById(
            orderAccessToken: orderAccessToken,
          );

          expect(order.status, equals(OrderStatus.unpaid));
        },
      );
    });

    group('createSavedCardPayment', () {
      test(
        'can create a successful payment',
        () async {
          final api = MockIokaApi();

          final card = MockIokaApi.defaultSuccessfulCards.values.first;
          await api.createBinding(
            customerAccessToken: MockIokaApi.defaultCustomerAccessToken,
            pan: card.cardNumber,
            expiryDate: card.expiryDate,
            cvc: card.cvc,
          );

          final orderAccessToken = await api.mockCreateOrder(amount: 100);

          final payment = await api.createSavedCardPayment(
            orderAccessToken: orderAccessToken,
            cardId: card.cardNumber,
            cvc: card.cvc,
          );

          expect(payment.status, equals(PaymentStatus.captured));
          expect(payment.capturedAmount, equals(100));

          final order = await api.getOrderById(
            orderAccessToken: orderAccessToken,
          );

          expect(order.status, equals(OrderStatus.paid));
        },
      );

      test(
        'can create a failed payment',
        () async {
          final api = MockIokaApi();

          final card = MockIokaApi.defaultSuccessfulCards.values.first;
          await api.createBinding(
            customerAccessToken: MockIokaApi.defaultCustomerAccessToken,
            pan: card.cardNumber,
            expiryDate: card.expiryDate,
            cvc: card.cvc,
          );

          final orderAccessToken = await api.mockCreateOrder(amount: 100);

          final payment = await api.createSavedCardPayment(
            orderAccessToken: orderAccessToken,
            cardId: card.cardNumber,
            cvc: '999',
          );

          expect(payment.status, equals(PaymentStatus.declined));

          final order = await api.getOrderById(
            orderAccessToken: orderAccessToken,
          );

          expect(order.status, equals(OrderStatus.unpaid));
        },
      );
    });

    group('getOrderById', () {
      test(
        'returns an order',
        () async {
          final api = MockIokaApi();

          final orderAccessToken = await api.mockCreateOrder(amount: 100);

          final order = await api.getOrderById(
            orderAccessToken: orderAccessToken,
          );

          expect(order, isNotNull);
        },
      );

      test(
        'throws if order does not exist',
        () async {
          final api = MockIokaApi();

          await api.mockCreateOrder(amount: 100);

          expect(
            () => api.getOrderById(orderAccessToken: 'aaa_secret_bbb'),
            throwsA(isA<IokaError>()),
          );
        },
      );
    });
  });
}
