import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/api/utils/request_converter.dart';

import './generated/client_index.dart' as g;

class IokaApi {
  IokaApi({
    required String apiKey,
  }) : _interceptor = IokaAuthenticationRequestInterceptor(apiKey: apiKey) {
    _init();
  }

  void _init() {
    generatedApi = g.IokaApi.create(
      client: ChopperClient(
        converter: $JsonSerializableConverter(),
        interceptors: [_interceptor],
        services: [$IokaApi()],
        baseUrl: 'https://stage-api.ioka.kz',
      ),
    );
  }

  final IokaAuthenticationRequestInterceptor _interceptor;
  late final g.IokaApi generatedApi;

  Future<T> _makeResponse<T>(
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
      throw response.error as Object;
    }
  }

  Future<List<ExtendedCard>> getCards({
    required String customerAccessToken,
    required String customerId,
  }) {
    return _makeResponse(
      () => generatedApi.v2CustomersCustomerIdCardsGet(
        customerId: customerId,
      ),
      customerAccessToken: customerAccessToken,
    );
  }

  Future<ExtendedPayment> createNewCardPayment({
    required String orderId,
    required String orderAccessToken,
    required String pan,
    required String expiryDate,
    required String cvc,
  }) {
    return _makeResponse(
      () => generatedApi.v2OrdersOrderIdPaymentsCardPost(
        orderId: orderId,
        body: CardPayer(
          pan: pan,
          exp: expiryDate,
          cvc: cvc,
          save: false,
        ),
      ),
      orderAccessToken: orderAccessToken,
    );
  }

  Future<ExtendedPayment> createSavedCardPayment({
    required String orderId,
    required String orderAccessToken,
    required String cardId,
    String? cvc,
  }) {
    return _makeResponse(
      () => generatedApi.v2OrdersOrderIdPaymentsCardPost(
        orderId: orderId,
        body: CardPayer(
          cardId: cardId,
          cvc: cvc,
        ),
      ),
      orderAccessToken: orderAccessToken,
    );
  }

  Future<ExtendedPayment> getPaymentById({
    required String orderId,
    required String paymentId,
    required String orderAccessToken,
  }) {
    return _makeResponse(
      () => generatedApi.v2OrdersOrderIdPaymentsPaymentIdGet(
        orderId: orderId,
        paymentId: paymentId,
      ),
      orderAccessToken: orderAccessToken,
    );
  }

  Future<ExtendedCard> createBinding({
    required String customerId,
    required String pan,
    required String expiryDate,
    required String cvc,
    required String customerAccessToken,
  }) {
    return _makeResponse(
      () => generatedApi.v2CustomersCustomerIdBindingsPost(
        customerId: customerId,
        body: BindingCard(
          pan: pan,
          cvc: cvc,
          exp: expiryDate,
        ),
      ),
      customerAccessToken: customerAccessToken,
    );
  }

  Future<ExtendedCard> getCardById({
    required String customerId,
    required String cardId,
    required String customerAccessToken,
  }) {
    return _makeResponse(
      () => generatedApi.v2CustomersCustomerIdCardsCardIdGet(
        customerId: customerId,
        cardId: cardId,
      ),
      customerAccessToken: customerAccessToken,
    );
  }

  Future<dynamic> deleteCardById({
    required String customerId,
    required String cardId,
    required String customerAccessToken,
  }) {
    return _makeResponse(
      () => generatedApi.v2CustomersCustomerIdCardsCardIdDelete(
        customerId: customerId,
        cardId: cardId,
      ),
      customerAccessToken: customerAccessToken,
    );
  }

  Future<BrandOut> getBrand({
    required String partialBin,
  }) {
    return _makeResponse(
      () => generatedApi.v2BrandsGet(
        partialBin: partialBin,
      ),
    );
  }

  Future<BinInfo> getEmitterByBinCode({
    required String binCode,
  }) {
    return _makeResponse(
      () => generatedApi.v2BinsBinCodeGet(
        binCode: binCode,
      ),
    );
  }
}
