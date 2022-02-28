import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

import 'package:chopper/chopper.dart';
import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'ioka_api.enums.swagger.dart' as enums;
export 'ioka_api.enums.swagger.dart';

part 'ioka_api.swagger.chopper.dart';
part 'ioka_api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class IokaApi extends ChopperService {
  static IokaApi create({ChopperClient? client, String? baseUrl}) {
    if (client != null) {
      return $IokaApi(client);
    }

    final newClient = ChopperClient(
        services: [$IokaApi()],
        converter: $JsonSerializableConverter(),
        baseUrl: baseUrl ?? 'http://');
    return $IokaApi(newClient);
  }

  ///CreatePaymentMethod
  Future<chopper.Response<PaymentMethodOut>> v2PaymentMethodsPost(
      {required PaymentMethodIn? body}) {
    generatedMapping.putIfAbsent(
        PaymentMethodOut, () => PaymentMethodOut.fromJsonFactory);

    return _v2PaymentMethodsPost(body: body);
  }

  ///CreatePaymentMethod
  @Post(path: '/v2/payment-methods')
  Future<chopper.Response<PaymentMethodOut>> _v2PaymentMethodsPost(
      {@Body() required PaymentMethodIn? body});

  ///StartApplePayPaymentSession
  ///@param order_id
  Future<chopper.Response<ApplePayOut>>
      v2PaymentMethodsOrderIdApplePaySessionPost(
          {required String? orderId, required ApplePayIn? body}) {
    generatedMapping.putIfAbsent(
        ApplePayOut, () => ApplePayOut.fromJsonFactory);

    return _v2PaymentMethodsOrderIdApplePaySessionPost(
        orderId: orderId, body: body);
  }

  ///StartApplePayPaymentSession
  ///@param order_id
  @Post(path: '/v2/payment-methods/{order_id}/apple-pay-session')
  Future<chopper.Response<ApplePayOut>>
      _v2PaymentMethodsOrderIdApplePaySessionPost(
          {@Path('order_id') required String? orderId,
          @Body() required ApplePayIn? body});

  ///CreateOrder
  Future<chopper.Response<OrderAndAccessToken>> v2OrdersPost(
      {required OrderIn? body}) {
    generatedMapping.putIfAbsent(
        OrderAndAccessToken, () => OrderAndAccessToken.fromJsonFactory);

    return _v2OrdersPost(body: body);
  }

  ///CreateOrder
  @Post(path: '/v2/orders')
  Future<chopper.Response<OrderAndAccessToken>> _v2OrdersPost(
      {@Body() required OrderIn? body});

  ///GetOrders
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param external_id
  ///@param order_status
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  Future<chopper.Response<List<OrderOut>>> v2OrdersGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      String? orderId,
      String? externalId,
      enums.OrderStatus? orderStatus,
      enums.AmountCategory? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    generatedMapping.putIfAbsent(OrderOut, () => OrderOut.fromJsonFactory);

    return _v2OrdersGet(
        page: page,
        limit: limit,
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        orderId: orderId,
        externalId: externalId,
        orderStatus: enums.$OrderStatusMap[orderStatus],
        amountCategory: enums.$AmountCategoryMap[amountCategory],
        fixedAmount: fixedAmount,
        minAmount: minAmount,
        maxAmount: maxAmount);
  }

  ///GetOrders
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param external_id
  ///@param order_status
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  @Get(path: '/v2/orders')
  Future<chopper.Response<List<OrderOut>>> _v2OrdersGet(
      {@Query('page') int? page,
      @Query('limit') int? limit,
      @Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('order_id') String? orderId,
      @Query('external_id') String? externalId,
      @Query('order_status') String? orderStatus,
      @Query('amount_category') String? amountCategory,
      @Query('fixed_amount') int? fixedAmount,
      @Query('min_amount') int? minAmount,
      @Query('max_amount') int? maxAmount});

  ///GetOrderByID
  ///@param order_id
  Future<chopper.Response<OrderOut>> v2OrdersOrderIdGet(
      {required String? orderId}) {
    generatedMapping.putIfAbsent(OrderOut, () => OrderOut.fromJsonFactory);

    return _v2OrdersOrderIdGet(orderId: orderId);
  }

  ///GetOrderByID
  ///@param order_id
  @Get(path: '/v2/orders/{order_id}')
  Future<chopper.Response<OrderOut>> _v2OrdersOrderIdGet(
      {@Path('order_id') required String? orderId});

  ///CaptureOrder
  ///@param order_id
  Future<chopper.Response<ExtendedPayment>> v2OrdersOrderIdCapturePost(
      {required String? orderId, required PaymentCapture? body}) {
    generatedMapping.putIfAbsent(
        ExtendedPayment, () => ExtendedPayment.fromJsonFactory);

    return _v2OrdersOrderIdCapturePost(orderId: orderId, body: body);
  }

  ///CaptureOrder
  ///@param order_id
  @Post(path: '/v2/orders/{order_id}/capture')
  Future<chopper.Response<ExtendedPayment>> _v2OrdersOrderIdCapturePost(
      {@Path('order_id') required String? orderId,
      @Body() required PaymentCapture? body});

  ///CancelOrder
  ///@param order_id
  Future<chopper.Response<ExtendedPayment>> v2OrdersOrderIdCancelPost(
      {required String? orderId, required PaymentCancel? body}) {
    generatedMapping.putIfAbsent(
        ExtendedPayment, () => ExtendedPayment.fromJsonFactory);

    return _v2OrdersOrderIdCancelPost(orderId: orderId, body: body);
  }

  ///CancelOrder
  ///@param order_id
  @Post(path: '/v2/orders/{order_id}/cancel')
  Future<chopper.Response<ExtendedPayment>> _v2OrdersOrderIdCancelPost(
      {@Path('order_id') required String? orderId,
      @Body() required PaymentCancel? body});

  ///GetOrderRefunds
  Future<chopper.Response<List<ExtendedRefund>>> v2OrdersOrderIdRefundsGet() {
    generatedMapping.putIfAbsent(
        ExtendedRefund, () => ExtendedRefund.fromJsonFactory);

    return _v2OrdersOrderIdRefundsGet();
  }

  ///GetOrderRefunds
  @Get(path: '/v2/orders/{order_id}/refunds')
  Future<chopper.Response<List<ExtendedRefund>>> _v2OrdersOrderIdRefundsGet();

  ///RefundOrder
  ///@param order_id
  Future<chopper.Response<ExtendedRefund>> v2OrdersOrderIdRefundsPost(
      {required String? orderId, required RefundIn? body}) {
    generatedMapping.putIfAbsent(
        ExtendedRefund, () => ExtendedRefund.fromJsonFactory);

    return _v2OrdersOrderIdRefundsPost(orderId: orderId, body: body);
  }

  ///RefundOrder
  ///@param order_id
  @Post(path: '/v2/orders/{order_id}/refunds')
  Future<chopper.Response<ExtendedRefund>> _v2OrdersOrderIdRefundsPost(
      {@Path('order_id') required String? orderId,
      @Body() required RefundIn? body});

  ///GetRefundByID
  Future<chopper.Response<ExtendedRefund>> v2OrdersOrderIdRefundsRefundIdGet() {
    generatedMapping.putIfAbsent(
        ExtendedRefund, () => ExtendedRefund.fromJsonFactory);

    return _v2OrdersOrderIdRefundsRefundIdGet();
  }

  ///GetRefundByID
  @Get(path: '/v2/orders/{order_id}/refunds/{refund_id}')
  Future<chopper.Response<ExtendedRefund>> _v2OrdersOrderIdRefundsRefundIdGet();

  ///GetOrderEvents
  ///@param order_id
  Future<chopper.Response<List<OrderEventOut>>> v2OrdersOrderIdEventsGet(
      {required String? orderId}) {
    generatedMapping.putIfAbsent(
        OrderEventOut, () => OrderEventOut.fromJsonFactory);

    return _v2OrdersOrderIdEventsGet(orderId: orderId);
  }

  ///GetOrderEvents
  ///@param order_id
  @Get(path: '/v2/orders/{order_id}/events')
  Future<chopper.Response<List<OrderEventOut>>> _v2OrdersOrderIdEventsGet(
      {@Path('order_id') required String? orderId});

  ///GetPayments
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param external_id
  ///@param payment_id
  ///@param pan_first6
  ///@param pan_last4
  ///@param payer_email
  ///@param payer_phone
  ///@param customer_id
  ///@param payment_status
  ///@param payment_system
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  Future<chopper.Response<List<PaymentOut>>> v2OrdersOrderIdPaymentsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      String? orderId,
      String? externalId,
      String? paymentId,
      String? panFirst6,
      String? panLast4,
      String? payerEmail,
      String? payerPhone,
      String? customerId,
      enums.PaymentStatus? paymentStatus,
      String? paymentSystem,
      enums.AmountCategory? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    generatedMapping.putIfAbsent(PaymentOut, () => PaymentOut.fromJsonFactory);

    return _v2OrdersOrderIdPaymentsGet(
        page: page,
        limit: limit,
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        orderId: orderId,
        externalId: externalId,
        paymentId: paymentId,
        panFirst6: panFirst6,
        panLast4: panLast4,
        payerEmail: payerEmail,
        payerPhone: payerPhone,
        customerId: customerId,
        paymentStatus: enums.$PaymentStatusMap[paymentStatus],
        paymentSystem: paymentSystem,
        amountCategory: enums.$AmountCategoryMap[amountCategory],
        fixedAmount: fixedAmount,
        minAmount: minAmount,
        maxAmount: maxAmount);
  }

  ///GetPayments
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param external_id
  ///@param payment_id
  ///@param pan_first6
  ///@param pan_last4
  ///@param payer_email
  ///@param payer_phone
  ///@param customer_id
  ///@param payment_status
  ///@param payment_system
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  @Get(path: '/v2/orders/{order_id}/payments')
  Future<chopper.Response<List<PaymentOut>>> _v2OrdersOrderIdPaymentsGet(
      {@Query('page') int? page,
      @Query('limit') int? limit,
      @Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('order_id') String? orderId,
      @Query('external_id') String? externalId,
      @Query('payment_id') String? paymentId,
      @Query('pan_first6') String? panFirst6,
      @Query('pan_last4') String? panLast4,
      @Query('payer_email') String? payerEmail,
      @Query('payer_phone') String? payerPhone,
      @Query('customer_id') String? customerId,
      @Query('payment_status') String? paymentStatus,
      @Query('payment_system') String? paymentSystem,
      @Query('amount_category') String? amountCategory,
      @Query('fixed_amount') int? fixedAmount,
      @Query('min_amount') int? minAmount,
      @Query('max_amount') int? maxAmount});

  ///CreatePayment
  ///@param order_id
  Future<chopper.Response<ExtendedPayment>> v2OrdersOrderIdPaymentsPost(
      {required String? orderId, required PaymentIn? body}) {
    generatedMapping.putIfAbsent(
        ExtendedPayment, () => ExtendedPayment.fromJsonFactory);

    return _v2OrdersOrderIdPaymentsPost(orderId: orderId, body: body);
  }

  ///CreatePayment
  ///@param order_id
  @Post(path: '/v2/orders/{order_id}/payments')
  Future<chopper.Response<ExtendedPayment>> _v2OrdersOrderIdPaymentsPost(
      {@Path('order_id') required String? orderId,
      @Body() required PaymentIn? body});

  ///CreateCardPayment
  ///@param order_id Идентификатор заказа
  Future<chopper.Response<ExtendedPayment>> v2OrdersOrderIdPaymentsCardPost(
      {required String? orderId, required CardPayer? body}) {
    generatedMapping.putIfAbsent(
        ExtendedPayment, () => ExtendedPayment.fromJsonFactory);

    return _v2OrdersOrderIdPaymentsCardPost(orderId: orderId, body: body);
  }

  ///CreateCardPayment
  ///@param order_id Идентификатор заказа
  @Post(path: '/v2/orders/{order_id}/payments/card')
  Future<chopper.Response<ExtendedPayment>> _v2OrdersOrderIdPaymentsCardPost(
      {@Path('order_id') required String? orderId,
      @Body() required CardPayer? body});

  ///GetPaymentByID
  ///@param order_id
  ///@param payment_id
  Future<chopper.Response<ExtendedPayment>> v2OrdersOrderIdPaymentsPaymentIdGet(
      {required String? orderId, required String? paymentId}) {
    generatedMapping.putIfAbsent(
        ExtendedPayment, () => ExtendedPayment.fromJsonFactory);

    return _v2OrdersOrderIdPaymentsPaymentIdGet(
        orderId: orderId, paymentId: paymentId);
  }

  ///GetPaymentByID
  ///@param order_id
  ///@param payment_id
  @Get(path: '/v2/orders/{order_id}/payments/{payment_id}')
  Future<chopper.Response<ExtendedPayment>>
      _v2OrdersOrderIdPaymentsPaymentIdGet(
          {@Path('order_id') required String? orderId,
          @Path('payment_id') required String? paymentId});

  ///CapturePayment
  ///@param order_id
  ///@param payment_id
  Future<chopper.Response<ExtendedPayment>>
      v2OrdersOrderIdPaymentsPaymentIdCapturePost(
          {required String? orderId,
          required String? paymentId,
          required PaymentCapture? body}) {
    generatedMapping.putIfAbsent(
        ExtendedPayment, () => ExtendedPayment.fromJsonFactory);

    return _v2OrdersOrderIdPaymentsPaymentIdCapturePost(
        orderId: orderId, paymentId: paymentId, body: body);
  }

  ///CapturePayment
  ///@param order_id
  ///@param payment_id
  @Post(path: '/v2/orders/{order_id}/payments/{payment_id}/capture')
  Future<chopper.Response<ExtendedPayment>>
      _v2OrdersOrderIdPaymentsPaymentIdCapturePost(
          {@Path('order_id') required String? orderId,
          @Path('payment_id') required String? paymentId,
          @Body() required PaymentCapture? body});

  ///CancelPayment
  ///@param order_id
  ///@param payment_id
  Future<chopper.Response<ExtendedPayment>>
      v2OrdersOrderIdPaymentsPaymentIdCancelPost(
          {required String? orderId,
          required String? paymentId,
          required PaymentCancel? body}) {
    generatedMapping.putIfAbsent(
        ExtendedPayment, () => ExtendedPayment.fromJsonFactory);

    return _v2OrdersOrderIdPaymentsPaymentIdCancelPost(
        orderId: orderId, paymentId: paymentId, body: body);
  }

  ///CancelPayment
  ///@param order_id
  ///@param payment_id
  @Post(path: '/v2/orders/{order_id}/payments/{payment_id}/cancel')
  Future<chopper.Response<ExtendedPayment>>
      _v2OrdersOrderIdPaymentsPaymentIdCancelPost(
          {@Path('order_id') required String? orderId,
          @Path('payment_id') required String? paymentId,
          @Body() required PaymentCancel? body});

  ///GetRefunds
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param payment_id
  ///@param refund_status
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  Future<chopper.Response<List<RefundOut>>>
      v2OrdersOrderIdPaymentsPaymentIdRefundsGet(
          {int? page,
          int? limit,
          String? toDt,
          String? fromDt,
          enums.DateCategory? dateCategory,
          String? orderId,
          String? paymentId,
          enums.RefundStatus? refundStatus,
          enums.AmountCategory? amountCategory,
          int? fixedAmount,
          int? minAmount,
          int? maxAmount}) {
    generatedMapping.putIfAbsent(RefundOut, () => RefundOut.fromJsonFactory);

    return _v2OrdersOrderIdPaymentsPaymentIdRefundsGet(
        page: page,
        limit: limit,
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        orderId: orderId,
        paymentId: paymentId,
        refundStatus: enums.$RefundStatusMap[refundStatus],
        amountCategory: enums.$AmountCategoryMap[amountCategory],
        fixedAmount: fixedAmount,
        minAmount: minAmount,
        maxAmount: maxAmount);
  }

  ///GetRefunds
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param payment_id
  ///@param refund_status
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  @Get(path: '/v2/orders/{order_id}/payments/{payment_id}/refunds')
  Future<chopper.Response<List<RefundOut>>>
      _v2OrdersOrderIdPaymentsPaymentIdRefundsGet(
          {@Query('page') int? page,
          @Query('limit') int? limit,
          @Query('to_dt') String? toDt,
          @Query('from_dt') String? fromDt,
          @Query('date_category') String? dateCategory,
          @Query('order_id') String? orderId,
          @Query('payment_id') String? paymentId,
          @Query('refund_status') String? refundStatus,
          @Query('amount_category') String? amountCategory,
          @Query('fixed_amount') int? fixedAmount,
          @Query('min_amount') int? minAmount,
          @Query('max_amount') int? maxAmount});

  ///CreateRefund
  ///@param order_id
  ///@param payment_id
  Future<chopper.Response<ExtendedRefund>>
      v2OrdersOrderIdPaymentsPaymentIdRefundsPost(
          {required String? orderId,
          required String? paymentId,
          required RefundIn? body}) {
    generatedMapping.putIfAbsent(
        ExtendedRefund, () => ExtendedRefund.fromJsonFactory);

    return _v2OrdersOrderIdPaymentsPaymentIdRefundsPost(
        orderId: orderId, paymentId: paymentId, body: body);
  }

  ///CreateRefund
  ///@param order_id
  ///@param payment_id
  @Post(path: '/v2/orders/{order_id}/payments/{payment_id}/refunds')
  Future<chopper.Response<ExtendedRefund>>
      _v2OrdersOrderIdPaymentsPaymentIdRefundsPost(
          {@Path('order_id') required String? orderId,
          @Path('payment_id') required String? paymentId,
          @Body() required RefundIn? body});

  ///GetWebhooks
  Future<chopper.Response<List<WebhookOut>>> v2WebhooksGet() {
    generatedMapping.putIfAbsent(WebhookOut, () => WebhookOut.fromJsonFactory);

    return _v2WebhooksGet();
  }

  ///GetWebhooks
  @Get(path: '/v2/webhooks')
  Future<chopper.Response<List<WebhookOut>>> _v2WebhooksGet();

  ///CreateWebhook
  Future<chopper.Response<WebhookOut>> v2WebhooksPost(
      {required WebhookIn? body}) {
    generatedMapping.putIfAbsent(WebhookOut, () => WebhookOut.fromJsonFactory);

    return _v2WebhooksPost(body: body);
  }

  ///CreateWebhook
  @Post(path: '/v2/webhooks')
  Future<chopper.Response<WebhookOut>> _v2WebhooksPost(
      {@Body() required WebhookIn? body});

  ///GetWebhookByID
  ///@param webhook_id
  Future<chopper.Response<WebhookOut>> v2WebhooksWebhookIdGet(
      {required String? webhookId}) {
    generatedMapping.putIfAbsent(WebhookOut, () => WebhookOut.fromJsonFactory);

    return _v2WebhooksWebhookIdGet(webhookId: webhookId);
  }

  ///GetWebhookByID
  ///@param webhook_id
  @Get(path: '/v2/webhooks/{webhook_id}')
  Future<chopper.Response<WebhookOut>> _v2WebhooksWebhookIdGet(
      {@Path('webhook_id') required String? webhookId});

  ///DeleteWebhookByID
  ///@param webhook_id
  Future<chopper.Response> v2WebhooksWebhookIdDelete(
      {required String? webhookId}) {
    return _v2WebhooksWebhookIdDelete(webhookId: webhookId);
  }

  ///DeleteWebhookByID
  ///@param webhook_id
  @Delete(path: '/v2/webhooks/{webhook_id}')
  Future<chopper.Response> _v2WebhooksWebhookIdDelete(
      {@Path('webhook_id') required String? webhookId});

  ///UpdateWebhookByID
  ///@param webhook_id
  Future<chopper.Response<WebhookOut>> v2WebhooksWebhookIdPatch(
      {required String? webhookId, required WebhookPatch? body}) {
    generatedMapping.putIfAbsent(WebhookOut, () => WebhookOut.fromJsonFactory);

    return _v2WebhooksWebhookIdPatch(webhookId: webhookId, body: body);
  }

  ///UpdateWebhookByID
  ///@param webhook_id
  @Patch(path: '/v2/webhooks/{webhook_id}')
  Future<chopper.Response<WebhookOut>> _v2WebhooksWebhookIdPatch(
      {@Path('webhook_id') required String? webhookId,
      @Body() required WebhookPatch? body});

  ///GetCustomers
  ///@param limit
  ///@param page
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param customer_id
  ///@param external_id
  ///@param status
  Future<chopper.Response<List<ExtendedCustomer>>> v2CustomersGet(
      {int? limit,
      int? page,
      String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      String? customerId,
      String? externalId,
      enums.CustomerStatus? status}) {
    generatedMapping.putIfAbsent(
        ExtendedCustomer, () => ExtendedCustomer.fromJsonFactory);

    return _v2CustomersGet(
        limit: limit,
        page: page,
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        customerId: customerId,
        externalId: externalId,
        status: enums.$CustomerStatusMap[status]);
  }

  ///GetCustomers
  ///@param limit
  ///@param page
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param customer_id
  ///@param external_id
  ///@param status
  @Get(path: '/v2/customers')
  Future<chopper.Response<List<ExtendedCustomer>>> _v2CustomersGet(
      {@Query('limit') int? limit,
      @Query('page') int? page,
      @Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('customer_id') String? customerId,
      @Query('external_id') String? externalId,
      @Query('status') String? status});

  ///CreateCustomer
  Future<chopper.Response<CustomerAndAccessToken>> v2CustomersPost(
      {required CustomerIn? body}) {
    generatedMapping.putIfAbsent(
        CustomerAndAccessToken, () => CustomerAndAccessToken.fromJsonFactory);

    return _v2CustomersPost(body: body);
  }

  ///CreateCustomer
  @Post(path: '/v2/customers')
  Future<chopper.Response<CustomerAndAccessToken>> _v2CustomersPost(
      {@Body() required CustomerIn? body});

  ///GetCustomerByID
  ///@param customer_id
  Future<chopper.Response<ExtendedCustomer>> v2CustomersCustomerIdGet(
      {required String? customerId}) {
    generatedMapping.putIfAbsent(
        ExtendedCustomer, () => ExtendedCustomer.fromJsonFactory);

    return _v2CustomersCustomerIdGet(customerId: customerId);
  }

  ///GetCustomerByID
  ///@param customer_id
  @Get(path: '/v2/customers/{customer_id}')
  Future<chopper.Response<ExtendedCustomer>> _v2CustomersCustomerIdGet(
      {@Path('customer_id') required String? customerId});

  ///DeleteCustomerByID
  ///@param customer_id
  Future<chopper.Response> v2CustomersCustomerIdDelete(
      {required String? customerId}) {
    return _v2CustomersCustomerIdDelete(customerId: customerId);
  }

  ///DeleteCustomerByID
  ///@param customer_id
  @Delete(path: '/v2/customers/{customer_id}')
  Future<chopper.Response> _v2CustomersCustomerIdDelete(
      {@Path('customer_id') required String? customerId});

  ///GetCustomerEvents
  ///@param customer_id
  Future<chopper.Response<List<CustomerEventOut>>>
      v2CustomersCustomerIdEventsGet({required String? customerId}) {
    generatedMapping.putIfAbsent(
        CustomerEventOut, () => CustomerEventOut.fromJsonFactory);

    return _v2CustomersCustomerIdEventsGet(customerId: customerId);
  }

  ///GetCustomerEvents
  ///@param customer_id
  @Get(path: '/v2/customers/{customer_id}/events')
  Future<chopper.Response<List<CustomerEventOut>>>
      _v2CustomersCustomerIdEventsGet(
          {@Path('customer_id') required String? customerId});

  ///CreateBinding
  ///@param customer_id
  Future<chopper.Response<ExtendedCard>> v2CustomersCustomerIdBindingsPost(
      {required String? customerId, required BindingCard? body}) {
    generatedMapping.putIfAbsent(
        ExtendedCard, () => ExtendedCard.fromJsonFactory);

    return _v2CustomersCustomerIdBindingsPost(
        customerId: customerId, body: body);
  }

  ///CreateBinding
  ///@param customer_id
  @Post(path: '/v2/customers/{customer_id}/bindings')
  Future<chopper.Response<ExtendedCard>> _v2CustomersCustomerIdBindingsPost(
      {@Path('customer_id') required String? customerId,
      @Body() required BindingCard? body});

  ///GetCards
  ///@param customer_id
  Future<chopper.Response<List<ExtendedCard>>> v2CustomersCustomerIdCardsGet(
      {required String? customerId}) {
    generatedMapping.putIfAbsent(
        ExtendedCard, () => ExtendedCard.fromJsonFactory);

    return _v2CustomersCustomerIdCardsGet(customerId: customerId);
  }

  ///GetCards
  ///@param customer_id
  @Get(path: '/v2/customers/{customer_id}/cards')
  Future<chopper.Response<List<ExtendedCard>>> _v2CustomersCustomerIdCardsGet(
      {@Path('customer_id') required String? customerId});

  ///CreateCard
  ///@param customer_id
  Future<chopper.Response<ExtendedCard>> v2CustomersCustomerIdCardsPost(
      {required String? customerId, required CardIn? body}) {
    generatedMapping.putIfAbsent(
        ExtendedCard, () => ExtendedCard.fromJsonFactory);

    return _v2CustomersCustomerIdCardsPost(customerId: customerId, body: body);
  }

  ///CreateCard
  ///@param customer_id
  @Post(path: '/v2/customers/{customer_id}/cards')
  Future<chopper.Response<ExtendedCard>> _v2CustomersCustomerIdCardsPost(
      {@Path('customer_id') required String? customerId,
      @Body() required CardIn? body});

  ///GetCardByID
  ///@param customer_id
  ///@param card_id
  Future<chopper.Response<ExtendedCard>> v2CustomersCustomerIdCardsCardIdGet(
      {required String? customerId, required String? cardId}) {
    generatedMapping.putIfAbsent(
        ExtendedCard, () => ExtendedCard.fromJsonFactory);

    return _v2CustomersCustomerIdCardsCardIdGet(
        customerId: customerId, cardId: cardId);
  }

  ///GetCardByID
  ///@param customer_id
  ///@param card_id
  @Get(path: '/v2/customers/{customer_id}/cards/{card_id}')
  Future<chopper.Response<ExtendedCard>> _v2CustomersCustomerIdCardsCardIdGet(
      {@Path('customer_id') required String? customerId,
      @Path('card_id') required String? cardId});

  ///DeleteCardByID
  ///@param customer_id
  ///@param card_id
  Future<chopper.Response> v2CustomersCustomerIdCardsCardIdDelete(
      {required String? customerId, required String? cardId}) {
    return _v2CustomersCustomerIdCardsCardIdDelete(
        customerId: customerId, cardId: cardId);
  }

  ///DeleteCardByID
  ///@param customer_id
  ///@param card_id
  @Delete(path: '/v2/customers/{customer_id}/cards/{card_id}')
  Future<chopper.Response> _v2CustomersCustomerIdCardsCardIdDelete(
      {@Path('customer_id') required String? customerId,
      @Path('card_id') required String? cardId});

  ///GetSubscriptions
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param subscription_id
  ///@param pan_first6
  ///@param pan_last4
  ///@param status
  ///@param next_pay
  ///@param step
  ///@param unit
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  Future<chopper.Response<List<SubscriptionOut>>> v2SubscriptionsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      String? subscriptionId,
      String? panFirst6,
      String? panLast4,
      enums.ScheduleStatusEnum? status,
      String? nextPay,
      int? step,
      enums.ScheduleUnitEnum? unit,
      enums.AmountCategory? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    generatedMapping.putIfAbsent(
        SubscriptionOut, () => SubscriptionOut.fromJsonFactory);

    return _v2SubscriptionsGet(
        page: page,
        limit: limit,
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        subscriptionId: subscriptionId,
        panFirst6: panFirst6,
        panLast4: panLast4,
        status: enums.$ScheduleStatusEnumMap[status],
        nextPay: nextPay,
        step: step,
        unit: enums.$ScheduleUnitEnumMap[unit],
        amountCategory: enums.$AmountCategoryMap[amountCategory],
        fixedAmount: fixedAmount,
        minAmount: minAmount,
        maxAmount: maxAmount);
  }

  ///GetSubscriptions
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param subscription_id
  ///@param pan_first6
  ///@param pan_last4
  ///@param status
  ///@param next_pay
  ///@param step
  ///@param unit
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  @Get(path: '/v2/subscriptions')
  Future<chopper.Response<List<SubscriptionOut>>> _v2SubscriptionsGet(
      {@Query('page') int? page,
      @Query('limit') int? limit,
      @Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('subscription_id') String? subscriptionId,
      @Query('pan_first6') String? panFirst6,
      @Query('pan_last4') String? panLast4,
      @Query('status') String? status,
      @Query('next_pay') String? nextPay,
      @Query('step') int? step,
      @Query('unit') String? unit,
      @Query('amount_category') String? amountCategory,
      @Query('fixed_amount') int? fixedAmount,
      @Query('min_amount') int? minAmount,
      @Query('max_amount') int? maxAmount});

  ///CreateSubscription
  Future<chopper.Response<SubscriptionOut>> v2SubscriptionsPost(
      {required SubscriptionIn? body}) {
    generatedMapping.putIfAbsent(
        SubscriptionOut, () => SubscriptionOut.fromJsonFactory);

    return _v2SubscriptionsPost(body: body);
  }

  ///CreateSubscription
  @Post(path: '/v2/subscriptions')
  Future<chopper.Response<SubscriptionOut>> _v2SubscriptionsPost(
      {@Body() required SubscriptionIn? body});

  ///GetSubscriptionByID
  ///@param subscription_id
  Future<chopper.Response<SubscriptionOut>> v2SubscriptionsSubscriptionIdGet(
      {required String? subscriptionId}) {
    generatedMapping.putIfAbsent(
        SubscriptionOut, () => SubscriptionOut.fromJsonFactory);

    return _v2SubscriptionsSubscriptionIdGet(subscriptionId: subscriptionId);
  }

  ///GetSubscriptionByID
  ///@param subscription_id
  @Get(path: '/v2/subscriptions/{subscription_id}')
  Future<chopper.Response<SubscriptionOut>> _v2SubscriptionsSubscriptionIdGet(
      {@Path('subscription_id') required String? subscriptionId});

  ///ChangeSubscriptionStatus
  ///@param subscription_id
  Future<chopper.Response<SubscriptionOut>> v2SubscriptionsSubscriptionIdPost(
      {required String? subscriptionId, required SubscriptionStatusIn? body}) {
    generatedMapping.putIfAbsent(
        SubscriptionOut, () => SubscriptionOut.fromJsonFactory);

    return _v2SubscriptionsSubscriptionIdPost(
        subscriptionId: subscriptionId, body: body);
  }

  ///ChangeSubscriptionStatus
  ///@param subscription_id
  @Post(path: '/v2/subscriptions/{subscription_id}')
  Future<chopper.Response<SubscriptionOut>> _v2SubscriptionsSubscriptionIdPost(
      {@Path('subscription_id') required String? subscriptionId,
      @Body() required SubscriptionStatusIn? body});

  ///UpdateSubscription
  ///@param subscription_id
  Future<chopper.Response<SubscriptionOut>> v2SubscriptionsSubscriptionIdPatch(
      {required String? subscriptionId, required SubscriptionUpdate? body}) {
    generatedMapping.putIfAbsent(
        SubscriptionOut, () => SubscriptionOut.fromJsonFactory);

    return _v2SubscriptionsSubscriptionIdPatch(
        subscriptionId: subscriptionId, body: body);
  }

  ///UpdateSubscription
  ///@param subscription_id
  @Patch(path: '/v2/subscriptions/{subscription_id}')
  Future<chopper.Response<SubscriptionOut>> _v2SubscriptionsSubscriptionIdPatch(
      {@Path('subscription_id') required String? subscriptionId,
      @Body() required SubscriptionUpdate? body});

  ///GetSubscriptionPayments
  ///@param subscription_id
  ///@param payment_status
  ///@param offset
  ///@param limit
  Future<chopper.Response<List<ExtendedPayment>>>
      v2SubscriptionsSubscriptionIdPaymentsGet(
          {required String? subscriptionId,
          enums.PaymentStatus? paymentStatus,
          int? offset,
          int? limit}) {
    generatedMapping.putIfAbsent(
        ExtendedPayment, () => ExtendedPayment.fromJsonFactory);

    return _v2SubscriptionsSubscriptionIdPaymentsGet(
        subscriptionId: subscriptionId,
        paymentStatus: enums.$PaymentStatusMap[paymentStatus],
        offset: offset,
        limit: limit);
  }

  ///GetSubscriptionPayments
  ///@param subscription_id
  ///@param payment_status
  ///@param offset
  ///@param limit
  @Get(path: '/v2/subscriptions/{subscription_id}/payments')
  Future<chopper.Response<List<ExtendedPayment>>>
      _v2SubscriptionsSubscriptionIdPaymentsGet(
          {@Path('subscription_id') required String? subscriptionId,
          @Query('payment_status') String? paymentStatus,
          @Query('offset') int? offset,
          @Query('limit') int? limit});

  ///SearchOrders
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param external_id
  ///@param order_status
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  Future<chopper.Response<PaginatedOrderOut>> v2SearchOrdersGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      String? orderId,
      String? externalId,
      enums.OrderStatus? orderStatus,
      enums.AmountCategory? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    generatedMapping.putIfAbsent(
        PaginatedOrderOut, () => PaginatedOrderOut.fromJsonFactory);

    return _v2SearchOrdersGet(
        page: page,
        limit: limit,
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        orderId: orderId,
        externalId: externalId,
        orderStatus: enums.$OrderStatusMap[orderStatus],
        amountCategory: enums.$AmountCategoryMap[amountCategory],
        fixedAmount: fixedAmount,
        minAmount: minAmount,
        maxAmount: maxAmount);
  }

  ///SearchOrders
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param external_id
  ///@param order_status
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  @Get(path: '/v2/search/orders')
  Future<chopper.Response<PaginatedOrderOut>> _v2SearchOrdersGet(
      {@Query('page') int? page,
      @Query('limit') int? limit,
      @Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('order_id') String? orderId,
      @Query('external_id') String? externalId,
      @Query('order_status') String? orderStatus,
      @Query('amount_category') String? amountCategory,
      @Query('fixed_amount') int? fixedAmount,
      @Query('min_amount') int? minAmount,
      @Query('max_amount') int? maxAmount});

  ///SearchPayments
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param external_id
  ///@param pan_first6
  ///@param pan_last4
  ///@param payer_email
  ///@param payer_phone
  ///@param customer_id
  ///@param payment_status
  ///@param payment_system
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  Future<chopper.Response<PaginatedPaymentOut>> v2SearchPaymentsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      String? orderId,
      String? externalId,
      String? panFirst6,
      String? panLast4,
      String? payerEmail,
      String? payerPhone,
      String? customerId,
      enums.PaymentStatus? paymentStatus,
      String? paymentSystem,
      enums.AmountCategory? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    generatedMapping.putIfAbsent(
        PaginatedPaymentOut, () => PaginatedPaymentOut.fromJsonFactory);

    return _v2SearchPaymentsGet(
        page: page,
        limit: limit,
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        orderId: orderId,
        externalId: externalId,
        panFirst6: panFirst6,
        panLast4: panLast4,
        payerEmail: payerEmail,
        payerPhone: payerPhone,
        customerId: customerId,
        paymentStatus: enums.$PaymentStatusMap[paymentStatus],
        paymentSystem: paymentSystem,
        amountCategory: enums.$AmountCategoryMap[amountCategory],
        fixedAmount: fixedAmount,
        minAmount: minAmount,
        maxAmount: maxAmount);
  }

  ///SearchPayments
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param external_id
  ///@param pan_first6
  ///@param pan_last4
  ///@param payer_email
  ///@param payer_phone
  ///@param customer_id
  ///@param payment_status
  ///@param payment_system
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  @Get(path: '/v2/search/payments')
  Future<chopper.Response<PaginatedPaymentOut>> _v2SearchPaymentsGet(
      {@Query('page') int? page,
      @Query('limit') int? limit,
      @Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('order_id') String? orderId,
      @Query('external_id') String? externalId,
      @Query('pan_first6') String? panFirst6,
      @Query('pan_last4') String? panLast4,
      @Query('payer_email') String? payerEmail,
      @Query('payer_phone') String? payerPhone,
      @Query('customer_id') String? customerId,
      @Query('payment_status') String? paymentStatus,
      @Query('payment_system') String? paymentSystem,
      @Query('amount_category') String? amountCategory,
      @Query('fixed_amount') int? fixedAmount,
      @Query('min_amount') int? minAmount,
      @Query('max_amount') int? maxAmount});

  ///SearchRefunds
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param refund_status
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  Future<chopper.Response<PaginatedRefundOut>> v2SearchRefundsGet(
      {int? page,
      int? limit,
      String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      String? orderId,
      enums.RefundStatus? refundStatus,
      enums.AmountCategory? amountCategory,
      int? fixedAmount,
      int? minAmount,
      int? maxAmount}) {
    generatedMapping.putIfAbsent(
        PaginatedRefundOut, () => PaginatedRefundOut.fromJsonFactory);

    return _v2SearchRefundsGet(
        page: page,
        limit: limit,
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        orderId: orderId,
        refundStatus: enums.$RefundStatusMap[refundStatus],
        amountCategory: enums.$AmountCategoryMap[amountCategory],
        fixedAmount: fixedAmount,
        minAmount: minAmount,
        maxAmount: maxAmount);
  }

  ///SearchRefunds
  ///@param page
  ///@param limit
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_id
  ///@param refund_status
  ///@param amount_category
  ///@param fixed_amount
  ///@param min_amount
  ///@param max_amount
  @Get(path: '/v2/search/refunds')
  Future<chopper.Response<PaginatedRefundOut>> _v2SearchRefundsGet(
      {@Query('page') int? page,
      @Query('limit') int? limit,
      @Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('order_id') String? orderId,
      @Query('refund_status') String? refundStatus,
      @Query('amount_category') String? amountCategory,
      @Query('fixed_amount') int? fixedAmount,
      @Query('min_amount') int? minAmount,
      @Query('max_amount') int? maxAmount});

  ///ExportOrders
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_status
  Future<chopper.Response> v2ExportOrdersGet(
      {String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      enums.OrderStatus? orderStatus}) {
    return _v2ExportOrdersGet(
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        orderStatus: enums.$OrderStatusMap[orderStatus]);
  }

  ///ExportOrders
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param order_status
  @Get(path: '/v2/export/orders')
  Future<chopper.Response> _v2ExportOrdersGet(
      {@Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('order_status') String? orderStatus});

  ///ExportPayments
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param payment_status
  Future<chopper.Response> v2ExportPaymentsGet(
      {String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      enums.PaymentStatus? paymentStatus}) {
    return _v2ExportPaymentsGet(
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        paymentStatus: enums.$PaymentStatusMap[paymentStatus]);
  }

  ///ExportPayments
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param payment_status
  @Get(path: '/v2/export/payments')
  Future<chopper.Response> _v2ExportPaymentsGet(
      {@Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('payment_status') String? paymentStatus});

  ///ExportRefunds
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param refund_status
  Future<chopper.Response> v2ExportRefundsGet(
      {String? toDt,
      String? fromDt,
      enums.DateCategory? dateCategory,
      enums.RefundStatus? refundStatus}) {
    return _v2ExportRefundsGet(
        toDt: toDt,
        fromDt: fromDt,
        dateCategory: enums.$DateCategoryMap[dateCategory],
        refundStatus: enums.$RefundStatusMap[refundStatus]);
  }

  ///ExportRefunds
  ///@param to_dt
  ///@param from_dt
  ///@param date_category
  ///@param refund_status
  @Get(path: '/v2/export/refunds')
  Future<chopper.Response> _v2ExportRefundsGet(
      {@Query('to_dt') String? toDt,
      @Query('from_dt') String? fromDt,
      @Query('date_category') String? dateCategory,
      @Query('refund_status') String? refundStatus});

  ///GetBrand
  ///@param partial_bin
  Future<chopper.Response<BrandOut>> v2BrandsGet(
      {required String? partialBin}) {
    generatedMapping.putIfAbsent(BrandOut, () => BrandOut.fromJsonFactory);

    return _v2BrandsGet(partialBin: partialBin);
  }

  ///GetBrand
  ///@param partial_bin
  @Get(path: '/v2/brands')
  Future<chopper.Response<BrandOut>> _v2BrandsGet(
      {@Query('partial_bin') required String? partialBin});

  ///GetEmitterByBinCode
  ///@param bin_code
  Future<chopper.Response<BinInfo>> v2BinsBinCodeGet(
      {required String? binCode}) {
    generatedMapping.putIfAbsent(BinInfo, () => BinInfo.fromJsonFactory);

    return _v2BinsBinCodeGet(binCode: binCode);
  }

  ///GetEmitterByBinCode
  ///@param bin_code
  @Get(path: '/v2/bins/{bin_code}')
  Future<chopper.Response<BinInfo>> _v2BinsBinCodeGet(
      {@Path('bin_code') required String? binCode});

  ///CreateMasterpassSession
  Future<chopper.Response<SessionOut>> v2MasterpassSessionsPost(
      {required SessionIn? body}) {
    generatedMapping.putIfAbsent(SessionOut, () => SessionOut.fromJsonFactory);

    return _v2MasterpassSessionsPost(body: body);
  }

  ///CreateMasterpassSession
  @Post(path: '/v2/masterpass/sessions')
  Future<chopper.Response<SessionOut>> _v2MasterpassSessionsPost(
      {@Body() required SessionIn? body});

  ///GetMasterpassCards
  ///@param session_id
  Future<chopper.Response<List<SessionCard>>>
      v2MasterpassSessionsSessionIdCardsGet({required String? sessionId}) {
    generatedMapping.putIfAbsent(
        SessionCard, () => SessionCard.fromJsonFactory);

    return _v2MasterpassSessionsSessionIdCardsGet(sessionId: sessionId);
  }

  ///GetMasterpassCards
  ///@param session_id
  @Get(path: '/v2/masterpass/sessions/{session_id}/cards')
  Future<chopper.Response<List<SessionCard>>>
      _v2MasterpassSessionsSessionIdCardsGet(
          {@Path('session_id') required String? sessionId});

  ///CreateMasterpassCard
  ///@param session_id
  Future<chopper.Response<List<SessionCard>>>
      v2MasterpassSessionsSessionIdCardsPost(
          {required String? sessionId, required MasterpassCardIn? body}) {
    generatedMapping.putIfAbsent(
        SessionCard, () => SessionCard.fromJsonFactory);

    return _v2MasterpassSessionsSessionIdCardsPost(
        sessionId: sessionId, body: body);
  }

  ///CreateMasterpassCard
  ///@param session_id
  @Post(path: '/v2/masterpass/sessions/{session_id}/cards')
  Future<chopper.Response<List<SessionCard>>>
      _v2MasterpassSessionsSessionIdCardsPost(
          {@Path('session_id') required String? sessionId,
          @Body() required MasterpassCardIn? body});

  ///GetMasterpassCard
  ///@param session_id
  ///@param token
  Future<chopper.Response<MasterpassCardOut>>
      v2MasterpassSessionsSessionIdCardsTokenGet(
          {required String? sessionId, required String? token}) {
    generatedMapping.putIfAbsent(
        MasterpassCardOut, () => MasterpassCardOut.fromJsonFactory);

    return _v2MasterpassSessionsSessionIdCardsTokenGet(
        sessionId: sessionId, token: token);
  }

  ///GetMasterpassCard
  ///@param session_id
  ///@param token
  @Get(path: '/v2/masterpass/sessions/{session_id}/cards/{token}')
  Future<chopper.Response<MasterpassCardOut>>
      _v2MasterpassSessionsSessionIdCardsTokenGet(
          {@Path('session_id') required String? sessionId,
          @Path('token') required String? token});

  ///DeleteMasterpassCardByToken
  ///@param session_id
  ///@param token
  Future<chopper.Response> v2MasterpassSessionsSessionIdCardsTokenDelete(
      {required String? sessionId, required String? token}) {
    return _v2MasterpassSessionsSessionIdCardsTokenDelete(
        sessionId: sessionId, token: token);
  }

  ///DeleteMasterpassCardByToken
  ///@param session_id
  ///@param token
  @Delete(path: '/v2/masterpass/sessions/{session_id}/cards/{token}')
  Future<chopper.Response> _v2MasterpassSessionsSessionIdCardsTokenDelete(
      {@Path('session_id') required String? sessionId,
      @Path('token') required String? token});

  ///PostbackMasterpassCardByToken
  ///@param session_id
  ///@param token
  Future<chopper.Response<List<MasterpassPostbackOut>>>
      v2MasterpassSessionsSessionIdCardsTokenPostbackPost(
          {required String? sessionId,
          required String? token,
          required MasterpassPostbackIn? body}) {
    generatedMapping.putIfAbsent(
        MasterpassPostbackOut, () => MasterpassPostbackOut.fromJsonFactory);

    return _v2MasterpassSessionsSessionIdCardsTokenPostbackPost(
        sessionId: sessionId, token: token, body: body);
  }

  ///PostbackMasterpassCardByToken
  ///@param session_id
  ///@param token
  @Post(path: '/v2/masterpass/sessions/{session_id}/cards/{token}/postback')
  Future<chopper.Response<List<MasterpassPostbackOut>>>
      _v2MasterpassSessionsSessionIdCardsTokenPostbackPost(
          {@Path('session_id') required String? sessionId,
          @Path('token') required String? token,
          @Body() required MasterpassPostbackIn? body});

  ///ChangeMasterpassPhone
  Future<chopper.Response<ChangePhoneOut>> v2MasterpassPhonesPatch(
      {required ChangePhoneIn? body}) {
    generatedMapping.putIfAbsent(
        ChangePhoneOut, () => ChangePhoneOut.fromJsonFactory);

    return _v2MasterpassPhonesPatch(body: body);
  }

  ///ChangeMasterpassPhone
  @Patch(path: '/v2/masterpass/phones')
  Future<chopper.Response<ChangePhoneOut>> _v2MasterpassPhonesPatch(
      {@Body() required ChangePhoneIn? body});

  ///HealthCheck
  Future<chopper.Response> healthzGet() {
    return _healthzGet();
  }

  ///HealthCheck
  @Get(path: '/healthz')
  Future<chopper.Response> _healthzGet();

  ///SendWebhook
  ///@param x-signature
  Future<chopper.Response> webhookUrlPost(
      {String? xSignature, required WebhookEvent? body}) {
    return _webhookUrlPost(xSignature: xSignature, body: body);
  }

  ///SendWebhook
  ///@param x-signature
  @Post(path: '/webhook-url')
  Future<chopper.Response> _webhookUrlPost(
      {@Header('x-signature') String? xSignature,
      @Body() required WebhookEvent? body});
}

@JsonSerializable(explicitToJson: true)
class Error {
  Error({
    this.code,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;
  static const fromJsonFactory = _$ErrorFromJson;
  static const toJsonFactory = _$ErrorToJson;
  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ErrorExtension on Error {
  Error copyWith({String? code, String? message}) {
    return Error(code: code ?? this.code, message: message ?? this.message);
  }
}

@JsonSerializable(explicitToJson: true)
class ValidationError {
  ValidationError({
    this.code,
    this.message,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;
  static const fromJsonFactory = _$ValidationErrorFromJson;
  static const toJsonFactory = _$ValidationErrorToJson;
  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidationError &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ValidationErrorExtension on ValidationError {
  ValidationError copyWith({String? code, String? message}) {
    return ValidationError(
        code: code ?? this.code, message: message ?? this.message);
  }
}

@JsonSerializable(explicitToJson: true)
class CardPayer {
  CardPayer({
    this.pan,
    this.exp,
    this.cvc,
    this.holder,
    this.save,
    this.email,
    this.phone,
    this.cardId,
  });

  factory CardPayer.fromJson(Map<String, dynamic> json) =>
      _$CardPayerFromJson(json);

  @JsonKey(name: 'pan')
  final String? pan;
  @JsonKey(name: 'exp')
  final String? exp;
  @JsonKey(name: 'cvc')
  final String? cvc;
  @JsonKey(name: 'holder')
  final String? holder;
  @JsonKey(name: 'save', defaultValue: false)
  final bool? save;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'card_id')
  final String? cardId;
  static const fromJsonFactory = _$CardPayerFromJson;
  static const toJsonFactory = _$CardPayerToJson;
  Map<String, dynamic> toJson() => _$CardPayerToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CardPayer &&
            (identical(other.pan, pan) ||
                const DeepCollectionEquality().equals(other.pan, pan)) &&
            (identical(other.exp, exp) ||
                const DeepCollectionEquality().equals(other.exp, exp)) &&
            (identical(other.cvc, cvc) ||
                const DeepCollectionEquality().equals(other.cvc, cvc)) &&
            (identical(other.holder, holder) ||
                const DeepCollectionEquality().equals(other.holder, holder)) &&
            (identical(other.save, save) ||
                const DeepCollectionEquality().equals(other.save, save)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(pan) ^
      const DeepCollectionEquality().hash(exp) ^
      const DeepCollectionEquality().hash(cvc) ^
      const DeepCollectionEquality().hash(holder) ^
      const DeepCollectionEquality().hash(save) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(cardId) ^
      runtimeType.hashCode;
}

extension $CardPayerExtension on CardPayer {
  CardPayer copyWith(
      {String? pan,
      String? exp,
      String? cvc,
      String? holder,
      bool? save,
      String? email,
      String? phone,
      String? cardId}) {
    return CardPayer(
        pan: pan ?? this.pan,
        exp: exp ?? this.exp,
        cvc: cvc ?? this.cvc,
        holder: holder ?? this.holder,
        save: save ?? this.save,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        cardId: cardId ?? this.cardId);
  }
}

@JsonSerializable(explicitToJson: true)
class Contacts {
  Contacts({
    this.email,
    this.phone,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  static const fromJsonFactory = _$ContactsFromJson;
  static const toJsonFactory = _$ContactsToJson;
  Map<String, dynamic> toJson() => _$ContactsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Contacts &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      runtimeType.hashCode;
}

extension $ContactsExtension on Contacts {
  Contacts copyWith({String? email, String? phone}) {
    return Contacts(email: email ?? this.email, phone: phone ?? this.phone);
  }
}

@JsonSerializable(explicitToJson: true)
class OrderEventOut {
  OrderEventOut({
    this.id,
    this.name,
    this.createdAt,
    this.orderId,
    this.paymentId,
    this.refundId,
    this.md,
    this.paReq,
    this.acsUrl,
    this.termUrl,
    this.code,
    this.message,
  });

  factory OrderEventOut.fromJson(Map<String, dynamic> json) =>
      _$OrderEventOutFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(
      name: 'name',
      toJson: eventNameEnumToJson,
      fromJson: eventNameEnumFromJson)
  final enums.EventNameEnum? name;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'order_id')
  final String? orderId;
  @JsonKey(name: 'payment_id')
  final String? paymentId;
  @JsonKey(name: 'refund_id')
  final String? refundId;
  @JsonKey(name: 'md')
  final String? md;
  @JsonKey(name: 'pa_req')
  final String? paReq;
  @JsonKey(name: 'acs_url')
  final String? acsUrl;
  @JsonKey(name: 'term_url')
  final String? termUrl;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;
  static const fromJsonFactory = _$OrderEventOutFromJson;
  static const toJsonFactory = _$OrderEventOutToJson;
  Map<String, dynamic> toJson() => _$OrderEventOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OrderEventOut &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.paymentId, paymentId) ||
                const DeepCollectionEquality()
                    .equals(other.paymentId, paymentId)) &&
            (identical(other.refundId, refundId) ||
                const DeepCollectionEquality()
                    .equals(other.refundId, refundId)) &&
            (identical(other.md, md) ||
                const DeepCollectionEquality().equals(other.md, md)) &&
            (identical(other.paReq, paReq) ||
                const DeepCollectionEquality().equals(other.paReq, paReq)) &&
            (identical(other.acsUrl, acsUrl) ||
                const DeepCollectionEquality().equals(other.acsUrl, acsUrl)) &&
            (identical(other.termUrl, termUrl) ||
                const DeepCollectionEquality()
                    .equals(other.termUrl, termUrl)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(paymentId) ^
      const DeepCollectionEquality().hash(refundId) ^
      const DeepCollectionEquality().hash(md) ^
      const DeepCollectionEquality().hash(paReq) ^
      const DeepCollectionEquality().hash(acsUrl) ^
      const DeepCollectionEquality().hash(termUrl) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $OrderEventOutExtension on OrderEventOut {
  OrderEventOut copyWith(
      {String? id,
      enums.EventNameEnum? name,
      String? createdAt,
      String? orderId,
      String? paymentId,
      String? refundId,
      String? md,
      String? paReq,
      String? acsUrl,
      String? termUrl,
      String? code,
      String? message}) {
    return OrderEventOut(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        orderId: orderId ?? this.orderId,
        paymentId: paymentId ?? this.paymentId,
        refundId: refundId ?? this.refundId,
        md: md ?? this.md,
        paReq: paReq ?? this.paReq,
        acsUrl: acsUrl ?? this.acsUrl,
        termUrl: termUrl ?? this.termUrl,
        code: code ?? this.code,
        message: message ?? this.message);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerEventOut {
  CustomerEventOut({
    this.id,
    this.name,
    this.createdAt,
    this.customerId,
    this.cardId,
    this.md,
    this.paReq,
    this.acsUrl,
    this.termUrl,
    this.code,
    this.message,
  });

  factory CustomerEventOut.fromJson(Map<String, dynamic> json) =>
      _$CustomerEventOutFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(
      name: 'name',
      toJson: customerEventNameEnumToJson,
      fromJson: customerEventNameEnumFromJson)
  final enums.CustomerEventNameEnum? name;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'card_id')
  final String? cardId;
  @JsonKey(name: 'md')
  final String? md;
  @JsonKey(name: 'pa_req')
  final String? paReq;
  @JsonKey(name: 'acs_url')
  final String? acsUrl;
  @JsonKey(name: 'term_url')
  final String? termUrl;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;
  static const fromJsonFactory = _$CustomerEventOutFromJson;
  static const toJsonFactory = _$CustomerEventOutToJson;
  Map<String, dynamic> toJson() => _$CustomerEventOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerEventOut &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)) &&
            (identical(other.md, md) ||
                const DeepCollectionEquality().equals(other.md, md)) &&
            (identical(other.paReq, paReq) ||
                const DeepCollectionEquality().equals(other.paReq, paReq)) &&
            (identical(other.acsUrl, acsUrl) ||
                const DeepCollectionEquality().equals(other.acsUrl, acsUrl)) &&
            (identical(other.termUrl, termUrl) ||
                const DeepCollectionEquality()
                    .equals(other.termUrl, termUrl)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(cardId) ^
      const DeepCollectionEquality().hash(md) ^
      const DeepCollectionEquality().hash(paReq) ^
      const DeepCollectionEquality().hash(acsUrl) ^
      const DeepCollectionEquality().hash(termUrl) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $CustomerEventOutExtension on CustomerEventOut {
  CustomerEventOut copyWith(
      {String? id,
      enums.CustomerEventNameEnum? name,
      String? createdAt,
      String? customerId,
      String? cardId,
      String? md,
      String? paReq,
      String? acsUrl,
      String? termUrl,
      String? code,
      String? message}) {
    return CustomerEventOut(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        customerId: customerId ?? this.customerId,
        cardId: cardId ?? this.cardId,
        md: md ?? this.md,
        paReq: paReq ?? this.paReq,
        acsUrl: acsUrl ?? this.acsUrl,
        termUrl: termUrl ?? this.termUrl,
        code: code ?? this.code,
        message: message ?? this.message);
  }
}

@JsonSerializable(explicitToJson: true)
class OrderIn {
  OrderIn({
    this.amount,
    this.currency,
    this.captureMethod,
    this.externalId,
    this.description,
    this.extraInfo,
    this.attempts,
    this.dueDate,
    this.customerId,
    this.cardId,
    this.backUrl,
    this.successUrl,
    this.failureUrl,
    this.template,
  });

  factory OrderIn.fromJson(Map<String, dynamic> json) =>
      _$OrderInFromJson(json);

  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(
      name: 'currency',
      toJson: currencyEnumToJson,
      fromJson: currencyEnumFromJson)
  final enums.CurrencyEnum? currency;
  @JsonKey(
      name: 'capture_method',
      toJson: captureMethodToJson,
      fromJson: captureMethodFromJson)
  final enums.CaptureMethod? captureMethod;
  @JsonKey(name: 'external_id')
  final String? externalId;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'extra_info')
  final Object? extraInfo;
  @JsonKey(name: 'attempts')
  final int? attempts;
  @JsonKey(name: 'due_date')
  final String? dueDate;
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'card_id')
  final String? cardId;
  @JsonKey(name: 'back_url')
  final String? backUrl;
  @JsonKey(name: 'success_url')
  final String? successUrl;
  @JsonKey(name: 'failure_url')
  final String? failureUrl;
  @JsonKey(name: 'template')
  final String? template;
  static const fromJsonFactory = _$OrderInFromJson;
  static const toJsonFactory = _$OrderInToJson;
  Map<String, dynamic> toJson() => _$OrderInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OrderIn &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.captureMethod, captureMethod) ||
                const DeepCollectionEquality()
                    .equals(other.captureMethod, captureMethod)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.extraInfo, extraInfo) ||
                const DeepCollectionEquality()
                    .equals(other.extraInfo, extraInfo)) &&
            (identical(other.attempts, attempts) ||
                const DeepCollectionEquality()
                    .equals(other.attempts, attempts)) &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality()
                    .equals(other.dueDate, dueDate)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)) &&
            (identical(other.backUrl, backUrl) ||
                const DeepCollectionEquality()
                    .equals(other.backUrl, backUrl)) &&
            (identical(other.successUrl, successUrl) ||
                const DeepCollectionEquality()
                    .equals(other.successUrl, successUrl)) &&
            (identical(other.failureUrl, failureUrl) ||
                const DeepCollectionEquality()
                    .equals(other.failureUrl, failureUrl)) &&
            (identical(other.template, template) ||
                const DeepCollectionEquality()
                    .equals(other.template, template)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(captureMethod) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(extraInfo) ^
      const DeepCollectionEquality().hash(attempts) ^
      const DeepCollectionEquality().hash(dueDate) ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(cardId) ^
      const DeepCollectionEquality().hash(backUrl) ^
      const DeepCollectionEquality().hash(successUrl) ^
      const DeepCollectionEquality().hash(failureUrl) ^
      const DeepCollectionEquality().hash(template) ^
      runtimeType.hashCode;
}

extension $OrderInExtension on OrderIn {
  OrderIn copyWith(
      {int? amount,
      enums.CurrencyEnum? currency,
      enums.CaptureMethod? captureMethod,
      String? externalId,
      String? description,
      Object? extraInfo,
      int? attempts,
      String? dueDate,
      String? customerId,
      String? cardId,
      String? backUrl,
      String? successUrl,
      String? failureUrl,
      String? template}) {
    return OrderIn(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        captureMethod: captureMethod ?? this.captureMethod,
        externalId: externalId ?? this.externalId,
        description: description ?? this.description,
        extraInfo: extraInfo ?? this.extraInfo,
        attempts: attempts ?? this.attempts,
        dueDate: dueDate ?? this.dueDate,
        customerId: customerId ?? this.customerId,
        cardId: cardId ?? this.cardId,
        backUrl: backUrl ?? this.backUrl,
        successUrl: successUrl ?? this.successUrl,
        failureUrl: failureUrl ?? this.failureUrl,
        template: template ?? this.template);
  }
}

@JsonSerializable(explicitToJson: true)
class OrderOut {
  OrderOut({
    this.id,
    this.status,
    this.createdAt,
    this.amount,
    this.currency,
    this.captureMethod,
    this.externalId,
    this.description,
    this.extraInfo,
    this.attempts,
    this.dueDate,
    this.customerId,
    this.cardId,
    this.backUrl,
    this.successUrl,
    this.failureUrl,
    this.template,
    this.checkoutUrl,
  });

  factory OrderOut.fromJson(Map<String, dynamic> json) =>
      _$OrderOutFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(
      name: 'status', toJson: orderStatusToJson, fromJson: orderStatusFromJson)
  final enums.OrderStatus? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(
      name: 'currency',
      toJson: currencyEnumToJson,
      fromJson: currencyEnumFromJson)
  final enums.CurrencyEnum? currency;
  @JsonKey(
      name: 'capture_method',
      toJson: captureMethodToJson,
      fromJson: captureMethodFromJson)
  final enums.CaptureMethod? captureMethod;
  @JsonKey(name: 'external_id')
  final String? externalId;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'extra_info')
  final Object? extraInfo;
  @JsonKey(name: 'attempts')
  final int? attempts;
  @JsonKey(name: 'due_date')
  final String? dueDate;
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'card_id')
  final String? cardId;
  @JsonKey(name: 'back_url')
  final String? backUrl;
  @JsonKey(name: 'success_url')
  final String? successUrl;
  @JsonKey(name: 'failure_url')
  final String? failureUrl;
  @JsonKey(name: 'template')
  final String? template;
  @JsonKey(name: 'checkout_url')
  final String? checkoutUrl;
  static const fromJsonFactory = _$OrderOutFromJson;
  static const toJsonFactory = _$OrderOutToJson;
  Map<String, dynamic> toJson() => _$OrderOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OrderOut &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.captureMethod, captureMethod) ||
                const DeepCollectionEquality()
                    .equals(other.captureMethod, captureMethod)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.extraInfo, extraInfo) ||
                const DeepCollectionEquality()
                    .equals(other.extraInfo, extraInfo)) &&
            (identical(other.attempts, attempts) ||
                const DeepCollectionEquality()
                    .equals(other.attempts, attempts)) &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality()
                    .equals(other.dueDate, dueDate)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)) &&
            (identical(other.backUrl, backUrl) ||
                const DeepCollectionEquality()
                    .equals(other.backUrl, backUrl)) &&
            (identical(other.successUrl, successUrl) ||
                const DeepCollectionEquality()
                    .equals(other.successUrl, successUrl)) &&
            (identical(other.failureUrl, failureUrl) ||
                const DeepCollectionEquality()
                    .equals(other.failureUrl, failureUrl)) &&
            (identical(other.template, template) ||
                const DeepCollectionEquality()
                    .equals(other.template, template)) &&
            (identical(other.checkoutUrl, checkoutUrl) ||
                const DeepCollectionEquality()
                    .equals(other.checkoutUrl, checkoutUrl)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(captureMethod) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(extraInfo) ^
      const DeepCollectionEquality().hash(attempts) ^
      const DeepCollectionEquality().hash(dueDate) ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(cardId) ^
      const DeepCollectionEquality().hash(backUrl) ^
      const DeepCollectionEquality().hash(successUrl) ^
      const DeepCollectionEquality().hash(failureUrl) ^
      const DeepCollectionEquality().hash(template) ^
      const DeepCollectionEquality().hash(checkoutUrl) ^
      runtimeType.hashCode;
}

extension $OrderOutExtension on OrderOut {
  OrderOut copyWith(
      {String? id,
      enums.OrderStatus? status,
      String? createdAt,
      int? amount,
      enums.CurrencyEnum? currency,
      enums.CaptureMethod? captureMethod,
      String? externalId,
      String? description,
      Object? extraInfo,
      int? attempts,
      String? dueDate,
      String? customerId,
      String? cardId,
      String? backUrl,
      String? successUrl,
      String? failureUrl,
      String? template,
      String? checkoutUrl}) {
    return OrderOut(
        id: id ?? this.id,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        captureMethod: captureMethod ?? this.captureMethod,
        externalId: externalId ?? this.externalId,
        description: description ?? this.description,
        extraInfo: extraInfo ?? this.extraInfo,
        attempts: attempts ?? this.attempts,
        dueDate: dueDate ?? this.dueDate,
        customerId: customerId ?? this.customerId,
        cardId: cardId ?? this.cardId,
        backUrl: backUrl ?? this.backUrl,
        successUrl: successUrl ?? this.successUrl,
        failureUrl: failureUrl ?? this.failureUrl,
        template: template ?? this.template,
        checkoutUrl: checkoutUrl ?? this.checkoutUrl);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerAndAccessToken {
  CustomerAndAccessToken({
    this.customer,
    this.customerAccessToken,
  });

  factory CustomerAndAccessToken.fromJson(Map<String, dynamic> json) =>
      _$CustomerAndAccessTokenFromJson(json);

  @JsonKey(name: 'customer')
  final ExtendedCustomer? customer;
  @JsonKey(name: 'customer_access_token')
  final String? customerAccessToken;
  static const fromJsonFactory = _$CustomerAndAccessTokenFromJson;
  static const toJsonFactory = _$CustomerAndAccessTokenToJson;
  Map<String, dynamic> toJson() => _$CustomerAndAccessTokenToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerAndAccessToken &&
            (identical(other.customer, customer) ||
                const DeepCollectionEquality()
                    .equals(other.customer, customer)) &&
            (identical(other.customerAccessToken, customerAccessToken) ||
                const DeepCollectionEquality()
                    .equals(other.customerAccessToken, customerAccessToken)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(customer) ^
      const DeepCollectionEquality().hash(customerAccessToken) ^
      runtimeType.hashCode;
}

extension $CustomerAndAccessTokenExtension on CustomerAndAccessToken {
  CustomerAndAccessToken copyWith(
      {ExtendedCustomer? customer, String? customerAccessToken}) {
    return CustomerAndAccessToken(
        customer: customer ?? this.customer,
        customerAccessToken: customerAccessToken ?? this.customerAccessToken);
  }
}

@JsonSerializable(explicitToJson: true)
class OrderAndAccessToken {
  OrderAndAccessToken({
    this.order,
    this.orderAccessToken,
  });

  factory OrderAndAccessToken.fromJson(Map<String, dynamic> json) =>
      _$OrderAndAccessTokenFromJson(json);

  @JsonKey(name: 'order')
  final OrderOut? order;
  @JsonKey(name: 'order_access_token')
  final String? orderAccessToken;
  static const fromJsonFactory = _$OrderAndAccessTokenFromJson;
  static const toJsonFactory = _$OrderAndAccessTokenToJson;
  Map<String, dynamic> toJson() => _$OrderAndAccessTokenToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OrderAndAccessToken &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.orderAccessToken, orderAccessToken) ||
                const DeepCollectionEquality()
                    .equals(other.orderAccessToken, orderAccessToken)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(orderAccessToken) ^
      runtimeType.hashCode;
}

extension $OrderAndAccessTokenExtension on OrderAndAccessToken {
  OrderAndAccessToken copyWith({OrderOut? order, String? orderAccessToken}) {
    return OrderAndAccessToken(
        order: order ?? this.order,
        orderAccessToken: orderAccessToken ?? this.orderAccessToken);
  }
}

@JsonSerializable(explicitToJson: true)
class PaginatedOrderOut {
  PaginatedOrderOut({
    this.count,
    this.data,
  });

  factory PaginatedOrderOut.fromJson(Map<String, dynamic> json) =>
      _$PaginatedOrderOutFromJson(json);

  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'data', defaultValue: <OrderOut>[])
  final List<OrderOut>? data;
  static const fromJsonFactory = _$PaginatedOrderOutFromJson;
  static const toJsonFactory = _$PaginatedOrderOutToJson;
  Map<String, dynamic> toJson() => _$PaginatedOrderOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaginatedOrderOut &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $PaginatedOrderOutExtension on PaginatedOrderOut {
  PaginatedOrderOut copyWith({int? count, List<OrderOut>? data}) {
    return PaginatedOrderOut(
        count: count ?? this.count, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PaginatedPaymentOut {
  PaginatedPaymentOut({
    this.count,
    this.data,
  });

  factory PaginatedPaymentOut.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPaymentOutFromJson(json);

  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'data', defaultValue: <PaymentOut>[])
  final List<PaymentOut>? data;
  static const fromJsonFactory = _$PaginatedPaymentOutFromJson;
  static const toJsonFactory = _$PaginatedPaymentOutToJson;
  Map<String, dynamic> toJson() => _$PaginatedPaymentOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaginatedPaymentOut &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $PaginatedPaymentOutExtension on PaginatedPaymentOut {
  PaginatedPaymentOut copyWith({int? count, List<PaymentOut>? data}) {
    return PaginatedPaymentOut(
        count: count ?? this.count, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PaginatedRefundOut {
  PaginatedRefundOut({
    this.count,
    this.data,
  });

  factory PaginatedRefundOut.fromJson(Map<String, dynamic> json) =>
      _$PaginatedRefundOutFromJson(json);

  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'data', defaultValue: <RefundOut>[])
  final List<RefundOut>? data;
  static const fromJsonFactory = _$PaginatedRefundOutFromJson;
  static const toJsonFactory = _$PaginatedRefundOutToJson;
  Map<String, dynamic> toJson() => _$PaginatedRefundOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaginatedRefundOut &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $PaginatedRefundOutExtension on PaginatedRefundOut {
  PaginatedRefundOut copyWith({int? count, List<RefundOut>? data}) {
    return PaginatedRefundOut(
        count: count ?? this.count, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PayerOut {
  PayerOut({
    this.panMasked,
    this.expiryDate,
    this.holder,
    this.paymentSystem,
    this.emitter,
    this.email,
    this.phone,
    this.customerId,
    this.cardId,
  });

  factory PayerOut.fromJson(Map<String, dynamic> json) =>
      _$PayerOutFromJson(json);

  @JsonKey(name: 'pan_masked')
  final String? panMasked;
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;
  @JsonKey(name: 'holder')
  final String? holder;
  @JsonKey(name: 'payment_system')
  final String? paymentSystem;
  @JsonKey(name: 'emitter')
  final String? emitter;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'card_id')
  final String? cardId;
  static const fromJsonFactory = _$PayerOutFromJson;
  static const toJsonFactory = _$PayerOutToJson;
  Map<String, dynamic> toJson() => _$PayerOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PayerOut &&
            (identical(other.panMasked, panMasked) ||
                const DeepCollectionEquality()
                    .equals(other.panMasked, panMasked)) &&
            (identical(other.expiryDate, expiryDate) ||
                const DeepCollectionEquality()
                    .equals(other.expiryDate, expiryDate)) &&
            (identical(other.holder, holder) ||
                const DeepCollectionEquality().equals(other.holder, holder)) &&
            (identical(other.paymentSystem, paymentSystem) ||
                const DeepCollectionEquality()
                    .equals(other.paymentSystem, paymentSystem)) &&
            (identical(other.emitter, emitter) ||
                const DeepCollectionEquality()
                    .equals(other.emitter, emitter)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(panMasked) ^
      const DeepCollectionEquality().hash(expiryDate) ^
      const DeepCollectionEquality().hash(holder) ^
      const DeepCollectionEquality().hash(paymentSystem) ^
      const DeepCollectionEquality().hash(emitter) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(cardId) ^
      runtimeType.hashCode;
}

extension $PayerOutExtension on PayerOut {
  PayerOut copyWith(
      {String? panMasked,
      String? expiryDate,
      String? holder,
      String? paymentSystem,
      String? emitter,
      String? email,
      String? phone,
      String? customerId,
      String? cardId}) {
    return PayerOut(
        panMasked: panMasked ?? this.panMasked,
        expiryDate: expiryDate ?? this.expiryDate,
        holder: holder ?? this.holder,
        paymentSystem: paymentSystem ?? this.paymentSystem,
        emitter: emitter ?? this.emitter,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        customerId: customerId ?? this.customerId,
        cardId: cardId ?? this.cardId);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentCancel {
  PaymentCancel({
    this.reason,
  });

  factory PaymentCancel.fromJson(Map<String, dynamic> json) =>
      _$PaymentCancelFromJson(json);

  @JsonKey(name: 'reason')
  final String? reason;
  static const fromJsonFactory = _$PaymentCancelFromJson;
  static const toJsonFactory = _$PaymentCancelToJson;
  Map<String, dynamic> toJson() => _$PaymentCancelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentCancel &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(reason) ^ runtimeType.hashCode;
}

extension $PaymentCancelExtension on PaymentCancel {
  PaymentCancel copyWith({String? reason}) {
    return PaymentCancel(reason: reason ?? this.reason);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentCapture {
  PaymentCapture({
    this.amount,
    this.reason,
  });

  factory PaymentCapture.fromJson(Map<String, dynamic> json) =>
      _$PaymentCaptureFromJson(json);

  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'reason')
  final String? reason;
  static const fromJsonFactory = _$PaymentCaptureFromJson;
  static const toJsonFactory = _$PaymentCaptureToJson;
  Map<String, dynamic> toJson() => _$PaymentCaptureToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentCapture &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(reason) ^
      runtimeType.hashCode;
}

extension $PaymentCaptureExtension on PaymentCapture {
  PaymentCapture copyWith({int? amount, String? reason}) {
    return PaymentCapture(
        amount: amount ?? this.amount, reason: reason ?? this.reason);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentError {
  PaymentError({
    this.code,
    this.message,
  });

  factory PaymentError.fromJson(Map<String, dynamic> json) =>
      _$PaymentErrorFromJson(json);

  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;
  static const fromJsonFactory = _$PaymentErrorFromJson;
  static const toJsonFactory = _$PaymentErrorToJson;
  Map<String, dynamic> toJson() => _$PaymentErrorToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentError &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $PaymentErrorExtension on PaymentError {
  PaymentError copyWith({String? code, String? message}) {
    return PaymentError(
        code: code ?? this.code, message: message ?? this.message);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentIn {
  PaymentIn({
    this.paymentMethod,
    this.customerCard,
    this.card,
    this.contacts,
  });

  factory PaymentIn.fromJson(Map<String, dynamic> json) =>
      _$PaymentInFromJson(json);

  @JsonKey(name: 'payment_method')
  final PaymentMethod? paymentMethod;
  @JsonKey(name: 'customer_card')
  final CustomerCard? customerCard;
  @JsonKey(name: 'card')
  final Card? card;
  @JsonKey(name: 'contacts')
  final Contacts? contacts;
  static const fromJsonFactory = _$PaymentInFromJson;
  static const toJsonFactory = _$PaymentInToJson;
  Map<String, dynamic> toJson() => _$PaymentInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentIn &&
            (identical(other.paymentMethod, paymentMethod) ||
                const DeepCollectionEquality()
                    .equals(other.paymentMethod, paymentMethod)) &&
            (identical(other.customerCard, customerCard) ||
                const DeepCollectionEquality()
                    .equals(other.customerCard, customerCard)) &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)) &&
            (identical(other.contacts, contacts) ||
                const DeepCollectionEquality()
                    .equals(other.contacts, contacts)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(paymentMethod) ^
      const DeepCollectionEquality().hash(customerCard) ^
      const DeepCollectionEquality().hash(card) ^
      const DeepCollectionEquality().hash(contacts) ^
      runtimeType.hashCode;
}

extension $PaymentInExtension on PaymentIn {
  PaymentIn copyWith(
      {PaymentMethod? paymentMethod,
      CustomerCard? customerCard,
      Card? card,
      Contacts? contacts}) {
    return PaymentIn(
        paymentMethod: paymentMethod ?? this.paymentMethod,
        customerCard: customerCard ?? this.customerCard,
        card: card ?? this.card,
        contacts: contacts ?? this.contacts);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentMethod {
  PaymentMethod({
    this.token,
    this.saveCard,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'save_card', defaultValue: false)
  final bool? saveCard;
  static const fromJsonFactory = _$PaymentMethodFromJson;
  static const toJsonFactory = _$PaymentMethodToJson;
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethod &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.saveCard, saveCard) ||
                const DeepCollectionEquality()
                    .equals(other.saveCard, saveCard)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(saveCard) ^
      runtimeType.hashCode;
}

extension $PaymentMethodExtension on PaymentMethod {
  PaymentMethod copyWith({String? token, bool? saveCard}) {
    return PaymentMethod(
        token: token ?? this.token, saveCard: saveCard ?? this.saveCard);
  }
}

@JsonSerializable(explicitToJson: true)
class Card {
  Card({
    this.panMasked,
    this.expiryDate,
    this.holder,
    this.paymentSystem,
    this.emitter,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  @JsonKey(name: 'pan_masked')
  final String? panMasked;
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;
  @JsonKey(name: 'holder')
  final String? holder;
  @JsonKey(name: 'payment_system')
  final String? paymentSystem;
  @JsonKey(name: 'emitter')
  final String? emitter;
  static const fromJsonFactory = _$CardFromJson;
  static const toJsonFactory = _$CardToJson;
  Map<String, dynamic> toJson() => _$CardToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Card &&
            (identical(other.panMasked, panMasked) ||
                const DeepCollectionEquality()
                    .equals(other.panMasked, panMasked)) &&
            (identical(other.expiryDate, expiryDate) ||
                const DeepCollectionEquality()
                    .equals(other.expiryDate, expiryDate)) &&
            (identical(other.holder, holder) ||
                const DeepCollectionEquality().equals(other.holder, holder)) &&
            (identical(other.paymentSystem, paymentSystem) ||
                const DeepCollectionEquality()
                    .equals(other.paymentSystem, paymentSystem)) &&
            (identical(other.emitter, emitter) ||
                const DeepCollectionEquality().equals(other.emitter, emitter)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(panMasked) ^
      const DeepCollectionEquality().hash(expiryDate) ^
      const DeepCollectionEquality().hash(holder) ^
      const DeepCollectionEquality().hash(paymentSystem) ^
      const DeepCollectionEquality().hash(emitter) ^
      runtimeType.hashCode;
}

extension $CardExtension on Card {
  Card copyWith(
      {String? panMasked,
      String? expiryDate,
      String? holder,
      String? paymentSystem,
      String? emitter}) {
    return Card(
        panMasked: panMasked ?? this.panMasked,
        expiryDate: expiryDate ?? this.expiryDate,
        holder: holder ?? this.holder,
        paymentSystem: paymentSystem ?? this.paymentSystem,
        emitter: emitter ?? this.emitter);
  }
}

@JsonSerializable(explicitToJson: true)
class Client {
  Client({
    this.ip,
    this.fingerprint,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  @JsonKey(name: 'ip')
  final String? ip;
  @JsonKey(name: 'fingerprint')
  final String? fingerprint;
  static const fromJsonFactory = _$ClientFromJson;
  static const toJsonFactory = _$ClientToJson;
  Map<String, dynamic> toJson() => _$ClientToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Client &&
            (identical(other.ip, ip) ||
                const DeepCollectionEquality().equals(other.ip, ip)) &&
            (identical(other.fingerprint, fingerprint) ||
                const DeepCollectionEquality()
                    .equals(other.fingerprint, fingerprint)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(ip) ^
      const DeepCollectionEquality().hash(fingerprint) ^
      runtimeType.hashCode;
}

extension $ClientExtension on Client {
  Client copyWith({String? ip, String? fingerprint}) {
    return Client(
        ip: ip ?? this.ip, fingerprint: fingerprint ?? this.fingerprint);
  }
}

@JsonSerializable(explicitToJson: true)
class ApplePayIn {
  ApplePayIn({
    this.url,
    this.platform,
    this.domainName,
  });

  factory ApplePayIn.fromJson(Map<String, dynamic> json) =>
      _$ApplePayInFromJson(json);

  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'platform')
  final String? platform;
  @JsonKey(name: 'domain_name')
  final String? domainName;
  static const fromJsonFactory = _$ApplePayInFromJson;
  static const toJsonFactory = _$ApplePayInToJson;
  Map<String, dynamic> toJson() => _$ApplePayInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApplePayIn &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.domainName, domainName) ||
                const DeepCollectionEquality()
                    .equals(other.domainName, domainName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(domainName) ^
      runtimeType.hashCode;
}

extension $ApplePayInExtension on ApplePayIn {
  ApplePayIn copyWith({String? url, String? platform, String? domainName}) {
    return ApplePayIn(
        url: url ?? this.url,
        platform: platform ?? this.platform,
        domainName: domainName ?? this.domainName);
  }
}

@JsonSerializable(explicitToJson: true)
class ApplePayOut {
  ApplePayOut({
    this.epochTimestamp,
    this.expiresAt,
    this.merchantSessionIdentifier,
    this.nonce,
    this.merchantIdentifier,
    this.domainName,
    this.displayName,
    this.signature,
    this.operationalAnalyticsIdentifier,
    this.retries,
  });

  factory ApplePayOut.fromJson(Map<String, dynamic> json) =>
      _$ApplePayOutFromJson(json);

  @JsonKey(name: 'epochTimestamp')
  final int? epochTimestamp;
  @JsonKey(name: 'expiresAt')
  final int? expiresAt;
  @JsonKey(name: 'merchantSessionIdentifier')
  final String? merchantSessionIdentifier;
  @JsonKey(name: 'nonce')
  final String? nonce;
  @JsonKey(name: 'merchantIdentifier')
  final String? merchantIdentifier;
  @JsonKey(name: 'domainName')
  final String? domainName;
  @JsonKey(name: 'displayName')
  final String? displayName;
  @JsonKey(name: 'signature')
  final String? signature;
  @JsonKey(name: 'operationalAnalyticsIdentifier')
  final String? operationalAnalyticsIdentifier;
  @JsonKey(name: 'retries')
  final int? retries;
  static const fromJsonFactory = _$ApplePayOutFromJson;
  static const toJsonFactory = _$ApplePayOutToJson;
  Map<String, dynamic> toJson() => _$ApplePayOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApplePayOut &&
            (identical(other.epochTimestamp, epochTimestamp) ||
                const DeepCollectionEquality()
                    .equals(other.epochTimestamp, epochTimestamp)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)) &&
            (identical(other.merchantSessionIdentifier,
                    merchantSessionIdentifier) ||
                const DeepCollectionEquality().equals(
                    other.merchantSessionIdentifier,
                    merchantSessionIdentifier)) &&
            (identical(other.nonce, nonce) ||
                const DeepCollectionEquality().equals(other.nonce, nonce)) &&
            (identical(other.merchantIdentifier, merchantIdentifier) ||
                const DeepCollectionEquality()
                    .equals(other.merchantIdentifier, merchantIdentifier)) &&
            (identical(other.domainName, domainName) ||
                const DeepCollectionEquality()
                    .equals(other.domainName, domainName)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.signature, signature) ||
                const DeepCollectionEquality()
                    .equals(other.signature, signature)) &&
            (identical(other.operationalAnalyticsIdentifier,
                    operationalAnalyticsIdentifier) ||
                const DeepCollectionEquality().equals(
                    other.operationalAnalyticsIdentifier,
                    operationalAnalyticsIdentifier)) &&
            (identical(other.retries, retries) ||
                const DeepCollectionEquality().equals(other.retries, retries)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(epochTimestamp) ^
      const DeepCollectionEquality().hash(expiresAt) ^
      const DeepCollectionEquality().hash(merchantSessionIdentifier) ^
      const DeepCollectionEquality().hash(nonce) ^
      const DeepCollectionEquality().hash(merchantIdentifier) ^
      const DeepCollectionEquality().hash(domainName) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(signature) ^
      const DeepCollectionEquality().hash(operationalAnalyticsIdentifier) ^
      const DeepCollectionEquality().hash(retries) ^
      runtimeType.hashCode;
}

extension $ApplePayOutExtension on ApplePayOut {
  ApplePayOut copyWith(
      {int? epochTimestamp,
      int? expiresAt,
      String? merchantSessionIdentifier,
      String? nonce,
      String? merchantIdentifier,
      String? domainName,
      String? displayName,
      String? signature,
      String? operationalAnalyticsIdentifier,
      int? retries}) {
    return ApplePayOut(
        epochTimestamp: epochTimestamp ?? this.epochTimestamp,
        expiresAt: expiresAt ?? this.expiresAt,
        merchantSessionIdentifier:
            merchantSessionIdentifier ?? this.merchantSessionIdentifier,
        nonce: nonce ?? this.nonce,
        merchantIdentifier: merchantIdentifier ?? this.merchantIdentifier,
        domainName: domainName ?? this.domainName,
        displayName: displayName ?? this.displayName,
        signature: signature ?? this.signature,
        operationalAnalyticsIdentifier: operationalAnalyticsIdentifier ??
            this.operationalAnalyticsIdentifier,
        retries: retries ?? this.retries);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentMethodIn {
  PaymentMethodIn({
    this.paymentTool,
    this.$Client,
  });

  factory PaymentMethodIn.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodInFromJson(json);

  @JsonKey(name: 'payment_tool')
  final PaymentTool? paymentTool;
  @JsonKey(name: 'client')
  final Client? $Client;
  static const fromJsonFactory = _$PaymentMethodInFromJson;
  static const toJsonFactory = _$PaymentMethodInToJson;
  Map<String, dynamic> toJson() => _$PaymentMethodInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethodIn &&
            (identical(other.paymentTool, paymentTool) ||
                const DeepCollectionEquality()
                    .equals(other.paymentTool, paymentTool)) &&
            (identical(other.$Client, $Client) ||
                const DeepCollectionEquality().equals(other.$Client, $Client)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(paymentTool) ^
      const DeepCollectionEquality().hash($Client) ^
      runtimeType.hashCode;
}

extension $PaymentMethodInExtension on PaymentMethodIn {
  PaymentMethodIn copyWith({PaymentTool? paymentTool, Client? $Client}) {
    return PaymentMethodIn(
        paymentTool: paymentTool ?? this.paymentTool,
        $Client: $Client ?? this.$Client);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentMethodOut {
  PaymentMethodOut({
    this.card,
    this.session,
    this.token,
    this.expiresAt,
  });

  factory PaymentMethodOut.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodOutFromJson(json);

  @JsonKey(name: 'card')
  final Card? card;
  @JsonKey(name: 'session')
  final String? session;
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'expires_at')
  final String? expiresAt;
  static const fromJsonFactory = _$PaymentMethodOutFromJson;
  static const toJsonFactory = _$PaymentMethodOutToJson;
  Map<String, dynamic> toJson() => _$PaymentMethodOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethodOut &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)) &&
            (identical(other.session, session) ||
                const DeepCollectionEquality()
                    .equals(other.session, session)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(card) ^
      const DeepCollectionEquality().hash(session) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(expiresAt) ^
      runtimeType.hashCode;
}

extension $PaymentMethodOutExtension on PaymentMethodOut {
  PaymentMethodOut copyWith(
      {Card? card, String? session, String? token, String? expiresAt}) {
    return PaymentMethodOut(
        card: card ?? this.card,
        session: session ?? this.session,
        token: token ?? this.token,
        expiresAt: expiresAt ?? this.expiresAt);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentTool {
  PaymentTool({
    this.type,
    this.pan,
    this.expiryDate,
    this.cvc,
    this.holder,
    this.applePay,
    this.googlePay,
  });

  factory PaymentTool.fromJson(Map<String, dynamic> json) =>
      _$PaymentToolFromJson(json);

  @JsonKey(
      name: 'type',
      toJson: paymentToolTypeToJson,
      fromJson: paymentToolTypeFromJson)
  final enums.PaymentToolType? type;
  @JsonKey(name: 'pan')
  final String? pan;
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;
  @JsonKey(name: 'cvc')
  final String? cvc;
  @JsonKey(name: 'holder')
  final String? holder;
  @JsonKey(name: 'apple_pay')
  final ApplePayData? applePay;
  @JsonKey(name: 'google_pay')
  final GooglePayData? googlePay;
  static const fromJsonFactory = _$PaymentToolFromJson;
  static const toJsonFactory = _$PaymentToolToJson;
  Map<String, dynamic> toJson() => _$PaymentToolToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentTool &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.pan, pan) ||
                const DeepCollectionEquality().equals(other.pan, pan)) &&
            (identical(other.expiryDate, expiryDate) ||
                const DeepCollectionEquality()
                    .equals(other.expiryDate, expiryDate)) &&
            (identical(other.cvc, cvc) ||
                const DeepCollectionEquality().equals(other.cvc, cvc)) &&
            (identical(other.holder, holder) ||
                const DeepCollectionEquality().equals(other.holder, holder)) &&
            (identical(other.applePay, applePay) ||
                const DeepCollectionEquality()
                    .equals(other.applePay, applePay)) &&
            (identical(other.googlePay, googlePay) ||
                const DeepCollectionEquality()
                    .equals(other.googlePay, googlePay)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(pan) ^
      const DeepCollectionEquality().hash(expiryDate) ^
      const DeepCollectionEquality().hash(cvc) ^
      const DeepCollectionEquality().hash(holder) ^
      const DeepCollectionEquality().hash(applePay) ^
      const DeepCollectionEquality().hash(googlePay) ^
      runtimeType.hashCode;
}

extension $PaymentToolExtension on PaymentTool {
  PaymentTool copyWith(
      {enums.PaymentToolType? type,
      String? pan,
      String? expiryDate,
      String? cvc,
      String? holder,
      ApplePayData? applePay,
      GooglePayData? googlePay}) {
    return PaymentTool(
        type: type ?? this.type,
        pan: pan ?? this.pan,
        expiryDate: expiryDate ?? this.expiryDate,
        cvc: cvc ?? this.cvc,
        holder: holder ?? this.holder,
        applePay: applePay ?? this.applePay,
        googlePay: googlePay ?? this.googlePay);
  }
}

@JsonSerializable(explicitToJson: true)
class ApplePayData {
  ApplePayData({
    this.token,
    this.cardNetwork,
    this.cardType,
  });

  factory ApplePayData.fromJson(Map<String, dynamic> json) =>
      _$ApplePayDataFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'card_network')
  final String? cardNetwork;
  @JsonKey(name: 'cardType')
  final dynamic cardType;
  static const fromJsonFactory = _$ApplePayDataFromJson;
  static const toJsonFactory = _$ApplePayDataToJson;
  Map<String, dynamic> toJson() => _$ApplePayDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApplePayData &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.cardNetwork, cardNetwork) ||
                const DeepCollectionEquality()
                    .equals(other.cardNetwork, cardNetwork)) &&
            (identical(other.cardType, cardType) ||
                const DeepCollectionEquality()
                    .equals(other.cardType, cardType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(cardNetwork) ^
      const DeepCollectionEquality().hash(cardType) ^
      runtimeType.hashCode;
}

extension $ApplePayDataExtension on ApplePayData {
  ApplePayData copyWith(
      {String? token, String? cardNetwork, dynamic? cardType}) {
    return ApplePayData(
        token: token ?? this.token,
        cardNetwork: cardNetwork ?? this.cardNetwork,
        cardType: cardType ?? this.cardType);
  }
}

@JsonSerializable(explicitToJson: true)
class GooglePayData {
  GooglePayData({
    this.token,
    this.cardNetwork,
    this.cardDetails,
  });

  factory GooglePayData.fromJson(Map<String, dynamic> json) =>
      _$GooglePayDataFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'card_network')
  final String? cardNetwork;
  @JsonKey(name: 'card_details')
  final String? cardDetails;
  static const fromJsonFactory = _$GooglePayDataFromJson;
  static const toJsonFactory = _$GooglePayDataToJson;
  Map<String, dynamic> toJson() => _$GooglePayDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GooglePayData &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.cardNetwork, cardNetwork) ||
                const DeepCollectionEquality()
                    .equals(other.cardNetwork, cardNetwork)) &&
            (identical(other.cardDetails, cardDetails) ||
                const DeepCollectionEquality()
                    .equals(other.cardDetails, cardDetails)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(cardNetwork) ^
      const DeepCollectionEquality().hash(cardDetails) ^
      runtimeType.hashCode;
}

extension $GooglePayDataExtension on GooglePayData {
  GooglePayData copyWith(
      {String? token, String? cardNetwork, String? cardDetails}) {
    return GooglePayData(
        token: token ?? this.token,
        cardNetwork: cardNetwork ?? this.cardNetwork,
        cardDetails: cardDetails ?? this.cardDetails);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerCard {
  CustomerCard({
    this.cardId,
    this.cvc,
  });

  factory CustomerCard.fromJson(Map<String, dynamic> json) =>
      _$CustomerCardFromJson(json);

  @JsonKey(name: 'card_id')
  final String? cardId;
  @JsonKey(name: 'cvc')
  final String? cvc;
  static const fromJsonFactory = _$CustomerCardFromJson;
  static const toJsonFactory = _$CustomerCardToJson;
  Map<String, dynamic> toJson() => _$CustomerCardToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerCard &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)) &&
            (identical(other.cvc, cvc) ||
                const DeepCollectionEquality().equals(other.cvc, cvc)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cardId) ^
      const DeepCollectionEquality().hash(cvc) ^
      runtimeType.hashCode;
}

extension $CustomerCardExtension on CustomerCard {
  CustomerCard copyWith({String? cardId, String? cvc}) {
    return CustomerCard(cardId: cardId ?? this.cardId, cvc: cvc ?? this.cvc);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentOut {
  PaymentOut({
    this.id,
    this.status,
    this.createdAt,
    this.approvedAmount,
    this.capturedAmount,
    this.refundedAmount,
    this.processingFee,
    this.payer,
    this.error,
  });

  factory PaymentOut.fromJson(Map<String, dynamic> json) =>
      _$PaymentOutFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(
      name: 'status',
      toJson: paymentStatusToJson,
      fromJson: paymentStatusFromJson)
  final enums.PaymentStatus? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'approved_amount')
  final int? approvedAmount;
  @JsonKey(name: 'captured_amount')
  final int? capturedAmount;
  @JsonKey(name: 'refunded_amount')
  final int? refundedAmount;
  @JsonKey(name: 'processing_fee')
  final double? processingFee;
  @JsonKey(name: 'payer')
  final PayerOut? payer;
  @JsonKey(name: 'error')
  final PaymentError? error;
  static const fromJsonFactory = _$PaymentOutFromJson;
  static const toJsonFactory = _$PaymentOutToJson;
  Map<String, dynamic> toJson() => _$PaymentOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentOut &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.approvedAmount, approvedAmount) ||
                const DeepCollectionEquality()
                    .equals(other.approvedAmount, approvedAmount)) &&
            (identical(other.capturedAmount, capturedAmount) ||
                const DeepCollectionEquality()
                    .equals(other.capturedAmount, capturedAmount)) &&
            (identical(other.refundedAmount, refundedAmount) ||
                const DeepCollectionEquality()
                    .equals(other.refundedAmount, refundedAmount)) &&
            (identical(other.processingFee, processingFee) ||
                const DeepCollectionEquality()
                    .equals(other.processingFee, processingFee)) &&
            (identical(other.payer, payer) ||
                const DeepCollectionEquality().equals(other.payer, payer)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(approvedAmount) ^
      const DeepCollectionEquality().hash(capturedAmount) ^
      const DeepCollectionEquality().hash(refundedAmount) ^
      const DeepCollectionEquality().hash(processingFee) ^
      const DeepCollectionEquality().hash(payer) ^
      const DeepCollectionEquality().hash(error) ^
      runtimeType.hashCode;
}

extension $PaymentOutExtension on PaymentOut {
  PaymentOut copyWith(
      {String? id,
      enums.PaymentStatus? status,
      String? createdAt,
      int? approvedAmount,
      int? capturedAmount,
      int? refundedAmount,
      double? processingFee,
      PayerOut? payer,
      PaymentError? error}) {
    return PaymentOut(
        id: id ?? this.id,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        approvedAmount: approvedAmount ?? this.approvedAmount,
        capturedAmount: capturedAmount ?? this.capturedAmount,
        refundedAmount: refundedAmount ?? this.refundedAmount,
        processingFee: processingFee ?? this.processingFee,
        payer: payer ?? this.payer,
        error: error ?? this.error);
  }
}

@JsonSerializable(explicitToJson: true)
class RefundIn {
  RefundIn({
    this.amount,
    this.reason,
  });

  factory RefundIn.fromJson(Map<String, dynamic> json) =>
      _$RefundInFromJson(json);

  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'reason')
  final String? reason;
  static const fromJsonFactory = _$RefundInFromJson;
  static const toJsonFactory = _$RefundInToJson;
  Map<String, dynamic> toJson() => _$RefundInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefundIn &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(reason) ^
      runtimeType.hashCode;
}

extension $RefundInExtension on RefundIn {
  RefundIn copyWith({int? amount, String? reason}) {
    return RefundIn(
        amount: amount ?? this.amount, reason: reason ?? this.reason);
  }
}

@JsonSerializable(explicitToJson: true)
class RefundOut {
  RefundOut({
    this.id,
    this.status,
    this.createdAt,
    this.amount,
    this.reason,
  });

  factory RefundOut.fromJson(Map<String, dynamic> json) =>
      _$RefundOutFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(
      name: 'status',
      toJson: refundStatusToJson,
      fromJson: refundStatusFromJson)
  final enums.RefundStatus? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'reason')
  final String? reason;
  static const fromJsonFactory = _$RefundOutFromJson;
  static const toJsonFactory = _$RefundOutToJson;
  Map<String, dynamic> toJson() => _$RefundOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefundOut &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(reason) ^
      runtimeType.hashCode;
}

extension $RefundOutExtension on RefundOut {
  RefundOut copyWith(
      {String? id,
      enums.RefundStatus? status,
      String? createdAt,
      int? amount,
      String? reason}) {
    return RefundOut(
        id: id ?? this.id,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        amount: amount ?? this.amount,
        reason: reason ?? this.reason);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduleOut {
  ScheduleOut({
    this.status,
    this.nextPay,
    this.step,
    this.unit,
  });

  factory ScheduleOut.fromJson(Map<String, dynamic> json) =>
      _$ScheduleOutFromJson(json);

  @JsonKey(
      name: 'status',
      toJson: scheduleStatusEnumToJson,
      fromJson: scheduleStatusEnumFromJson)
  final enums.ScheduleStatusEnum? status;
  @JsonKey(name: 'next_pay')
  final String? nextPay;
  @JsonKey(name: 'step')
  final int? step;
  @JsonKey(
      name: 'unit',
      toJson: scheduleUnitEnumToJson,
      fromJson: scheduleUnitEnumFromJson)
  final enums.ScheduleUnitEnum? unit;
  static const fromJsonFactory = _$ScheduleOutFromJson;
  static const toJsonFactory = _$ScheduleOutToJson;
  Map<String, dynamic> toJson() => _$ScheduleOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduleOut &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.nextPay, nextPay) ||
                const DeepCollectionEquality()
                    .equals(other.nextPay, nextPay)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(nextPay) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(unit) ^
      runtimeType.hashCode;
}

extension $ScheduleOutExtension on ScheduleOut {
  ScheduleOut copyWith(
      {enums.ScheduleStatusEnum? status,
      String? nextPay,
      int? step,
      enums.ScheduleUnitEnum? unit}) {
    return ScheduleOut(
        status: status ?? this.status,
        nextPay: nextPay ?? this.nextPay,
        step: step ?? this.step,
        unit: unit ?? this.unit);
  }
}

@JsonSerializable(explicitToJson: true)
class ExtendedCard {
  ExtendedCard({
    this.id,
    this.customerId,
    this.status,
    this.createdAt,
    this.panMasked,
    this.expiryDate,
    this.holder,
    this.paymentSystem,
    this.emitter,
    this.cvcRequired,
    this.error,
    this.action,
  });

  factory ExtendedCard.fromJson(Map<String, dynamic> json) =>
      _$ExtendedCardFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(
      name: 'status', toJson: cardStatusToJson, fromJson: cardStatusFromJson)
  final enums.CardStatus? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'pan_masked')
  final String? panMasked;
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;
  @JsonKey(name: 'holder')
  final String? holder;
  @JsonKey(name: 'payment_system')
  final String? paymentSystem;
  @JsonKey(name: 'emitter')
  final String? emitter;
  @JsonKey(name: 'cvc_required')
  final bool? cvcRequired;
  @JsonKey(name: 'error')
  final PaymentError? error;
  @JsonKey(name: 'action')
  final TDSAction? action;
  static const fromJsonFactory = _$ExtendedCardFromJson;
  static const toJsonFactory = _$ExtendedCardToJson;
  Map<String, dynamic> toJson() => _$ExtendedCardToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExtendedCard &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.panMasked, panMasked) ||
                const DeepCollectionEquality()
                    .equals(other.panMasked, panMasked)) &&
            (identical(other.expiryDate, expiryDate) ||
                const DeepCollectionEquality()
                    .equals(other.expiryDate, expiryDate)) &&
            (identical(other.holder, holder) ||
                const DeepCollectionEquality().equals(other.holder, holder)) &&
            (identical(other.paymentSystem, paymentSystem) ||
                const DeepCollectionEquality()
                    .equals(other.paymentSystem, paymentSystem)) &&
            (identical(other.emitter, emitter) ||
                const DeepCollectionEquality()
                    .equals(other.emitter, emitter)) &&
            (identical(other.cvcRequired, cvcRequired) ||
                const DeepCollectionEquality()
                    .equals(other.cvcRequired, cvcRequired)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(panMasked) ^
      const DeepCollectionEquality().hash(expiryDate) ^
      const DeepCollectionEquality().hash(holder) ^
      const DeepCollectionEquality().hash(paymentSystem) ^
      const DeepCollectionEquality().hash(emitter) ^
      const DeepCollectionEquality().hash(cvcRequired) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(action) ^
      runtimeType.hashCode;
}

extension $ExtendedCardExtension on ExtendedCard {
  ExtendedCard copyWith(
      {String? id,
      String? customerId,
      enums.CardStatus? status,
      String? createdAt,
      String? panMasked,
      String? expiryDate,
      String? holder,
      String? paymentSystem,
      String? emitter,
      bool? cvcRequired,
      PaymentError? error,
      TDSAction? action}) {
    return ExtendedCard(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        panMasked: panMasked ?? this.panMasked,
        expiryDate: expiryDate ?? this.expiryDate,
        holder: holder ?? this.holder,
        paymentSystem: paymentSystem ?? this.paymentSystem,
        emitter: emitter ?? this.emitter,
        cvcRequired: cvcRequired ?? this.cvcRequired,
        error: error ?? this.error,
        action: action ?? this.action);
  }
}

@JsonSerializable(explicitToJson: true)
class ExtendedCustomer {
  ExtendedCustomer({
    this.id,
    this.createdAt,
    this.status,
    this.externalId,
    this.email,
    this.phone,
    this.checkoutUrl,
    this.accessToken,
  });

  factory ExtendedCustomer.fromJson(Map<String, dynamic> json) =>
      _$ExtendedCustomerFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(
      name: 'status',
      toJson: customerStatusToJson,
      fromJson: customerStatusFromJson)
  final enums.CustomerStatus? status;
  @JsonKey(name: 'external_id')
  final String? externalId;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'checkout_url')
  final String? checkoutUrl;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  static const fromJsonFactory = _$ExtendedCustomerFromJson;
  static const toJsonFactory = _$ExtendedCustomerToJson;
  Map<String, dynamic> toJson() => _$ExtendedCustomerToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExtendedCustomer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.checkoutUrl, checkoutUrl) ||
                const DeepCollectionEquality()
                    .equals(other.checkoutUrl, checkoutUrl)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(checkoutUrl) ^
      const DeepCollectionEquality().hash(accessToken) ^
      runtimeType.hashCode;
}

extension $ExtendedCustomerExtension on ExtendedCustomer {
  ExtendedCustomer copyWith(
      {String? id,
      String? createdAt,
      enums.CustomerStatus? status,
      String? externalId,
      String? email,
      String? phone,
      String? checkoutUrl,
      String? accessToken}) {
    return ExtendedCustomer(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        status: status ?? this.status,
        externalId: externalId ?? this.externalId,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        checkoutUrl: checkoutUrl ?? this.checkoutUrl,
        accessToken: accessToken ?? this.accessToken);
  }
}

@JsonSerializable(explicitToJson: true)
class BindingCard {
  BindingCard({
    this.pan,
    this.exp,
    this.cvc,
    this.holder,
  });

  factory BindingCard.fromJson(Map<String, dynamic> json) =>
      _$BindingCardFromJson(json);

  @JsonKey(name: 'pan')
  final String? pan;
  @JsonKey(name: 'exp')
  final String? exp;
  @JsonKey(name: 'cvc')
  final String? cvc;
  @JsonKey(name: 'holder')
  final String? holder;
  static const fromJsonFactory = _$BindingCardFromJson;
  static const toJsonFactory = _$BindingCardToJson;
  Map<String, dynamic> toJson() => _$BindingCardToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BindingCard &&
            (identical(other.pan, pan) ||
                const DeepCollectionEquality().equals(other.pan, pan)) &&
            (identical(other.exp, exp) ||
                const DeepCollectionEquality().equals(other.exp, exp)) &&
            (identical(other.cvc, cvc) ||
                const DeepCollectionEquality().equals(other.cvc, cvc)) &&
            (identical(other.holder, holder) ||
                const DeepCollectionEquality().equals(other.holder, holder)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(pan) ^
      const DeepCollectionEquality().hash(exp) ^
      const DeepCollectionEquality().hash(cvc) ^
      const DeepCollectionEquality().hash(holder) ^
      runtimeType.hashCode;
}

extension $BindingCardExtension on BindingCard {
  BindingCard copyWith(
      {String? pan, String? exp, String? cvc, String? holder}) {
    return BindingCard(
        pan: pan ?? this.pan,
        exp: exp ?? this.exp,
        cvc: cvc ?? this.cvc,
        holder: holder ?? this.holder);
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionIn {
  SubscriptionIn({
    this.customerId,
    this.cardId,
    this.amount,
    this.currency,
    this.description,
    this.extraInfo,
    this.nextPay,
    this.step,
    this.unit,
  });

  factory SubscriptionIn.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionInFromJson(json);

  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'card_id')
  final String? cardId;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'currency')
  final String? currency;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'extraInfo')
  final dynamic extraInfo;
  @JsonKey(name: 'next_pay')
  final String? nextPay;
  @JsonKey(name: 'step')
  final int? step;
  @JsonKey(
      name: 'unit',
      toJson: scheduleUnitEnumToJson,
      fromJson: scheduleUnitEnumFromJson)
  final enums.ScheduleUnitEnum? unit;
  static const fromJsonFactory = _$SubscriptionInFromJson;
  static const toJsonFactory = _$SubscriptionInToJson;
  Map<String, dynamic> toJson() => _$SubscriptionInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionIn &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.extraInfo, extraInfo) ||
                const DeepCollectionEquality()
                    .equals(other.extraInfo, extraInfo)) &&
            (identical(other.nextPay, nextPay) ||
                const DeepCollectionEquality()
                    .equals(other.nextPay, nextPay)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(cardId) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(extraInfo) ^
      const DeepCollectionEquality().hash(nextPay) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(unit) ^
      runtimeType.hashCode;
}

extension $SubscriptionInExtension on SubscriptionIn {
  SubscriptionIn copyWith(
      {String? customerId,
      String? cardId,
      int? amount,
      String? currency,
      String? description,
      dynamic? extraInfo,
      String? nextPay,
      int? step,
      enums.ScheduleUnitEnum? unit}) {
    return SubscriptionIn(
        customerId: customerId ?? this.customerId,
        cardId: cardId ?? this.cardId,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        extraInfo: extraInfo ?? this.extraInfo,
        nextPay: nextPay ?? this.nextPay,
        step: step ?? this.step,
        unit: unit ?? this.unit);
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionOut {
  SubscriptionOut({
    this.id,
    this.createdAt,
    this.amount,
    this.currency,
    this.description,
    this.extraInfo,
    this.payer,
    this.schedule,
  });

  factory SubscriptionOut.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionOutFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'currency')
  final String? currency;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'extraInfo')
  final dynamic extraInfo;
  @JsonKey(name: 'payer')
  final PayerOut? payer;
  @JsonKey(name: 'schedule')
  final ScheduleOut? schedule;
  static const fromJsonFactory = _$SubscriptionOutFromJson;
  static const toJsonFactory = _$SubscriptionOutToJson;
  Map<String, dynamic> toJson() => _$SubscriptionOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionOut &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.extraInfo, extraInfo) ||
                const DeepCollectionEquality()
                    .equals(other.extraInfo, extraInfo)) &&
            (identical(other.payer, payer) ||
                const DeepCollectionEquality().equals(other.payer, payer)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(extraInfo) ^
      const DeepCollectionEquality().hash(payer) ^
      const DeepCollectionEquality().hash(schedule) ^
      runtimeType.hashCode;
}

extension $SubscriptionOutExtension on SubscriptionOut {
  SubscriptionOut copyWith(
      {String? id,
      String? createdAt,
      int? amount,
      String? currency,
      String? description,
      dynamic? extraInfo,
      PayerOut? payer,
      ScheduleOut? schedule}) {
    return SubscriptionOut(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        extraInfo: extraInfo ?? this.extraInfo,
        payer: payer ?? this.payer,
        schedule: schedule ?? this.schedule);
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionStatusIn {
  SubscriptionStatusIn({
    this.status,
  });

  factory SubscriptionStatusIn.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStatusInFromJson(json);

  @JsonKey(
      name: 'status',
      toJson: scheduleStatusEnumToJson,
      fromJson: scheduleStatusEnumFromJson)
  final enums.ScheduleStatusEnum? status;
  static const fromJsonFactory = _$SubscriptionStatusInFromJson;
  static const toJsonFactory = _$SubscriptionStatusInToJson;
  Map<String, dynamic> toJson() => _$SubscriptionStatusInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionStatusIn &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^ runtimeType.hashCode;
}

extension $SubscriptionStatusInExtension on SubscriptionStatusIn {
  SubscriptionStatusIn copyWith({enums.ScheduleStatusEnum? status}) {
    return SubscriptionStatusIn(status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionUpdate {
  SubscriptionUpdate({
    this.customerId,
    this.cardId,
    this.amount,
    this.currency,
    this.description,
    this.extraInfo,
    this.nextPay,
    this.step,
    this.unit,
  });

  factory SubscriptionUpdate.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionUpdateFromJson(json);

  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'card_id')
  final String? cardId;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'currency')
  final String? currency;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'extraInfo')
  final dynamic extraInfo;
  @JsonKey(name: 'next_pay')
  final String? nextPay;
  @JsonKey(name: 'step')
  final int? step;
  @JsonKey(
      name: 'unit',
      toJson: scheduleUnitEnumToJson,
      fromJson: scheduleUnitEnumFromJson)
  final enums.ScheduleUnitEnum? unit;
  static const fromJsonFactory = _$SubscriptionUpdateFromJson;
  static const toJsonFactory = _$SubscriptionUpdateToJson;
  Map<String, dynamic> toJson() => _$SubscriptionUpdateToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionUpdate &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.extraInfo, extraInfo) ||
                const DeepCollectionEquality()
                    .equals(other.extraInfo, extraInfo)) &&
            (identical(other.nextPay, nextPay) ||
                const DeepCollectionEquality()
                    .equals(other.nextPay, nextPay)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(cardId) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(extraInfo) ^
      const DeepCollectionEquality().hash(nextPay) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(unit) ^
      runtimeType.hashCode;
}

extension $SubscriptionUpdateExtension on SubscriptionUpdate {
  SubscriptionUpdate copyWith(
      {String? customerId,
      String? cardId,
      int? amount,
      String? currency,
      String? description,
      dynamic? extraInfo,
      String? nextPay,
      int? step,
      enums.ScheduleUnitEnum? unit}) {
    return SubscriptionUpdate(
        customerId: customerId ?? this.customerId,
        cardId: cardId ?? this.cardId,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        extraInfo: extraInfo ?? this.extraInfo,
        nextPay: nextPay ?? this.nextPay,
        step: step ?? this.step,
        unit: unit ?? this.unit);
  }
}

@JsonSerializable(explicitToJson: true)
class WebhookIn {
  WebhookIn({
    this.url,
    this.events,
  });

  factory WebhookIn.fromJson(Map<String, dynamic> json) =>
      _$WebhookInFromJson(json);

  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(
      name: 'events',
      toJson: webhookEventNameEnumListToJson,
      fromJson: webhookEventNameEnumListFromJson)
  final List<enums.WebhookEventNameEnum>? events;
  static const fromJsonFactory = _$WebhookInFromJson;
  static const toJsonFactory = _$WebhookInToJson;
  Map<String, dynamic> toJson() => _$WebhookInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WebhookIn &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(events) ^
      runtimeType.hashCode;
}

extension $WebhookInExtension on WebhookIn {
  WebhookIn copyWith({String? url, List<enums.WebhookEventNameEnum>? events}) {
    return WebhookIn(url: url ?? this.url, events: events ?? this.events);
  }
}

@JsonSerializable(explicitToJson: true)
class WebhookOut {
  WebhookOut({
    this.url,
    this.events,
    this.id,
    this.createdAt,
    this.active,
    this.key,
  });

  factory WebhookOut.fromJson(Map<String, dynamic> json) =>
      _$WebhookOutFromJson(json);

  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(
      name: 'events',
      toJson: webhookEventNameEnumListToJson,
      fromJson: webhookEventNameEnumListFromJson)
  final List<enums.WebhookEventNameEnum>? events;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'active')
  final bool? active;
  @JsonKey(name: 'key')
  final String? key;
  static const fromJsonFactory = _$WebhookOutFromJson;
  static const toJsonFactory = _$WebhookOutToJson;
  Map<String, dynamic> toJson() => _$WebhookOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WebhookOut &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(events) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(key) ^
      runtimeType.hashCode;
}

extension $WebhookOutExtension on WebhookOut {
  WebhookOut copyWith(
      {String? url,
      List<enums.WebhookEventNameEnum>? events,
      String? id,
      String? createdAt,
      bool? active,
      String? key}) {
    return WebhookOut(
        url: url ?? this.url,
        events: events ?? this.events,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        active: active ?? this.active,
        key: key ?? this.key);
  }
}

@JsonSerializable(explicitToJson: true)
class WebhookPatch {
  WebhookPatch({
    this.url,
    this.events,
  });

  factory WebhookPatch.fromJson(Map<String, dynamic> json) =>
      _$WebhookPatchFromJson(json);

  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(
      name: 'events',
      toJson: webhookEventNameEnumListToJson,
      fromJson: webhookEventNameEnumListFromJson)
  final List<enums.WebhookEventNameEnum>? events;
  static const fromJsonFactory = _$WebhookPatchFromJson;
  static const toJsonFactory = _$WebhookPatchToJson;
  Map<String, dynamic> toJson() => _$WebhookPatchToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WebhookPatch &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(events) ^
      runtimeType.hashCode;
}

extension $WebhookPatchExtension on WebhookPatch {
  WebhookPatch copyWith(
      {String? url, List<enums.WebhookEventNameEnum>? events}) {
    return WebhookPatch(url: url ?? this.url, events: events ?? this.events);
  }
}

@JsonSerializable(explicitToJson: true)
class CardIn {
  CardIn({
    this.token,
  });

  factory CardIn.fromJson(Map<String, dynamic> json) => _$CardInFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$CardInFromJson;
  static const toJsonFactory = _$CardInToJson;
  Map<String, dynamic> toJson() => _$CardInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CardIn &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^ runtimeType.hashCode;
}

extension $CardInExtension on CardIn {
  CardIn copyWith({String? token}) {
    return CardIn(token: token ?? this.token);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerIn {
  CustomerIn({
    this.externalId,
    this.email,
    this.phone,
  });

  factory CustomerIn.fromJson(Map<String, dynamic> json) =>
      _$CustomerInFromJson(json);

  @JsonKey(name: 'external_id')
  final String? externalId;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  static const fromJsonFactory = _$CustomerInFromJson;
  static const toJsonFactory = _$CustomerInToJson;
  Map<String, dynamic> toJson() => _$CustomerInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerIn &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      runtimeType.hashCode;
}

extension $CustomerInExtension on CustomerIn {
  CustomerIn copyWith({String? externalId, String? email, String? phone}) {
    return CustomerIn(
        externalId: externalId ?? this.externalId,
        email: email ?? this.email,
        phone: phone ?? this.phone);
  }
}

@JsonSerializable(explicitToJson: true)
class WebhookEvent {
  WebhookEvent({
    this.event,
    this.order,
    this.payment,
  });

  factory WebhookEvent.fromJson(Map<String, dynamic> json) =>
      _$WebhookEventFromJson(json);

  @JsonKey(
      name: 'event',
      toJson: webhookEventNameEnumToJson,
      fromJson: webhookEventNameEnumFromJson)
  final enums.WebhookEventNameEnum? event;
  @JsonKey(name: 'order')
  final WebhookOrder? order;
  @JsonKey(name: 'payment')
  final ExtendedPayment? payment;
  static const fromJsonFactory = _$WebhookEventFromJson;
  static const toJsonFactory = _$WebhookEventToJson;
  Map<String, dynamic> toJson() => _$WebhookEventToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WebhookEvent &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.payment, payment) ||
                const DeepCollectionEquality().equals(other.payment, payment)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(event) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(payment) ^
      runtimeType.hashCode;
}

extension $WebhookEventExtension on WebhookEvent {
  WebhookEvent copyWith(
      {enums.WebhookEventNameEnum? event,
      WebhookOrder? order,
      ExtendedPayment? payment}) {
    return WebhookEvent(
        event: event ?? this.event,
        order: order ?? this.order,
        payment: payment ?? this.payment);
  }
}

@JsonSerializable(explicitToJson: true)
class WebhookOrder {
  WebhookOrder({
    this.id,
    this.shopId,
    this.status,
    this.createdAt,
    this.amount,
    this.currency,
    this.captureMethod,
    this.externalId,
    this.description,
    this.extraInfo,
    this.dueDate,
  });

  factory WebhookOrder.fromJson(Map<String, dynamic> json) =>
      _$WebhookOrderFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'shop_id')
  final String? shopId;
  @JsonKey(
      name: 'status', toJson: orderStatusToJson, fromJson: orderStatusFromJson)
  final enums.OrderStatus? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(
      name: 'currency',
      toJson: currencyEnumToJson,
      fromJson: currencyEnumFromJson)
  final enums.CurrencyEnum? currency;
  @JsonKey(
      name: 'capture_method',
      toJson: captureMethodToJson,
      fromJson: captureMethodFromJson)
  final enums.CaptureMethod? captureMethod;
  @JsonKey(name: 'external_id')
  final String? externalId;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'extra_info')
  final Object? extraInfo;
  @JsonKey(name: 'due_date')
  final String? dueDate;
  static const fromJsonFactory = _$WebhookOrderFromJson;
  static const toJsonFactory = _$WebhookOrderToJson;
  Map<String, dynamic> toJson() => _$WebhookOrderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WebhookOrder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.shopId, shopId) ||
                const DeepCollectionEquality().equals(other.shopId, shopId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.captureMethod, captureMethod) ||
                const DeepCollectionEquality()
                    .equals(other.captureMethod, captureMethod)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.extraInfo, extraInfo) ||
                const DeepCollectionEquality()
                    .equals(other.extraInfo, extraInfo)) &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality().equals(other.dueDate, dueDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(shopId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(captureMethod) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(extraInfo) ^
      const DeepCollectionEquality().hash(dueDate) ^
      runtimeType.hashCode;
}

extension $WebhookOrderExtension on WebhookOrder {
  WebhookOrder copyWith(
      {String? id,
      String? shopId,
      enums.OrderStatus? status,
      String? createdAt,
      int? amount,
      enums.CurrencyEnum? currency,
      enums.CaptureMethod? captureMethod,
      String? externalId,
      String? description,
      Object? extraInfo,
      String? dueDate}) {
    return WebhookOrder(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        captureMethod: captureMethod ?? this.captureMethod,
        externalId: externalId ?? this.externalId,
        description: description ?? this.description,
        extraInfo: extraInfo ?? this.extraInfo,
        dueDate: dueDate ?? this.dueDate);
  }
}

@JsonSerializable(explicitToJson: true)
class ExtendedPayment {
  ExtendedPayment({
    this.id,
    this.orderId,
    this.status,
    this.createdAt,
    this.approvedAmount,
    this.capturedAmount,
    this.refundedAmount,
    this.processingFee,
    this.payer,
    this.error,
    this.acquirer,
    this.action,
  });

  factory ExtendedPayment.fromJson(Map<String, dynamic> json) =>
      _$ExtendedPaymentFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'order_id')
  final String? orderId;
  @JsonKey(
      name: 'status',
      toJson: paymentStatusToJson,
      fromJson: paymentStatusFromJson)
  final enums.PaymentStatus? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'approved_amount')
  final int? approvedAmount;
  @JsonKey(name: 'captured_amount')
  final int? capturedAmount;
  @JsonKey(name: 'refunded_amount')
  final int? refundedAmount;
  @JsonKey(name: 'processing_fee')
  final double? processingFee;
  @JsonKey(name: 'payer')
  final PayerOut? payer;
  @JsonKey(name: 'error')
  final PaymentError? error;
  @JsonKey(name: 'acquirer')
  final Acquirer? acquirer;
  @JsonKey(name: 'action')
  final TDSAction? action;
  static const fromJsonFactory = _$ExtendedPaymentFromJson;
  static const toJsonFactory = _$ExtendedPaymentToJson;
  Map<String, dynamic> toJson() => _$ExtendedPaymentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExtendedPayment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.approvedAmount, approvedAmount) ||
                const DeepCollectionEquality()
                    .equals(other.approvedAmount, approvedAmount)) &&
            (identical(other.capturedAmount, capturedAmount) ||
                const DeepCollectionEquality()
                    .equals(other.capturedAmount, capturedAmount)) &&
            (identical(other.refundedAmount, refundedAmount) ||
                const DeepCollectionEquality()
                    .equals(other.refundedAmount, refundedAmount)) &&
            (identical(other.processingFee, processingFee) ||
                const DeepCollectionEquality()
                    .equals(other.processingFee, processingFee)) &&
            (identical(other.payer, payer) ||
                const DeepCollectionEquality().equals(other.payer, payer)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.acquirer, acquirer) ||
                const DeepCollectionEquality()
                    .equals(other.acquirer, acquirer)) &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(approvedAmount) ^
      const DeepCollectionEquality().hash(capturedAmount) ^
      const DeepCollectionEquality().hash(refundedAmount) ^
      const DeepCollectionEquality().hash(processingFee) ^
      const DeepCollectionEquality().hash(payer) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(acquirer) ^
      const DeepCollectionEquality().hash(action) ^
      runtimeType.hashCode;
}

extension $ExtendedPaymentExtension on ExtendedPayment {
  ExtendedPayment copyWith(
      {String? id,
      String? orderId,
      enums.PaymentStatus? status,
      DateTime? createdAt,
      int? approvedAmount,
      int? capturedAmount,
      int? refundedAmount,
      double? processingFee,
      PayerOut? payer,
      PaymentError? error,
      Acquirer? acquirer,
      TDSAction? action}) {
    return ExtendedPayment(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        approvedAmount: approvedAmount ?? this.approvedAmount,
        capturedAmount: capturedAmount ?? this.capturedAmount,
        refundedAmount: refundedAmount ?? this.refundedAmount,
        processingFee: processingFee ?? this.processingFee,
        payer: payer ?? this.payer,
        error: error ?? this.error,
        acquirer: acquirer ?? this.acquirer,
        action: action ?? this.action);
  }
}

@JsonSerializable(explicitToJson: true)
class ExtendedRefund {
  ExtendedRefund({
    this.id,
    this.paymentId,
    this.orderId,
    this.status,
    this.createdAt,
    this.error,
    this.acquirer,
  });

  factory ExtendedRefund.fromJson(Map<String, dynamic> json) =>
      _$ExtendedRefundFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'payment_id')
  final String? paymentId;
  @JsonKey(name: 'order_id')
  final String? orderId;
  @JsonKey(
      name: 'status',
      toJson: refundStatusToJson,
      fromJson: refundStatusFromJson)
  final enums.RefundStatus? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'error')
  final PaymentError? error;
  @JsonKey(name: 'acquirer')
  final Acquirer? acquirer;
  static const fromJsonFactory = _$ExtendedRefundFromJson;
  static const toJsonFactory = _$ExtendedRefundToJson;
  Map<String, dynamic> toJson() => _$ExtendedRefundToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExtendedRefund &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.paymentId, paymentId) ||
                const DeepCollectionEquality()
                    .equals(other.paymentId, paymentId)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.acquirer, acquirer) ||
                const DeepCollectionEquality()
                    .equals(other.acquirer, acquirer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(paymentId) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(acquirer) ^
      runtimeType.hashCode;
}

extension $ExtendedRefundExtension on ExtendedRefund {
  ExtendedRefund copyWith(
      {String? id,
      String? paymentId,
      String? orderId,
      enums.RefundStatus? status,
      DateTime? createdAt,
      PaymentError? error,
      Acquirer? acquirer}) {
    return ExtendedRefund(
        id: id ?? this.id,
        paymentId: paymentId ?? this.paymentId,
        orderId: orderId ?? this.orderId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        error: error ?? this.error,
        acquirer: acquirer ?? this.acquirer);
  }
}

@JsonSerializable(explicitToJson: true)
class Acquirer {
  Acquirer({
    this.name,
    this.reference,
  });

  factory Acquirer.fromJson(Map<String, dynamic> json) =>
      _$AcquirerFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'reference')
  final String? reference;
  static const fromJsonFactory = _$AcquirerFromJson;
  static const toJsonFactory = _$AcquirerToJson;
  Map<String, dynamic> toJson() => _$AcquirerToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Acquirer &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.reference, reference) ||
                const DeepCollectionEquality()
                    .equals(other.reference, reference)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(reference) ^
      runtimeType.hashCode;
}

extension $AcquirerExtension on Acquirer {
  Acquirer copyWith({String? name, String? reference}) {
    return Acquirer(
        name: name ?? this.name, reference: reference ?? this.reference);
  }
}

@JsonSerializable(explicitToJson: true)
class TDSAction {
  TDSAction({
    this.url,
  });

  factory TDSAction.fromJson(Map<String, dynamic> json) =>
      _$TDSActionFromJson(json);

  @JsonKey(name: 'url')
  final String? url;
  static const fromJsonFactory = _$TDSActionFromJson;
  static const toJsonFactory = _$TDSActionToJson;
  Map<String, dynamic> toJson() => _$TDSActionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TDSAction &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(url) ^ runtimeType.hashCode;
}

extension $TDSActionExtension on TDSAction {
  TDSAction copyWith({String? url}) {
    return TDSAction(url: url ?? this.url);
  }
}

@JsonSerializable(explicitToJson: true)
class BrandOut {
  BrandOut({
    this.brand,
  });

  factory BrandOut.fromJson(Map<String, dynamic> json) =>
      _$BrandOutFromJson(json);

  @JsonKey(
      name: 'brand',
      toJson: myPaymentCardBrandToJson,
      fromJson: myPaymentCardBrandFromJson)
  final enums.MyPaymentCardBrand? brand;
  static const fromJsonFactory = _$BrandOutFromJson;
  static const toJsonFactory = _$BrandOutToJson;
  Map<String, dynamic> toJson() => _$BrandOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BrandOut &&
            (identical(other.brand, brand) ||
                const DeepCollectionEquality().equals(other.brand, brand)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(brand) ^ runtimeType.hashCode;
}

extension $BrandOutExtension on BrandOut {
  BrandOut copyWith({enums.MyPaymentCardBrand? brand}) {
    return BrandOut(brand: brand ?? this.brand);
  }
}

@JsonSerializable(explicitToJson: true)
class BinInfo {
  BinInfo({
    this.code,
    this.brand,
    this.type,
    this.emitterCode,
    this.emitterName,
  });

  factory BinInfo.fromJson(Map<String, dynamic> json) =>
      _$BinInfoFromJson(json);

  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'brand')
  final String? brand;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'emitter_code')
  final String? emitterCode;
  @JsonKey(name: 'emitter_name')
  final String? emitterName;
  static const fromJsonFactory = _$BinInfoFromJson;
  static const toJsonFactory = _$BinInfoToJson;
  Map<String, dynamic> toJson() => _$BinInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BinInfo &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.brand, brand) ||
                const DeepCollectionEquality().equals(other.brand, brand)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.emitterCode, emitterCode) ||
                const DeepCollectionEquality()
                    .equals(other.emitterCode, emitterCode)) &&
            (identical(other.emitterName, emitterName) ||
                const DeepCollectionEquality()
                    .equals(other.emitterName, emitterName)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(brand) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(emitterCode) ^
      const DeepCollectionEquality().hash(emitterName) ^
      runtimeType.hashCode;
}

extension $BinInfoExtension on BinInfo {
  BinInfo copyWith(
      {String? code,
      String? brand,
      String? type,
      String? emitterCode,
      String? emitterName}) {
    return BinInfo(
        code: code ?? this.code,
        brand: brand ?? this.brand,
        type: type ?? this.type,
        emitterCode: emitterCode ?? this.emitterCode,
        emitterName: emitterName ?? this.emitterName);
  }
}

@JsonSerializable(explicitToJson: true)
class SessionCard {
  SessionCard({
    this.token,
    this.status,
    this.card,
  });

  factory SessionCard.fromJson(Map<String, dynamic> json) =>
      _$SessionCardFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(
      name: 'status',
      toJson: masterpassCardStatusToJson,
      fromJson: masterpassCardStatusFromJson)
  final enums.MasterpassCardStatus? status;
  @JsonKey(name: 'card')
  final Card? card;
  static const fromJsonFactory = _$SessionCardFromJson;
  static const toJsonFactory = _$SessionCardToJson;
  Map<String, dynamic> toJson() => _$SessionCardToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionCard &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(card) ^
      runtimeType.hashCode;
}

extension $SessionCardExtension on SessionCard {
  SessionCard copyWith(
      {String? token, enums.MasterpassCardStatus? status, Card? card}) {
    return SessionCard(
        token: token ?? this.token,
        status: status ?? this.status,
        card: card ?? this.card);
  }
}

@JsonSerializable(explicitToJson: true)
class SessionIn {
  SessionIn({
    this.phone,
    this.fingerprint,
    this.phoneCheckDate,
    this.channel,
  });

  factory SessionIn.fromJson(Map<String, dynamic> json) =>
      _$SessionInFromJson(json);

  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'fingerprint')
  final String? fingerprint;
  @JsonKey(name: 'phone_check_date')
  final String? phoneCheckDate;
  @JsonKey(
      name: 'channel',
      toJson: masterpassChannelTypeToJson,
      fromJson: masterpassChannelTypeFromJson)
  final enums.MasterpassChannelType? channel;
  static const fromJsonFactory = _$SessionInFromJson;
  static const toJsonFactory = _$SessionInToJson;
  Map<String, dynamic> toJson() => _$SessionInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionIn &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.fingerprint, fingerprint) ||
                const DeepCollectionEquality()
                    .equals(other.fingerprint, fingerprint)) &&
            (identical(other.phoneCheckDate, phoneCheckDate) ||
                const DeepCollectionEquality()
                    .equals(other.phoneCheckDate, phoneCheckDate)) &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality().equals(other.channel, channel)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(fingerprint) ^
      const DeepCollectionEquality().hash(phoneCheckDate) ^
      const DeepCollectionEquality().hash(channel) ^
      runtimeType.hashCode;
}

extension $SessionInExtension on SessionIn {
  SessionIn copyWith(
      {String? phone,
      String? fingerprint,
      String? phoneCheckDate,
      enums.MasterpassChannelType? channel}) {
    return SessionIn(
        phone: phone ?? this.phone,
        fingerprint: fingerprint ?? this.fingerprint,
        phoneCheckDate: phoneCheckDate ?? this.phoneCheckDate,
        channel: channel ?? this.channel);
  }
}

@JsonSerializable(explicitToJson: true)
class SessionOut {
  SessionOut({
    this.session,
    this.isOtpRequired,
    this.isOtpRequiredDate,
    this.cards,
  });

  factory SessionOut.fromJson(Map<String, dynamic> json) =>
      _$SessionOutFromJson(json);

  @JsonKey(name: 'session')
  final String? session;
  @JsonKey(name: 'is_otp_required')
  final bool? isOtpRequired;
  @JsonKey(name: 'is_otp_required_date')
  final Object? isOtpRequiredDate;
  @JsonKey(name: 'cards', defaultValue: <SessionCard>[])
  final List<SessionCard>? cards;
  static const fromJsonFactory = _$SessionOutFromJson;
  static const toJsonFactory = _$SessionOutToJson;
  Map<String, dynamic> toJson() => _$SessionOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionOut &&
            (identical(other.session, session) ||
                const DeepCollectionEquality()
                    .equals(other.session, session)) &&
            (identical(other.isOtpRequired, isOtpRequired) ||
                const DeepCollectionEquality()
                    .equals(other.isOtpRequired, isOtpRequired)) &&
            (identical(other.isOtpRequiredDate, isOtpRequiredDate) ||
                const DeepCollectionEquality()
                    .equals(other.isOtpRequiredDate, isOtpRequiredDate)) &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(session) ^
      const DeepCollectionEquality().hash(isOtpRequired) ^
      const DeepCollectionEquality().hash(isOtpRequiredDate) ^
      const DeepCollectionEquality().hash(cards) ^
      runtimeType.hashCode;
}

extension $SessionOutExtension on SessionOut {
  SessionOut copyWith(
      {String? session,
      bool? isOtpRequired,
      Object? isOtpRequiredDate,
      List<SessionCard>? cards}) {
    return SessionOut(
        session: session ?? this.session,
        isOtpRequired: isOtpRequired ?? this.isOtpRequired,
        isOtpRequiredDate: isOtpRequiredDate ?? this.isOtpRequiredDate,
        cards: cards ?? this.cards);
  }
}

@JsonSerializable(explicitToJson: true)
class MasterpassCardIn {
  MasterpassCardIn({
    this.customerId,
    this.cardId,
  });

  factory MasterpassCardIn.fromJson(Map<String, dynamic> json) =>
      _$MasterpassCardInFromJson(json);

  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'card_id')
  final String? cardId;
  static const fromJsonFactory = _$MasterpassCardInFromJson;
  static const toJsonFactory = _$MasterpassCardInToJson;
  Map<String, dynamic> toJson() => _$MasterpassCardInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MasterpassCardIn &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.cardId, cardId) ||
                const DeepCollectionEquality().equals(other.cardId, cardId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(cardId) ^
      runtimeType.hashCode;
}

extension $MasterpassCardInExtension on MasterpassCardIn {
  MasterpassCardIn copyWith({String? customerId, String? cardId}) {
    return MasterpassCardIn(
        customerId: customerId ?? this.customerId,
        cardId: cardId ?? this.cardId);
  }
}

@JsonSerializable(explicitToJson: true)
class MasterpassCardOut {
  MasterpassCardOut({
    this.token,
    this.recommendation,
    this.required,
    this.card,
  });

  factory MasterpassCardOut.fromJson(Map<String, dynamic> json) =>
      _$MasterpassCardOutFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(
      name: 'recommendation',
      toJson: masterpassCardRequiredToJson,
      fromJson: masterpassCardRequiredFromJson)
  final enums.MasterpassCardRequired? recommendation;
  @JsonKey(
      name: 'required',
      toJson: masterpassCardRequiredToJson,
      fromJson: masterpassCardRequiredFromJson)
  final enums.MasterpassCardRequired? required;
  @JsonKey(name: 'card')
  final Card? card;
  static const fromJsonFactory = _$MasterpassCardOutFromJson;
  static const toJsonFactory = _$MasterpassCardOutToJson;
  Map<String, dynamic> toJson() => _$MasterpassCardOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MasterpassCardOut &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.recommendation, recommendation) ||
                const DeepCollectionEquality()
                    .equals(other.recommendation, recommendation)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(recommendation) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(card) ^
      runtimeType.hashCode;
}

extension $MasterpassCardOutExtension on MasterpassCardOut {
  MasterpassCardOut copyWith(
      {String? token,
      enums.MasterpassCardRequired? recommendation,
      enums.MasterpassCardRequired? required,
      Card? card}) {
    return MasterpassCardOut(
        token: token ?? this.token,
        recommendation: recommendation ?? this.recommendation,
        required: required ?? this.required,
        card: card ?? this.card);
  }
}

@JsonSerializable(explicitToJson: true)
class ChangePhoneIn {
  ChangePhoneIn({
    this.oldPhone,
    this.newPhone,
  });

  factory ChangePhoneIn.fromJson(Map<String, dynamic> json) =>
      _$ChangePhoneInFromJson(json);

  @JsonKey(name: 'old_phone')
  final String? oldPhone;
  @JsonKey(name: 'new_phone')
  final String? newPhone;
  static const fromJsonFactory = _$ChangePhoneInFromJson;
  static const toJsonFactory = _$ChangePhoneInToJson;
  Map<String, dynamic> toJson() => _$ChangePhoneInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangePhoneIn &&
            (identical(other.oldPhone, oldPhone) ||
                const DeepCollectionEquality()
                    .equals(other.oldPhone, oldPhone)) &&
            (identical(other.newPhone, newPhone) ||
                const DeepCollectionEquality()
                    .equals(other.newPhone, newPhone)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(oldPhone) ^
      const DeepCollectionEquality().hash(newPhone) ^
      runtimeType.hashCode;
}

extension $ChangePhoneInExtension on ChangePhoneIn {
  ChangePhoneIn copyWith({String? oldPhone, String? newPhone}) {
    return ChangePhoneIn(
        oldPhone: oldPhone ?? this.oldPhone,
        newPhone: newPhone ?? this.newPhone);
  }
}

@JsonSerializable(explicitToJson: true)
class ChangePhoneOut {
  ChangePhoneOut({
    this.phone,
  });

  factory ChangePhoneOut.fromJson(Map<String, dynamic> json) =>
      _$ChangePhoneOutFromJson(json);

  @JsonKey(name: 'phone')
  final String? phone;
  static const fromJsonFactory = _$ChangePhoneOutFromJson;
  static const toJsonFactory = _$ChangePhoneOutToJson;
  Map<String, dynamic> toJson() => _$ChangePhoneOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangePhoneOut &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phone) ^ runtimeType.hashCode;
}

extension $ChangePhoneOutExtension on ChangePhoneOut {
  ChangePhoneOut copyWith({String? phone}) {
    return ChangePhoneOut(phone: phone ?? this.phone);
  }
}

@JsonSerializable(explicitToJson: true)
class MasterpassPostbackIn {
  MasterpassPostbackIn({
    this.orderId,
    this.channel,
  });

  factory MasterpassPostbackIn.fromJson(Map<String, dynamic> json) =>
      _$MasterpassPostbackInFromJson(json);

  @JsonKey(name: 'order_id')
  final String? orderId;
  @JsonKey(
      name: 'channel',
      toJson: masterpassChannelTypeToJson,
      fromJson: masterpassChannelTypeFromJson)
  final enums.MasterpassChannelType? channel;
  static const fromJsonFactory = _$MasterpassPostbackInFromJson;
  static const toJsonFactory = _$MasterpassPostbackInToJson;
  Map<String, dynamic> toJson() => _$MasterpassPostbackInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MasterpassPostbackIn &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality().equals(other.channel, channel)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(channel) ^
      runtimeType.hashCode;
}

extension $MasterpassPostbackInExtension on MasterpassPostbackIn {
  MasterpassPostbackIn copyWith(
      {String? orderId, enums.MasterpassChannelType? channel}) {
    return MasterpassPostbackIn(
        orderId: orderId ?? this.orderId, channel: channel ?? this.channel);
  }
}

@JsonSerializable(explicitToJson: true)
class MasterpassPostbackOut {
  MasterpassPostbackOut({
    this.orderId,
    this.externalId,
    this.amount,
    this.currency,
  });

  factory MasterpassPostbackOut.fromJson(Map<String, dynamic> json) =>
      _$MasterpassPostbackOutFromJson(json);

  @JsonKey(name: 'order_id')
  final String? orderId;
  @JsonKey(name: 'external_id')
  final String? externalId;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'currency')
  final String? currency;
  static const fromJsonFactory = _$MasterpassPostbackOutFromJson;
  static const toJsonFactory = _$MasterpassPostbackOutToJson;
  Map<String, dynamic> toJson() => _$MasterpassPostbackOutToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MasterpassPostbackOut &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currency) ^
      runtimeType.hashCode;
}

extension $MasterpassPostbackOutExtension on MasterpassPostbackOut {
  MasterpassPostbackOut copyWith(
      {String? orderId, String? externalId, int? amount, String? currency}) {
    return MasterpassPostbackOut(
        orderId: orderId ?? this.orderId,
        externalId: externalId ?? this.externalId,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency);
  }
}

String? captureMethodToJson(enums.CaptureMethod? captureMethod) {
  return enums.$CaptureMethodMap[captureMethod];
}

enums.CaptureMethod captureMethodFromJson(Object? captureMethod) {
  if (captureMethod is int) {
    return enums.$CaptureMethodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == captureMethod.toString(),
            orElse: () =>
                const MapEntry(enums.CaptureMethod.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (captureMethod is String) {
    return enums.$CaptureMethodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == captureMethod.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.CaptureMethod.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.CaptureMethod.swaggerGeneratedUnknown;
}

List<String> captureMethodListToJson(List<enums.CaptureMethod>? captureMethod) {
  if (captureMethod == null) {
    return [];
  }

  return captureMethod.map((e) => enums.$CaptureMethodMap[e]!).toList();
}

List<enums.CaptureMethod> captureMethodListFromJson(List? captureMethod) {
  if (captureMethod == null) {
    return [];
  }

  return captureMethod.map((e) => captureMethodFromJson(e.toString())).toList();
}

String? currencyEnumToJson(enums.CurrencyEnum? currencyEnum) {
  return enums.$CurrencyEnumMap[currencyEnum];
}

enums.CurrencyEnum currencyEnumFromJson(Object? currencyEnum) {
  if (currencyEnum is int) {
    return enums.$CurrencyEnumMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == currencyEnum.toString(),
            orElse: () =>
                const MapEntry(enums.CurrencyEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (currencyEnum is String) {
    return enums.$CurrencyEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == currencyEnum.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.CurrencyEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.CurrencyEnum.swaggerGeneratedUnknown;
}

List<String> currencyEnumListToJson(List<enums.CurrencyEnum>? currencyEnum) {
  if (currencyEnum == null) {
    return [];
  }

  return currencyEnum.map((e) => enums.$CurrencyEnumMap[e]!).toList();
}

List<enums.CurrencyEnum> currencyEnumListFromJson(List? currencyEnum) {
  if (currencyEnum == null) {
    return [];
  }

  return currencyEnum.map((e) => currencyEnumFromJson(e.toString())).toList();
}

String? webhookEventNameEnumToJson(
    enums.WebhookEventNameEnum? webhookEventNameEnum) {
  return enums.$WebhookEventNameEnumMap[webhookEventNameEnum];
}

enums.WebhookEventNameEnum webhookEventNameEnumFromJson(
    Object? webhookEventNameEnum) {
  if (webhookEventNameEnum is int) {
    return enums.$WebhookEventNameEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == webhookEventNameEnum.toString(),
            orElse: () => const MapEntry(
                enums.WebhookEventNameEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (webhookEventNameEnum is String) {
    return enums.$WebhookEventNameEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                webhookEventNameEnum.toLowerCase(),
            orElse: () => const MapEntry(
                enums.WebhookEventNameEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.WebhookEventNameEnum.swaggerGeneratedUnknown;
}

List<String> webhookEventNameEnumListToJson(
    List<enums.WebhookEventNameEnum>? webhookEventNameEnum) {
  if (webhookEventNameEnum == null) {
    return [];
  }

  return webhookEventNameEnum
      .map((e) => enums.$WebhookEventNameEnumMap[e]!)
      .toList();
}

List<enums.WebhookEventNameEnum> webhookEventNameEnumListFromJson(
    List? webhookEventNameEnum) {
  if (webhookEventNameEnum == null) {
    return [];
  }

  return webhookEventNameEnum
      .map((e) => webhookEventNameEnumFromJson(e.toString()))
      .toList();
}

String? eventNameEnumToJson(enums.EventNameEnum? eventNameEnum) {
  return enums.$EventNameEnumMap[eventNameEnum];
}

enums.EventNameEnum eventNameEnumFromJson(Object? eventNameEnum) {
  if (eventNameEnum is int) {
    return enums.$EventNameEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == eventNameEnum.toString(),
            orElse: () =>
                const MapEntry(enums.EventNameEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (eventNameEnum is String) {
    return enums.$EventNameEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == eventNameEnum.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.EventNameEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.EventNameEnum.swaggerGeneratedUnknown;
}

List<String> eventNameEnumListToJson(List<enums.EventNameEnum>? eventNameEnum) {
  if (eventNameEnum == null) {
    return [];
  }

  return eventNameEnum.map((e) => enums.$EventNameEnumMap[e]!).toList();
}

List<enums.EventNameEnum> eventNameEnumListFromJson(List? eventNameEnum) {
  if (eventNameEnum == null) {
    return [];
  }

  return eventNameEnum.map((e) => eventNameEnumFromJson(e.toString())).toList();
}

String? customerEventNameEnumToJson(
    enums.CustomerEventNameEnum? customerEventNameEnum) {
  return enums.$CustomerEventNameEnumMap[customerEventNameEnum];
}

enums.CustomerEventNameEnum customerEventNameEnumFromJson(
    Object? customerEventNameEnum) {
  if (customerEventNameEnum is int) {
    return enums.$CustomerEventNameEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == customerEventNameEnum.toString(),
            orElse: () => const MapEntry(
                enums.CustomerEventNameEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (customerEventNameEnum is String) {
    return enums.$CustomerEventNameEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                customerEventNameEnum.toLowerCase(),
            orElse: () => const MapEntry(
                enums.CustomerEventNameEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.CustomerEventNameEnum.swaggerGeneratedUnknown;
}

List<String> customerEventNameEnumListToJson(
    List<enums.CustomerEventNameEnum>? customerEventNameEnum) {
  if (customerEventNameEnum == null) {
    return [];
  }

  return customerEventNameEnum
      .map((e) => enums.$CustomerEventNameEnumMap[e]!)
      .toList();
}

List<enums.CustomerEventNameEnum> customerEventNameEnumListFromJson(
    List? customerEventNameEnum) {
  if (customerEventNameEnum == null) {
    return [];
  }

  return customerEventNameEnum
      .map((e) => customerEventNameEnumFromJson(e.toString()))
      .toList();
}

String? orderStatusToJson(enums.OrderStatus? orderStatus) {
  return enums.$OrderStatusMap[orderStatus];
}

enums.OrderStatus orderStatusFromJson(Object? orderStatus) {
  if (orderStatus is int) {
    return enums.$OrderStatusMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == orderStatus.toString(),
            orElse: () =>
                const MapEntry(enums.OrderStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (orderStatus is String) {
    return enums.$OrderStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == orderStatus.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.OrderStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.OrderStatus.swaggerGeneratedUnknown;
}

List<String> orderStatusListToJson(List<enums.OrderStatus>? orderStatus) {
  if (orderStatus == null) {
    return [];
  }

  return orderStatus.map((e) => enums.$OrderStatusMap[e]!).toList();
}

List<enums.OrderStatus> orderStatusListFromJson(List? orderStatus) {
  if (orderStatus == null) {
    return [];
  }

  return orderStatus.map((e) => orderStatusFromJson(e.toString())).toList();
}

String? customerStatusToJson(enums.CustomerStatus? customerStatus) {
  return enums.$CustomerStatusMap[customerStatus];
}

enums.CustomerStatus customerStatusFromJson(Object? customerStatus) {
  if (customerStatus is int) {
    return enums.$CustomerStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == customerStatus.toString(),
            orElse: () => const MapEntry(
                enums.CustomerStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (customerStatus is String) {
    return enums.$CustomerStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == customerStatus.toLowerCase(),
            orElse: () => const MapEntry(
                enums.CustomerStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.CustomerStatus.swaggerGeneratedUnknown;
}

List<String> customerStatusListToJson(
    List<enums.CustomerStatus>? customerStatus) {
  if (customerStatus == null) {
    return [];
  }

  return customerStatus.map((e) => enums.$CustomerStatusMap[e]!).toList();
}

List<enums.CustomerStatus> customerStatusListFromJson(List? customerStatus) {
  if (customerStatus == null) {
    return [];
  }

  return customerStatus
      .map((e) => customerStatusFromJson(e.toString()))
      .toList();
}

String? payerTypeToJson(enums.PayerType? payerType) {
  return enums.$PayerTypeMap[payerType];
}

enums.PayerType payerTypeFromJson(Object? payerType) {
  if (payerType is int) {
    return enums.$PayerTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == payerType.toString(),
            orElse: () =>
                const MapEntry(enums.PayerType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (payerType is String) {
    return enums.$PayerTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == payerType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.PayerType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.PayerType.swaggerGeneratedUnknown;
}

List<String> payerTypeListToJson(List<enums.PayerType>? payerType) {
  if (payerType == null) {
    return [];
  }

  return payerType.map((e) => enums.$PayerTypeMap[e]!).toList();
}

List<enums.PayerType> payerTypeListFromJson(List? payerType) {
  if (payerType == null) {
    return [];
  }

  return payerType.map((e) => payerTypeFromJson(e.toString())).toList();
}

String? paymentToolTypeToJson(enums.PaymentToolType? paymentToolType) {
  return enums.$PaymentToolTypeMap[paymentToolType];
}

enums.PaymentToolType paymentToolTypeFromJson(Object? paymentToolType) {
  if (paymentToolType is int) {
    return enums.$PaymentToolTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == paymentToolType.toString(),
            orElse: () => const MapEntry(
                enums.PaymentToolType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (paymentToolType is String) {
    return enums.$PaymentToolTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == paymentToolType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.PaymentToolType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.PaymentToolType.swaggerGeneratedUnknown;
}

List<String> paymentToolTypeListToJson(
    List<enums.PaymentToolType>? paymentToolType) {
  if (paymentToolType == null) {
    return [];
  }

  return paymentToolType.map((e) => enums.$PaymentToolTypeMap[e]!).toList();
}

List<enums.PaymentToolType> paymentToolTypeListFromJson(List? paymentToolType) {
  if (paymentToolType == null) {
    return [];
  }

  return paymentToolType
      .map((e) => paymentToolTypeFromJson(e.toString()))
      .toList();
}

String? paymentStatusToJson(enums.PaymentStatus? paymentStatus) {
  return enums.$PaymentStatusMap[paymentStatus];
}

enums.PaymentStatus paymentStatusFromJson(Object? paymentStatus) {
  if (paymentStatus is int) {
    return enums.$PaymentStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == paymentStatus.toString(),
            orElse: () =>
                const MapEntry(enums.PaymentStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (paymentStatus is String) {
    return enums.$PaymentStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == paymentStatus.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.PaymentStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.PaymentStatus.swaggerGeneratedUnknown;
}

List<String> paymentStatusListToJson(List<enums.PaymentStatus>? paymentStatus) {
  if (paymentStatus == null) {
    return [];
  }

  return paymentStatus.map((e) => enums.$PaymentStatusMap[e]!).toList();
}

List<enums.PaymentStatus> paymentStatusListFromJson(List? paymentStatus) {
  if (paymentStatus == null) {
    return [];
  }

  return paymentStatus.map((e) => paymentStatusFromJson(e.toString())).toList();
}

String? refundStatusToJson(enums.RefundStatus? refundStatus) {
  return enums.$RefundStatusMap[refundStatus];
}

enums.RefundStatus refundStatusFromJson(Object? refundStatus) {
  if (refundStatus is int) {
    return enums.$RefundStatusMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == refundStatus.toString(),
            orElse: () =>
                const MapEntry(enums.RefundStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (refundStatus is String) {
    return enums.$RefundStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == refundStatus.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.RefundStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.RefundStatus.swaggerGeneratedUnknown;
}

List<String> refundStatusListToJson(List<enums.RefundStatus>? refundStatus) {
  if (refundStatus == null) {
    return [];
  }

  return refundStatus.map((e) => enums.$RefundStatusMap[e]!).toList();
}

List<enums.RefundStatus> refundStatusListFromJson(List? refundStatus) {
  if (refundStatus == null) {
    return [];
  }

  return refundStatus.map((e) => refundStatusFromJson(e.toString())).toList();
}

String? scheduleStatusEnumToJson(enums.ScheduleStatusEnum? scheduleStatusEnum) {
  return enums.$ScheduleStatusEnumMap[scheduleStatusEnum];
}

enums.ScheduleStatusEnum scheduleStatusEnumFromJson(
    Object? scheduleStatusEnum) {
  if (scheduleStatusEnum is int) {
    return enums.$ScheduleStatusEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == scheduleStatusEnum.toString(),
            orElse: () => const MapEntry(
                enums.ScheduleStatusEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (scheduleStatusEnum is String) {
    return enums.$ScheduleStatusEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == scheduleStatusEnum.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ScheduleStatusEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ScheduleStatusEnum.swaggerGeneratedUnknown;
}

List<String> scheduleStatusEnumListToJson(
    List<enums.ScheduleStatusEnum>? scheduleStatusEnum) {
  if (scheduleStatusEnum == null) {
    return [];
  }

  return scheduleStatusEnum
      .map((e) => enums.$ScheduleStatusEnumMap[e]!)
      .toList();
}

List<enums.ScheduleStatusEnum> scheduleStatusEnumListFromJson(
    List? scheduleStatusEnum) {
  if (scheduleStatusEnum == null) {
    return [];
  }

  return scheduleStatusEnum
      .map((e) => scheduleStatusEnumFromJson(e.toString()))
      .toList();
}

String? scheduleUnitEnumToJson(enums.ScheduleUnitEnum? scheduleUnitEnum) {
  return enums.$ScheduleUnitEnumMap[scheduleUnitEnum];
}

enums.ScheduleUnitEnum scheduleUnitEnumFromJson(Object? scheduleUnitEnum) {
  if (scheduleUnitEnum is int) {
    return enums.$ScheduleUnitEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == scheduleUnitEnum.toString(),
            orElse: () => const MapEntry(
                enums.ScheduleUnitEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (scheduleUnitEnum is String) {
    return enums.$ScheduleUnitEnumMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == scheduleUnitEnum.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ScheduleUnitEnum.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ScheduleUnitEnum.swaggerGeneratedUnknown;
}

List<String> scheduleUnitEnumListToJson(
    List<enums.ScheduleUnitEnum>? scheduleUnitEnum) {
  if (scheduleUnitEnum == null) {
    return [];
  }

  return scheduleUnitEnum.map((e) => enums.$ScheduleUnitEnumMap[e]!).toList();
}

List<enums.ScheduleUnitEnum> scheduleUnitEnumListFromJson(
    List? scheduleUnitEnum) {
  if (scheduleUnitEnum == null) {
    return [];
  }

  return scheduleUnitEnum
      .map((e) => scheduleUnitEnumFromJson(e.toString()))
      .toList();
}

String? cardStatusToJson(enums.CardStatus? cardStatus) {
  return enums.$CardStatusMap[cardStatus];
}

enums.CardStatus cardStatusFromJson(Object? cardStatus) {
  if (cardStatus is int) {
    return enums.$CardStatusMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == cardStatus.toString(),
            orElse: () =>
                const MapEntry(enums.CardStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (cardStatus is String) {
    return enums.$CardStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == cardStatus.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.CardStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.CardStatus.swaggerGeneratedUnknown;
}

List<String> cardStatusListToJson(List<enums.CardStatus>? cardStatus) {
  if (cardStatus == null) {
    return [];
  }

  return cardStatus.map((e) => enums.$CardStatusMap[e]!).toList();
}

List<enums.CardStatus> cardStatusListFromJson(List? cardStatus) {
  if (cardStatus == null) {
    return [];
  }

  return cardStatus.map((e) => cardStatusFromJson(e.toString())).toList();
}

String? masterpassCardStatusToJson(
    enums.MasterpassCardStatus? masterpassCardStatus) {
  return enums.$MasterpassCardStatusMap[masterpassCardStatus];
}

enums.MasterpassCardStatus masterpassCardStatusFromJson(
    Object? masterpassCardStatus) {
  if (masterpassCardStatus is int) {
    return enums.$MasterpassCardStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == masterpassCardStatus.toString(),
            orElse: () => const MapEntry(
                enums.MasterpassCardStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (masterpassCardStatus is String) {
    return enums.$MasterpassCardStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                masterpassCardStatus.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MasterpassCardStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MasterpassCardStatus.swaggerGeneratedUnknown;
}

List<String> masterpassCardStatusListToJson(
    List<enums.MasterpassCardStatus>? masterpassCardStatus) {
  if (masterpassCardStatus == null) {
    return [];
  }

  return masterpassCardStatus
      .map((e) => enums.$MasterpassCardStatusMap[e]!)
      .toList();
}

List<enums.MasterpassCardStatus> masterpassCardStatusListFromJson(
    List? masterpassCardStatus) {
  if (masterpassCardStatus == null) {
    return [];
  }

  return masterpassCardStatus
      .map((e) => masterpassCardStatusFromJson(e.toString()))
      .toList();
}

String? masterpassChannelTypeToJson(
    enums.MasterpassChannelType? masterpassChannelType) {
  return enums.$MasterpassChannelTypeMap[masterpassChannelType];
}

enums.MasterpassChannelType masterpassChannelTypeFromJson(
    Object? masterpassChannelType) {
  if (masterpassChannelType is int) {
    return enums.$MasterpassChannelTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == masterpassChannelType.toString(),
            orElse: () => const MapEntry(
                enums.MasterpassChannelType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (masterpassChannelType is String) {
    return enums.$MasterpassChannelTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                masterpassChannelType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MasterpassChannelType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MasterpassChannelType.swaggerGeneratedUnknown;
}

List<String> masterpassChannelTypeListToJson(
    List<enums.MasterpassChannelType>? masterpassChannelType) {
  if (masterpassChannelType == null) {
    return [];
  }

  return masterpassChannelType
      .map((e) => enums.$MasterpassChannelTypeMap[e]!)
      .toList();
}

List<enums.MasterpassChannelType> masterpassChannelTypeListFromJson(
    List? masterpassChannelType) {
  if (masterpassChannelType == null) {
    return [];
  }

  return masterpassChannelType
      .map((e) => masterpassChannelTypeFromJson(e.toString()))
      .toList();
}

String? masterpassCardRequiredToJson(
    enums.MasterpassCardRequired? masterpassCardRequired) {
  return enums.$MasterpassCardRequiredMap[masterpassCardRequired];
}

enums.MasterpassCardRequired masterpassCardRequiredFromJson(
    Object? masterpassCardRequired) {
  if (masterpassCardRequired is int) {
    return enums.$MasterpassCardRequiredMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                masterpassCardRequired.toString(),
            orElse: () => const MapEntry(
                enums.MasterpassCardRequired.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (masterpassCardRequired is String) {
    return enums.$MasterpassCardRequiredMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                masterpassCardRequired.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MasterpassCardRequired.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MasterpassCardRequired.swaggerGeneratedUnknown;
}

List<String> masterpassCardRequiredListToJson(
    List<enums.MasterpassCardRequired>? masterpassCardRequired) {
  if (masterpassCardRequired == null) {
    return [];
  }

  return masterpassCardRequired
      .map((e) => enums.$MasterpassCardRequiredMap[e]!)
      .toList();
}

List<enums.MasterpassCardRequired> masterpassCardRequiredListFromJson(
    List? masterpassCardRequired) {
  if (masterpassCardRequired == null) {
    return [];
  }

  return masterpassCardRequired
      .map((e) => masterpassCardRequiredFromJson(e.toString()))
      .toList();
}

String? masterpassUserStatusToJson(
    enums.MasterpassUserStatus? masterpassUserStatus) {
  return enums.$MasterpassUserStatusMap[masterpassUserStatus];
}

enums.MasterpassUserStatus masterpassUserStatusFromJson(
    Object? masterpassUserStatus) {
  if (masterpassUserStatus is int) {
    return enums.$MasterpassUserStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == masterpassUserStatus.toString(),
            orElse: () => const MapEntry(
                enums.MasterpassUserStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (masterpassUserStatus is String) {
    return enums.$MasterpassUserStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                masterpassUserStatus.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MasterpassUserStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MasterpassUserStatus.swaggerGeneratedUnknown;
}

List<String> masterpassUserStatusListToJson(
    List<enums.MasterpassUserStatus>? masterpassUserStatus) {
  if (masterpassUserStatus == null) {
    return [];
  }

  return masterpassUserStatus
      .map((e) => enums.$MasterpassUserStatusMap[e]!)
      .toList();
}

List<enums.MasterpassUserStatus> masterpassUserStatusListFromJson(
    List? masterpassUserStatus) {
  if (masterpassUserStatus == null) {
    return [];
  }

  return masterpassUserStatus
      .map((e) => masterpassUserStatusFromJson(e.toString()))
      .toList();
}

String? masterpassFingerprintStatusToJson(
    enums.MasterpassFingerprintStatus? masterpassFingerprintStatus) {
  return enums.$MasterpassFingerprintStatusMap[masterpassFingerprintStatus];
}

enums.MasterpassFingerprintStatus masterpassFingerprintStatusFromJson(
    Object? masterpassFingerprintStatus) {
  if (masterpassFingerprintStatus is int) {
    return enums.$MasterpassFingerprintStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                masterpassFingerprintStatus.toString(),
            orElse: () => const MapEntry(
                enums.MasterpassFingerprintStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (masterpassFingerprintStatus is String) {
    return enums.$MasterpassFingerprintStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                masterpassFingerprintStatus.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MasterpassFingerprintStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MasterpassFingerprintStatus.swaggerGeneratedUnknown;
}

List<String> masterpassFingerprintStatusListToJson(
    List<enums.MasterpassFingerprintStatus>? masterpassFingerprintStatus) {
  if (masterpassFingerprintStatus == null) {
    return [];
  }

  return masterpassFingerprintStatus
      .map((e) => enums.$MasterpassFingerprintStatusMap[e]!)
      .toList();
}

List<enums.MasterpassFingerprintStatus> masterpassFingerprintStatusListFromJson(
    List? masterpassFingerprintStatus) {
  if (masterpassFingerprintStatus == null) {
    return [];
  }

  return masterpassFingerprintStatus
      .map((e) => masterpassFingerprintStatusFromJson(e.toString()))
      .toList();
}

String? amountCategoryToJson(enums.AmountCategory? amountCategory) {
  return enums.$AmountCategoryMap[amountCategory];
}

enums.AmountCategory amountCategoryFromJson(Object? amountCategory) {
  if (amountCategory is int) {
    return enums.$AmountCategoryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == amountCategory.toString(),
            orElse: () => const MapEntry(
                enums.AmountCategory.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (amountCategory is String) {
    return enums.$AmountCategoryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == amountCategory.toLowerCase(),
            orElse: () => const MapEntry(
                enums.AmountCategory.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.AmountCategory.swaggerGeneratedUnknown;
}

List<String> amountCategoryListToJson(
    List<enums.AmountCategory>? amountCategory) {
  if (amountCategory == null) {
    return [];
  }

  return amountCategory.map((e) => enums.$AmountCategoryMap[e]!).toList();
}

List<enums.AmountCategory> amountCategoryListFromJson(List? amountCategory) {
  if (amountCategory == null) {
    return [];
  }

  return amountCategory
      .map((e) => amountCategoryFromJson(e.toString()))
      .toList();
}

String? dateCategoryToJson(enums.DateCategory? dateCategory) {
  return enums.$DateCategoryMap[dateCategory];
}

enums.DateCategory dateCategoryFromJson(Object? dateCategory) {
  if (dateCategory is int) {
    return enums.$DateCategoryMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == dateCategory.toString(),
            orElse: () =>
                const MapEntry(enums.DateCategory.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (dateCategory is String) {
    return enums.$DateCategoryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == dateCategory.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.DateCategory.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.DateCategory.swaggerGeneratedUnknown;
}

List<String> dateCategoryListToJson(List<enums.DateCategory>? dateCategory) {
  if (dateCategory == null) {
    return [];
  }

  return dateCategory.map((e) => enums.$DateCategoryMap[e]!).toList();
}

List<enums.DateCategory> dateCategoryListFromJson(List? dateCategory) {
  if (dateCategory == null) {
    return [];
  }

  return dateCategory.map((e) => dateCategoryFromJson(e.toString())).toList();
}

String? myPaymentCardBrandToJson(enums.MyPaymentCardBrand? myPaymentCardBrand) {
  return enums.$MyPaymentCardBrandMap[myPaymentCardBrand];
}

enums.MyPaymentCardBrand myPaymentCardBrandFromJson(
    Object? myPaymentCardBrand) {
  if (myPaymentCardBrand is int) {
    return enums.$MyPaymentCardBrandMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == myPaymentCardBrand.toString(),
            orElse: () => const MapEntry(
                enums.MyPaymentCardBrand.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (myPaymentCardBrand is String) {
    return enums.$MyPaymentCardBrandMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == myPaymentCardBrand.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MyPaymentCardBrand.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MyPaymentCardBrand.swaggerGeneratedUnknown;
}

List<String> myPaymentCardBrandListToJson(
    List<enums.MyPaymentCardBrand>? myPaymentCardBrand) {
  if (myPaymentCardBrand == null) {
    return [];
  }

  return myPaymentCardBrand
      .map((e) => enums.$MyPaymentCardBrandMap[e]!)
      .toList();
}

List<enums.MyPaymentCardBrand> myPaymentCardBrandListFromJson(
    List? myPaymentCardBrand) {
  if (myPaymentCardBrand == null) {
    return [];
  }

  return myPaymentCardBrand
      .map((e) => myPaymentCardBrandFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
