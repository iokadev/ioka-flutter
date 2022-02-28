import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/api/utils/request_interceptor.dart';

import './generated/client_index.dart' as g;
import 'utils/access_token_helpers.dart';
import 'utils/error.dart';

export './generated/ioka_api.enums.swagger.dart';
export './mock/card_data.dart';
export './mock/mock.dart';
export './mock/order.dart';
export './models/saved_card.dart';
class IokaApi {
  IokaApi({
    required String apiKey,
    required String baseUrl,
  }) : _interceptor = IokaAuthenticationRequestInterceptor(apiKey: apiKey) {
    init(baseUrl);
  }

  void init(String baseUrl) {
    generatedApi = g.IokaApi.create(
      client: ChopperClient(
        converter: $JsonSerializableConverter(),
        interceptors: [_interceptor],
        services: [$IokaApi()],
        baseUrl: baseUrl,
      ),
    );
  }

  final IokaAuthenticationRequestInterceptor _interceptor;
  late final g.IokaApi generatedApi;

  Future<T> _makeRequest<T>(
    Future<Response<T>> Function() callback, {
    String? customerAccessToken,
    String? orderAccessToken,
  }) async {
    _interceptor.setTokens(
      customerAccessToken: customerAccessToken,
      orderAccessToken: orderAccessToken,
    );

    final response = await callback();

    _interceptor.resetTokens();

    if (response.isSuccessful) {
      return response.body as T;
    } else {
      throw IokaError.fromJson(
        const Utf8Decoder().convert(
          response.bodyBytes,
        ),
      );
    }
  }

  Future<List<ExtendedCard>> getCards({
    required String customerAccessToken,
  }) {
    return _makeRequest(
      () => generatedApi.v2CustomersCustomerIdCardsGet(
        customerId: idFromAccessToken(customerAccessToken),
      ),
      customerAccessToken: customerAccessToken,
    );
  }

  Future<ExtendedPayment> createNewCardPayment({
    required String orderAccessToken,
    required String pan,
    required String expiryDate,
    required String cvc,
    String? customerAccessToken,
    bool save = false,
  }) {
    return _makeRequest(
      () => generatedApi.v2OrdersOrderIdPaymentsCardPost(
        orderId: idFromAccessToken(orderAccessToken),
        body: CardPayer(
          pan: pan,
          exp: expiryDate,
          cvc: cvc,
          save: save,
        ),
      ),
      orderAccessToken: orderAccessToken,
      customerAccessToken: customerAccessToken,
    );
  }

  Future<ExtendedPayment> createSavedCardPayment({
    required String orderAccessToken,
    required String cardId,
    String? cvc,
  }) {
    return _makeRequest(
      () => generatedApi.v2OrdersOrderIdPaymentsCardPost(
        orderId: idFromAccessToken(orderAccessToken),
        body: CardPayer(
          cardId: cardId,
          cvc: cvc,
        ),
      ),
      orderAccessToken: orderAccessToken,
    );
  }

  Future<OrderOut> getOrderById({
    required String orderAccessToken,
  }) {
    return _makeRequest(
      () => generatedApi.v2OrdersOrderIdGet(
        orderId: idFromAccessToken(orderAccessToken),
      ),
      orderAccessToken: orderAccessToken,
    );
  }

  Future<ExtendedPayment> getPaymentById({
    required String paymentId,
    required String orderAccessToken,
  }) {
    return _makeRequest(
      () => generatedApi.v2OrdersOrderIdPaymentsPaymentIdGet(
        orderId: idFromAccessToken(orderAccessToken),
        paymentId: paymentId,
      ),
      orderAccessToken: orderAccessToken,
    );
  }

  Future<ExtendedCard> createBinding({
    required String pan,
    required String expiryDate,
    required String cvc,
    required String customerAccessToken,
  }) {
    return _makeRequest(
      () => generatedApi.v2CustomersCustomerIdBindingsPost(
        customerId: idFromAccessToken(customerAccessToken),
        body: BindingCard(
          pan: pan,
          cvc: cvc,
          exp: expiryDate,
          holder: 'holder',
        ),
      ),
      customerAccessToken: customerAccessToken,
    );
  }

  Future<ExtendedCard> getCardById({
    required String cardId,
    required String customerAccessToken,
  }) {
    return _makeRequest(
      () => generatedApi.v2CustomersCustomerIdCardsCardIdGet(
        customerId: idFromAccessToken(customerAccessToken),
        cardId: cardId,
      ),
      customerAccessToken: customerAccessToken,
    );
  }

  Future<dynamic> deleteCardById({
    required String cardId,
    required String customerAccessToken,
  }) {
    return _makeRequest(
      () => generatedApi.v2CustomersCustomerIdCardsCardIdDelete(
        customerId: idFromAccessToken(customerAccessToken),
        cardId: cardId,
      ),
      customerAccessToken: customerAccessToken,
    );
  }

  Future<BrandOut> getBrand({
    required String partialBin,
  }) {
    return _makeRequest(
      () => generatedApi.v2BrandsGet(
        partialBin: partialBin,
      ),
    );
  }

  Future<BinInfo> getEmitterByBinCode({
    required String binCode,
  }) {
    return _makeRequest(
      () => generatedApi.v2BinsBinCodeGet(
        binCode: binCode,
      ),
    );
  }
}
