// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ioka_api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class $IokaApi extends IokaApi {
  $IokaApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = IokaApi;

  @override
  Future<Response<PaymentMethodOut>> _v2PaymentMethodsPost(
      {required PaymentMethodIn? body}) {
    final $url = '/v2/payment-methods';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PaymentMethodOut, PaymentMethodOut>($request);
  }

  @override
  Future<Response<ApplePayOut>> _v2PaymentMethodsOrderIdApplePaySessionPost(
      {required String? orderId, required ApplePayIn? body}) {
    final $url = '/v2/payment-methods/${orderId}/apple-pay-session';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ApplePayOut, ApplePayOut>($request);
  }

  @override
  Future<Response<OrderAndAccessToken>> _v2OrdersPost(
      {required OrderIn? body}) {
    final $url = '/v2/orders';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<OrderAndAccessToken, OrderAndAccessToken>($request);
  }

  @override
  Future<Response<List<OrderOut>>> _v2OrdersGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      String? dateCategory,
      String? orderId,
      String? externalId,
      String? orderStatus,
      String? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    final $url = '/v2/orders';
    final $params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'order_id': orderId,
      'external_id': externalId,
      'order_status': orderStatus,
      'amount_category': amountCategory,
      'fixed_amount': fixedAmount,
      'min_amount': minAmount,
      'max_amount': maxAmount
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<OrderOut>, OrderOut>($request);
  }

  @override
  Future<Response<OrderOut>> _v2OrdersOrderIdGet({required String? orderId}) {
    final $url = '/v2/orders/${orderId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<OrderOut, OrderOut>($request);
  }

  @override
  Future<Response<ExtendedPayment>> _v2OrdersOrderIdCapturePost(
      {required String? orderId, required PaymentCapture? body}) {
    final $url = '/v2/orders/${orderId}/capture';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedPayment, ExtendedPayment>($request);
  }

  @override
  Future<Response<ExtendedPayment>> _v2OrdersOrderIdCancelPost(
      {required String? orderId, required PaymentCancel? body}) {
    final $url = '/v2/orders/${orderId}/cancel';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedPayment, ExtendedPayment>($request);
  }

  @override
  Future<Response<List<ExtendedRefund>>> _v2OrdersOrderIdRefundsGet() {
    final $url = '/v2/orders/{order_id}/refunds';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ExtendedRefund>, ExtendedRefund>($request);
  }

  @override
  Future<Response<ExtendedRefund>> _v2OrdersOrderIdRefundsPost(
      {required String? orderId, required RefundIn? body}) {
    final $url = '/v2/orders/${orderId}/refunds';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedRefund, ExtendedRefund>($request);
  }

  @override
  Future<Response<ExtendedRefund>> _v2OrdersOrderIdRefundsRefundIdGet() {
    final $url = '/v2/orders/{order_id}/refunds/{refund_id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ExtendedRefund, ExtendedRefund>($request);
  }

  @override
  Future<Response<List<OrderEventOut>>> _v2OrdersOrderIdEventsGet(
      {required String? orderId}) {
    final $url = '/v2/orders/${orderId}/events';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<OrderEventOut>, OrderEventOut>($request);
  }

  @override
  Future<Response<List<PaymentOut>>> _v2OrdersOrderIdPaymentsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      String? dateCategory,
      String? orderId,
      String? externalId,
      String? paymentId,
      String? panFirst6,
      String? panLast4,
      String? payerEmail,
      String? payerPhone,
      String? customerId,
      String? paymentStatus,
      String? paymentSystem,
      String? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    final $url = '/v2/orders/{order_id}/payments';
    final $params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'order_id': orderId,
      'external_id': externalId,
      'payment_id': paymentId,
      'pan_first6': panFirst6,
      'pan_last4': panLast4,
      'payer_email': payerEmail,
      'payer_phone': payerPhone,
      'customer_id': customerId,
      'payment_status': paymentStatus,
      'payment_system': paymentSystem,
      'amount_category': amountCategory,
      'fixed_amount': fixedAmount,
      'min_amount': minAmount,
      'max_amount': maxAmount
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<PaymentOut>, PaymentOut>($request);
  }

  @override
  Future<Response<ExtendedPayment>> _v2OrdersOrderIdPaymentsPost(
      {required String? orderId, required PaymentIn? body}) {
    final $url = '/v2/orders/${orderId}/payments';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedPayment, ExtendedPayment>($request);
  }

  @override
  Future<Response<ExtendedPayment>> _v2OrdersOrderIdPaymentsCardPost(
      {required String? orderId, required CardPayer? body}) {
    final $url = '/v2/orders/${orderId}/payments/card';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedPayment, ExtendedPayment>($request);
  }

  @override
  Future<Response<ExtendedPayment>> _v2OrdersOrderIdPaymentsPaymentIdGet(
      {required String? orderId, required String? paymentId}) {
    final $url = '/v2/orders/${orderId}/payments/${paymentId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ExtendedPayment, ExtendedPayment>($request);
  }

  @override
  Future<Response<ExtendedPayment>>
      _v2OrdersOrderIdPaymentsPaymentIdCapturePost(
          {required String? orderId,
          required String? paymentId,
          required PaymentCapture? body}) {
    final $url = '/v2/orders/${orderId}/payments/${paymentId}/capture';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedPayment, ExtendedPayment>($request);
  }

  @override
  Future<Response<ExtendedPayment>> _v2OrdersOrderIdPaymentsPaymentIdCancelPost(
      {required String? orderId,
      required String? paymentId,
      required PaymentCancel? body}) {
    final $url = '/v2/orders/${orderId}/payments/${paymentId}/cancel';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedPayment, ExtendedPayment>($request);
  }

  @override
  Future<Response<List<RefundOut>>> _v2OrdersOrderIdPaymentsPaymentIdRefundsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      String? dateCategory,
      String? orderId,
      String? paymentId,
      String? refundStatus,
      String? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    final $url = '/v2/orders/{order_id}/payments/{payment_id}/refunds';
    final $params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'order_id': orderId,
      'payment_id': paymentId,
      'refund_status': refundStatus,
      'amount_category': amountCategory,
      'fixed_amount': fixedAmount,
      'min_amount': minAmount,
      'max_amount': maxAmount
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<RefundOut>, RefundOut>($request);
  }

  @override
  Future<Response<ExtendedRefund>> _v2OrdersOrderIdPaymentsPaymentIdRefundsPost(
      {required String? orderId,
      required String? paymentId,
      required RefundIn? body}) {
    final $url = '/v2/orders/${orderId}/payments/${paymentId}/refunds';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedRefund, ExtendedRefund>($request);
  }

  @override
  Future<Response<List<WebhookOut>>> _v2WebhooksGet() {
    final $url = '/v2/webhooks';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<WebhookOut>, WebhookOut>($request);
  }

  @override
  Future<Response<WebhookOut>> _v2WebhooksPost({required WebhookIn? body}) {
    final $url = '/v2/webhooks';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<WebhookOut, WebhookOut>($request);
  }

  @override
  Future<Response<WebhookOut>> _v2WebhooksWebhookIdGet(
      {required String? webhookId}) {
    final $url = '/v2/webhooks/${webhookId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<WebhookOut, WebhookOut>($request);
  }

  @override
  Future<Response<dynamic>> _v2WebhooksWebhookIdDelete(
      {required String? webhookId}) {
    final $url = '/v2/webhooks/${webhookId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<WebhookOut>> _v2WebhooksWebhookIdPatch(
      {required String? webhookId, required WebhookPatch? body}) {
    final $url = '/v2/webhooks/${webhookId}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<WebhookOut, WebhookOut>($request);
  }

  @override
  Future<Response<List<ExtendedCustomer>>> _v2CustomersGet(
      {int? limit,
      int? page,
      String? toDt,
      String? fromDt,
      String? dateCategory,
      String? customerId,
      String? externalId,
      String? status}) {
    final $url = '/v2/customers';
    final $params = <String, dynamic>{
      'limit': limit,
      'page': page,
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'customer_id': customerId,
      'external_id': externalId,
      'status': status
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<ExtendedCustomer>, ExtendedCustomer>($request);
  }

  @override
  Future<Response<CustomerAndAccessToken>> _v2CustomersPost(
      {required CustomerIn? body}) {
    final $url = '/v2/customers';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<CustomerAndAccessToken, CustomerAndAccessToken>($request);
  }

  @override
  Future<Response<ExtendedCustomer>> _v2CustomersCustomerIdGet(
      {required String? customerId}) {
    final $url = '/v2/customers/${customerId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ExtendedCustomer, ExtendedCustomer>($request);
  }

  @override
  Future<Response<dynamic>> _v2CustomersCustomerIdDelete(
      {required String? customerId}) {
    final $url = '/v2/customers/${customerId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<CustomerEventOut>>> _v2CustomersCustomerIdEventsGet(
      {required String? customerId}) {
    final $url = '/v2/customers/${customerId}/events';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<CustomerEventOut>, CustomerEventOut>($request);
  }

  @override
  Future<Response<ExtendedCard>> _v2CustomersCustomerIdBindingsPost(
      {required String? customerId, required BindingCard? body}) {
    final $url = '/v2/customers/${customerId}/bindings';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedCard, ExtendedCard>($request);
  }

  @override
  Future<Response<List<ExtendedCard>>> _v2CustomersCustomerIdCardsGet(
      {required String? customerId}) {
    final $url = '/v2/customers/${customerId}/cards';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ExtendedCard>, ExtendedCard>($request);
  }

  @override
  Future<Response<ExtendedCard>> _v2CustomersCustomerIdCardsPost(
      {required String? customerId, required CardIn? body}) {
    final $url = '/v2/customers/${customerId}/cards';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExtendedCard, ExtendedCard>($request);
  }

  @override
  Future<Response<ExtendedCard>> _v2CustomersCustomerIdCardsCardIdGet(
      {required String? customerId, required String? cardId}) {
    final $url = '/v2/customers/${customerId}/cards/${cardId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ExtendedCard, ExtendedCard>($request);
  }

  @override
  Future<Response<dynamic>> _v2CustomersCustomerIdCardsCardIdDelete(
      {required String? customerId, required String? cardId}) {
    final $url = '/v2/customers/${customerId}/cards/${cardId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<SubscriptionOut>>> _v2SubscriptionsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      String? dateCategory,
      String? subscriptionId,
      String? panFirst6,
      String? panLast4,
      String? status,
      String? nextPay,
      int? step,
      String? unit,
      String? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    final $url = '/v2/subscriptions';
    final $params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'subscription_id': subscriptionId,
      'pan_first6': panFirst6,
      'pan_last4': panLast4,
      'status': status,
      'next_pay': nextPay,
      'step': step,
      'unit': unit,
      'amount_category': amountCategory,
      'fixed_amount': fixedAmount,
      'min_amount': minAmount,
      'max_amount': maxAmount
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<SubscriptionOut>, SubscriptionOut>($request);
  }

  @override
  Future<Response<SubscriptionOut>> _v2SubscriptionsPost(
      {required SubscriptionIn? body}) {
    final $url = '/v2/subscriptions';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SubscriptionOut, SubscriptionOut>($request);
  }

  @override
  Future<Response<SubscriptionOut>> _v2SubscriptionsSubscriptionIdGet(
      {required String? subscriptionId}) {
    final $url = '/v2/subscriptions/${subscriptionId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SubscriptionOut, SubscriptionOut>($request);
  }

  @override
  Future<Response<SubscriptionOut>> _v2SubscriptionsSubscriptionIdPost(
      {required String? subscriptionId, required SubscriptionStatusIn? body}) {
    final $url = '/v2/subscriptions/${subscriptionId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SubscriptionOut, SubscriptionOut>($request);
  }

  @override
  Future<Response<SubscriptionOut>> _v2SubscriptionsSubscriptionIdPatch(
      {required String? subscriptionId, required SubscriptionUpdate? body}) {
    final $url = '/v2/subscriptions/${subscriptionId}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<SubscriptionOut, SubscriptionOut>($request);
  }

  @override
  Future<Response<List<ExtendedPayment>>>
      _v2SubscriptionsSubscriptionIdPaymentsGet(
          {required String? subscriptionId,
          String? paymentStatus,
          int? offset,
          int? limit}) {
    final $url = '/v2/subscriptions/${subscriptionId}/payments';
    final $params = <String, dynamic>{
      'payment_status': paymentStatus,
      'offset': offset,
      'limit': limit
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<ExtendedPayment>, ExtendedPayment>($request);
  }

  @override
  Future<Response<PaginatedOrderOut>> _v2SearchOrdersGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      String? dateCategory,
      String? orderId,
      String? externalId,
      String? orderStatus,
      String? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    final $url = '/v2/search/orders';
    final $params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'order_id': orderId,
      'external_id': externalId,
      'order_status': orderStatus,
      'amount_category': amountCategory,
      'fixed_amount': fixedAmount,
      'min_amount': minAmount,
      'max_amount': maxAmount
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedOrderOut, PaginatedOrderOut>($request);
  }

  @override
  Future<Response<PaginatedPaymentOut>> _v2SearchPaymentsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      String? dateCategory,
      String? orderId,
      String? externalId,
      String? panFirst6,
      String? panLast4,
      String? payerEmail,
      String? payerPhone,
      String? customerId,
      String? paymentStatus,
      String? paymentSystem,
      String? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    final $url = '/v2/search/payments';
    final $params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'order_id': orderId,
      'external_id': externalId,
      'pan_first6': panFirst6,
      'pan_last4': panLast4,
      'payer_email': payerEmail,
      'payer_phone': payerPhone,
      'customer_id': customerId,
      'payment_status': paymentStatus,
      'payment_system': paymentSystem,
      'amount_category': amountCategory,
      'fixed_amount': fixedAmount,
      'min_amount': minAmount,
      'max_amount': maxAmount
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedPaymentOut, PaginatedPaymentOut>($request);
  }

  @override
  Future<Response<PaginatedRefundOut>> _v2SearchRefundsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      String? dateCategory,
      String? orderId,
      String? refundStatus,
      String? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    final $url = '/v2/search/refunds';
    final $params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'order_id': orderId,
      'refund_status': refundStatus,
      'amount_category': amountCategory,
      'fixed_amount': fixedAmount,
      'min_amount': minAmount,
      'max_amount': maxAmount
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedRefundOut, PaginatedRefundOut>($request);
  }

  @override
  Future<Response<dynamic>> _v2ExportOrdersGet(
      {String? toDt,
      String? fromDt,
      String? dateCategory,
      String? orderStatus}) {
    final $url = '/v2/export/orders';
    final $params = <String, dynamic>{
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'order_status': orderStatus
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _v2ExportPaymentsGet(
      {String? toDt,
      String? fromDt,
      String? dateCategory,
      String? paymentStatus}) {
    final $url = '/v2/export/payments';
    final $params = <String, dynamic>{
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'payment_status': paymentStatus
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _v2ExportRefundsGet(
      {String? toDt,
      String? fromDt,
      String? dateCategory,
      String? refundStatus}) {
    final $url = '/v2/export/refunds';
    final $params = <String, dynamic>{
      'to_dt': toDt,
      'from_dt': fromDt,
      'date_category': dateCategory,
      'refund_status': refundStatus
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<BrandOut>> _v2BrandsGet({required String? partialBin}) {
    final $url = '/v2/brands';
    final $params = <String, dynamic>{'partial_bin': partialBin};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BrandOut, BrandOut>($request);
  }

  @override
  Future<Response<BinInfo>> _v2BinsBinCodeGet({required String? binCode}) {
    final $url = '/v2/bins/${binCode}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BinInfo, BinInfo>($request);
  }

  @override
  Future<Response<SessionOut>> _v2MasterpassSessionsPost(
      {required SessionIn? body}) {
    final $url = '/v2/masterpass/sessions';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SessionOut, SessionOut>($request);
  }

  @override
  Future<Response<List<SessionCard>>> _v2MasterpassSessionsSessionIdCardsGet(
      {required String? sessionId}) {
    final $url = '/v2/masterpass/sessions/${sessionId}/cards';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<SessionCard>, SessionCard>($request);
  }

  @override
  Future<Response<List<SessionCard>>> _v2MasterpassSessionsSessionIdCardsPost(
      {required String? sessionId, required MasterpassCardIn? body}) {
    final $url = '/v2/masterpass/sessions/${sessionId}/cards';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<SessionCard>, SessionCard>($request);
  }

  @override
  Future<Response<MasterpassCardOut>>
      _v2MasterpassSessionsSessionIdCardsTokenGet(
          {required String? sessionId, required String? token}) {
    final $url = '/v2/masterpass/sessions/${sessionId}/cards/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MasterpassCardOut, MasterpassCardOut>($request);
  }

  @override
  Future<Response<dynamic>> _v2MasterpassSessionsSessionIdCardsTokenDelete(
      {required String? sessionId, required String? token}) {
    final $url = '/v2/masterpass/sessions/${sessionId}/cards/${token}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<MasterpassPostbackOut>>>
      _v2MasterpassSessionsSessionIdCardsTokenPostbackPost(
          {required String? sessionId,
          required String? token,
          required MasterpassPostbackIn? body}) {
    final $url = '/v2/masterpass/sessions/${sessionId}/cards/${token}/postback';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<List<MasterpassPostbackOut>, MasterpassPostbackOut>($request);
  }

  @override
  Future<Response<ChangePhoneOut>> _v2MasterpassPhonesPatch(
      {required ChangePhoneIn? body}) {
    final $url = '/v2/masterpass/phones';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<ChangePhoneOut, ChangePhoneOut>($request);
  }

  @override
  Future<Response<dynamic>> _healthzGet() {
    final $url = '/healthz';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _webhookUrlPost(
      {String? xSignature, required WebhookEvent? body}) {
    final $url = '/webhook-url';
    final $headers = {
      if (xSignature != null) 'x-signature': xSignature,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
