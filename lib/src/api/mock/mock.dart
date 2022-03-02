import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/card_number.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart' as g;
import 'package:ioka/src/api/utils/access_token_helpers.dart';
import 'package:ioka/src/api/models/error.dart';

class MockIokaApi extends IokaApi {
  MockIokaApi({
    String? customerAccessToken,
    Map<String, MockCardData>? successfulCards,
  })  : _customerAccessToken =
            customerAccessToken ?? defaultCustomerAccessToken,
        _successfulCards = successfulCards ?? defaultSuccessfulCards,
        super(apiKey: '', baseUrl: '');

  final String _customerAccessToken;
  final Map<String, MockCardData> _successfulCards;

  final _savedCards = <String, g.ExtendedCard>{};

  final _payments = <String, g.ExtendedPayment>{};
  final _orders = <String, MockOrder>{};

  static String get defaultCustomerAccessToken => 'customerid_secret_secret';

  static Map<String, MockCardData> get defaultSuccessfulCards => const {
        '4111111111111111': MockCardData(
          cardNumber: '4111111111111111',
          expiryDate: '12/24',
          cvc: '123',
          requiresCvc: true,
          emitter: 'kaspi',
          type: 'visa',
        ),
        '5555555555555599': MockCardData(
          cardNumber: '5555555555555599',
          expiryDate: '12/24',
          cvc: '123',
          requiresCvc: false,
          emitter: 'jysan',
          type: 'mastercard',
        ),
      };

  @override
  void init(String baseUrl) {}

  @override
  Future<List<g.ExtendedCard>> getCards({
    required String customerAccessToken,
  }) async {
    if (customerAccessToken == _customerAccessToken) {
      return _savedCards.values.toList();
    }

    throw IokaError(
      code: 'code',
      message: 'Invalid [customerAccessToken]',
    );
  }

  Future<String> mockCreateOrder({required int amount}) async {
    final id = _orders.length.toString();
    final token = '${id}_secret_secret';

    _orders[id] = MockOrder(
      id: id,
      amount: amount,
      status: OrderStatus.unpaid,
    );

    return token;
  }

  g.ExtendedPayment _mockCreatePayment(g.ExtendedPayment payment) {
    final id = _payments.length.toString();
    _payments[id] = payment.copyWith(id: id);

    return _payments[id]!;
  }

  String _maskPan(String pan) {
    return pan.substring(0, 6) + '****' + pan.substring(12);
  }

  bool _isSuccessfulSavedCard(String id, {String? cvc}) {
    final pan = _savedCards.entries.where((v) => v.value.id == id).first.key;
    final card = _successfulCards[pan];

    if (card == null) {
      return false;
    }

    if (card.requiresCvc && cvc == null) {
      return false;
    }

    if (cvc != null && card.cvc != cvc) {
      return false;
    }

    return true;
  }

  bool _isSuccessfulCard(String pan, String expiryDate, String cvc) {
    return _successfulCards.values.any(
      (card) {
        return card.cardNumber == pan &&
            card.expiryDate == expiryDate &&
            card.cvc == cvc;
      },
    );
  }

  @override
  Future<g.ExtendedPayment> createNewCardPayment({
    required String orderAccessToken,
    required String pan,
    required String expiryDate,
    required String cvc,
    String? customerAccessToken,
    bool save = false,
  }) async {
    final orderId = idFromAccessToken(orderAccessToken);
    final order = _orders[orderId];

    if (order == null) {
      throw IokaError(
        code: 'code',
        message: 'Order not found',
      );
    }

    final payment = g.ExtendedPayment(
      id: 'payment_id',
      orderId: order.id,
      status: PaymentStatus.captured,
      createdAt: DateTime.now(),
      approvedAmount: order.amount,
      capturedAmount: order.amount,
      processingFee: 0.0,
      refundedAmount: 0,
      acquirer: g.Acquirer(
        name: 'test_bank',
        reference: '111',
      ),
      payer: g.PayerOut(
        panMasked: _maskPan(pan),
        expiryDate: expiryDate,
        holder: 'holder',
      ),
    );

    if (_isSuccessfulCard(pan, expiryDate, cvc)) {
      _orders[orderId] = _orders[orderId]!.copyWith(
        status: OrderStatus.paid,
      );

      return _mockCreatePayment(payment);
    }

    return _mockCreatePayment(
      g.ExtendedPayment(
        id: 'payment_id',
        orderId: order.id,
        approvedAmount: 0,
        capturedAmount: 0,
        processingFee: 0.0,
        refundedAmount: 0,
        status: PaymentStatus.declined,
        error: g.PaymentError(
          code: 'error',
          message: 'Payment declined',
        ),
      ),
    );
  }

  @override
  Future<g.ExtendedPayment> createSavedCardPayment({
    required String orderAccessToken,
    required String cardId,
    String? cvc,
  }) async {
    final orderId = idFromAccessToken(orderAccessToken);
    final order = _orders[orderId];

    final cards = _savedCards.values.where((card) => card.id == cardId);
    final card = cards.isNotEmpty ? cards.first : null;

    if (order == null) {
      throw IokaError(
        code: 'code',
        message: 'Order not found',
      );
    }

    if (card == null) {
      throw IokaError(
        code: 'code',
        message: 'Card not found',
      );
    }

    final payment = g.ExtendedPayment(
      id: 'payment_id',
      orderId: order.id,
      status: PaymentStatus.captured,
      createdAt: DateTime.now(),
      approvedAmount: order.amount,
      capturedAmount: order.amount,
      processingFee: 0.0,
      refundedAmount: 0,
      acquirer: g.Acquirer(
        name: 'test_bank',
        reference: '111',
      ),
      payer: g.PayerOut(
        panMasked: card.panMasked,
        expiryDate: card.expiryDate,
        holder: 'holder',
      ),
    );

    if (_isSuccessfulSavedCard(card.id!, cvc: cvc)) {
      _orders[orderId] = _orders[orderId]!.copyWith(
        status: OrderStatus.paid,
      );

      return _mockCreatePayment(payment);
    }

    return _mockCreatePayment(
      payment.copyWith(
        status: PaymentStatus.declined,
        error: g.PaymentError(
          code: 'error',
          message: 'Payment declined',
        ),
      ),
    );
  }

  @override
  Future<g.OrderOut> getOrderById({
    required String orderAccessToken,
  }) async {
    final order = _orders[idFromAccessToken(orderAccessToken)];

    if (order == null) {
      throw IokaError(
        code: 'code',
        message: 'Order not found',
      );
    }

    return g.OrderOut(
      id: order.id,
      amount: order.amount,
      status: order.status,
    );
  }

  @override
  Future<g.ExtendedPayment> getPaymentById({
    required String paymentId,
    required String orderAccessToken,
  }) async {
    final payment = _payments[paymentId];

    if (payment == null) {
      throw IokaError(
        code: 'code',
        message: 'Order not found',
      );
    }

    return payment;
  }

  @override
  Future<g.ExtendedCard> createBinding({
    required String pan,
    required String expiryDate,
    required String cvc,
    required String customerAccessToken,
  }) async {
    if (customerAccessToken != _customerAccessToken) {
      throw IokaError(
        code: 'code',
        message: 'Customer not found',
      );
    }

    final card = g.ExtendedCard(
      id: pan,
      panMasked: _maskPan(pan),
      expiryDate: expiryDate,
      holder: 'holder',
    );

    _savedCards[pan] = card;
    return card;
  }

  @override
  Future<g.ExtendedCard> getCardById({
    required String cardId,
    required String customerAccessToken,
  }) async {
    if (customerAccessToken != _customerAccessToken) {
      throw IokaError(
        code: 'code',
        message: 'Customer not found',
      );
    }

    final cards = _savedCards.values.where((card) => card.id == cardId);
    final card = cards.isNotEmpty ? cards.first : null;

    if (card == null) {
      throw IokaError(
        code: 'code',
        message: 'Card not found',
      );
    }

    return card;
  }

  @override
  Future<dynamic> deleteCardById({
    required String cardId,
    required String customerAccessToken,
  }) async {
    if (customerAccessToken != _customerAccessToken) {
      throw IokaError(
        code: 'code',
        message: 'Customer not found',
      );
    }

    _savedCards.removeWhere((key, value) => value.id == cardId);
  }

  @override
  Future<g.BrandOut> getBrand({
    required String partialBin,
  }) async {
    final value = validateCardNumber(partialBin);
    final type = value.ccType;

    switch (type) {
      case CreditCardType.visa:
        return g.BrandOut(brand: MyPaymentCardBrand.visa);
      case CreditCardType.mastercard:
        return g.BrandOut(brand: MyPaymentCardBrand.mastercard);
      case CreditCardType.maestro:
        return g.BrandOut(brand: MyPaymentCardBrand.maestro);
      case CreditCardType.amex:
        return g.BrandOut(brand: MyPaymentCardBrand.americanExpress);
      case CreditCardType.discover:
        return g.BrandOut(brand: MyPaymentCardBrand.discovery);
      case CreditCardType.dinersclub:
        return g.BrandOut(brand: MyPaymentCardBrand.dinerClub);
      case CreditCardType.jcb:
        return g.BrandOut(brand: MyPaymentCardBrand.jcb);
      case CreditCardType.unionpay:
        return g.BrandOut(brand: MyPaymentCardBrand.unionPay);
      case CreditCardType.elo:
        return g.BrandOut(brand: MyPaymentCardBrand.elo);
      case CreditCardType.mir:
        return g.BrandOut(brand: MyPaymentCardBrand.mir);
      case CreditCardType.hiper:
        return g.BrandOut(brand: MyPaymentCardBrand.hiper);
      case CreditCardType.hipercard:
        return g.BrandOut(brand: MyPaymentCardBrand.hipercard);
      case CreditCardType.unknown:
        throw IokaError(
          code: 'code',
          message: 'Card type not found',
        );
    }
  }

  @override
  Future<g.BinInfo> getEmitterByBinCode({
    required String binCode,
  }) async {
    if (binCode == '555555' || binCode == '411111') {
      return g.BinInfo(
        emitterCode: 'kaspi',
        emitterName: 'Kaspi',
      );
    }

    throw IokaError(
      code: 'code',
      message: 'Bin code not found',
    );
  }
}
