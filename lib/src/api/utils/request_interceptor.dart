import 'dart:async';

import 'package:chopper/chopper.dart';

// ignore: must_be_immutable
class IokaAuthenticationRequestInterceptor extends RequestInterceptor {
  IokaAuthenticationRequestInterceptor({
    required String apiKey,
  }) : _apiKey = apiKey;

  final String _apiKey;
  String? customerAccessToken;
  String? orderAccessToken;

  void setTokens({
    String? customerAccessToken,
    String? orderAccessToken,
  }) {
    this.customerAccessToken = customerAccessToken;
    this.orderAccessToken = orderAccessToken;
  }

  void resetTokens() {
    customerAccessToken = null;
    orderAccessToken = null;
  }

  @override
  FutureOr<Request> onRequest(Request request) {
    return request.copyWith(
      headers: {
        ...request.headers,
        'X-Public-Key': _apiKey,
        if (customerAccessToken != null)
          'X-Customer-Access-Token': customerAccessToken!,
        if (orderAccessToken != null) 'X-Order-Access-Token': orderAccessToken!,
      },
    );
  }
}
