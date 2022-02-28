// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ioka_api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) =>
    ValidationError(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ValidationErrorToJson(ValidationError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

CardPayer _$CardPayerFromJson(Map<String, dynamic> json) => CardPayer(
      pan: json['pan'] as String?,
      exp: json['exp'] as String?,
      cvc: json['cvc'] as String?,
      holder: json['holder'] as String?,
      save: json['save'] as bool? ?? false,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      cardId: json['card_id'] as String?,
    );

Map<String, dynamic> _$CardPayerToJson(CardPayer instance) => <String, dynamic>{
      'pan': instance.pan,
      'exp': instance.exp,
      'cvc': instance.cvc,
      'holder': instance.holder,
      'save': instance.save,
      'email': instance.email,
      'phone': instance.phone,
      'card_id': instance.cardId,
    };

Contacts _$ContactsFromJson(Map<String, dynamic> json) => Contacts(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
    };

OrderEventOut _$OrderEventOutFromJson(Map<String, dynamic> json) =>
    OrderEventOut(
      id: json['id'] as String?,
      name: eventNameEnumFromJson(json['name']),
      createdAt: json['created_at'] as String?,
      orderId: json['order_id'] as String?,
      paymentId: json['payment_id'] as String?,
      refundId: json['refund_id'] as String?,
      md: json['md'] as String?,
      paReq: json['pa_req'] as String?,
      acsUrl: json['acs_url'] as String?,
      termUrl: json['term_url'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OrderEventOutToJson(OrderEventOut instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': eventNameEnumToJson(instance.name),
      'created_at': instance.createdAt,
      'order_id': instance.orderId,
      'payment_id': instance.paymentId,
      'refund_id': instance.refundId,
      'md': instance.md,
      'pa_req': instance.paReq,
      'acs_url': instance.acsUrl,
      'term_url': instance.termUrl,
      'code': instance.code,
      'message': instance.message,
    };

CustomerEventOut _$CustomerEventOutFromJson(Map<String, dynamic> json) =>
    CustomerEventOut(
      id: json['id'] as String?,
      name: customerEventNameEnumFromJson(json['name']),
      createdAt: json['created_at'] as String?,
      customerId: json['customer_id'] as String?,
      cardId: json['card_id'] as String?,
      md: json['md'] as String?,
      paReq: json['pa_req'] as String?,
      acsUrl: json['acs_url'] as String?,
      termUrl: json['term_url'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CustomerEventOutToJson(CustomerEventOut instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': customerEventNameEnumToJson(instance.name),
      'created_at': instance.createdAt,
      'customer_id': instance.customerId,
      'card_id': instance.cardId,
      'md': instance.md,
      'pa_req': instance.paReq,
      'acs_url': instance.acsUrl,
      'term_url': instance.termUrl,
      'code': instance.code,
      'message': instance.message,
    };

OrderIn _$OrderInFromJson(Map<String, dynamic> json) => OrderIn(
      amount: json['amount'] as int?,
      currency: currencyEnumFromJson(json['currency']),
      captureMethod: captureMethodFromJson(json['capture_method']),
      externalId: json['external_id'] as String?,
      description: json['description'] as String?,
      extraInfo: json['extra_info'],
      attempts: json['attempts'] as int?,
      dueDate: json['due_date'] as String?,
      customerId: json['customer_id'] as String?,
      cardId: json['card_id'] as String?,
      backUrl: json['back_url'] as String?,
      successUrl: json['success_url'] as String?,
      failureUrl: json['failure_url'] as String?,
      template: json['template'] as String?,
    );

Map<String, dynamic> _$OrderInToJson(OrderIn instance) => <String, dynamic>{
      'amount': instance.amount,
      'currency': currencyEnumToJson(instance.currency),
      'capture_method': captureMethodToJson(instance.captureMethod),
      'external_id': instance.externalId,
      'description': instance.description,
      'extra_info': instance.extraInfo,
      'attempts': instance.attempts,
      'due_date': instance.dueDate,
      'customer_id': instance.customerId,
      'card_id': instance.cardId,
      'back_url': instance.backUrl,
      'success_url': instance.successUrl,
      'failure_url': instance.failureUrl,
      'template': instance.template,
    };

OrderOut _$OrderOutFromJson(Map<String, dynamic> json) => OrderOut(
      id: json['id'] as String?,
      status: orderStatusFromJson(json['status']),
      createdAt: json['created_at'] as String?,
      amount: json['amount'] as int?,
      currency: currencyEnumFromJson(json['currency']),
      captureMethod: captureMethodFromJson(json['capture_method']),
      externalId: json['external_id'] as String?,
      description: json['description'] as String?,
      extraInfo: json['extra_info'],
      attempts: json['attempts'] as int?,
      dueDate: json['due_date'] as String?,
      customerId: json['customer_id'] as String?,
      cardId: json['card_id'] as String?,
      backUrl: json['back_url'] as String?,
      successUrl: json['success_url'] as String?,
      failureUrl: json['failure_url'] as String?,
      template: json['template'] as String?,
      checkoutUrl: json['checkout_url'] as String?,
    );

Map<String, dynamic> _$OrderOutToJson(OrderOut instance) => <String, dynamic>{
      'id': instance.id,
      'status': orderStatusToJson(instance.status),
      'created_at': instance.createdAt,
      'amount': instance.amount,
      'currency': currencyEnumToJson(instance.currency),
      'capture_method': captureMethodToJson(instance.captureMethod),
      'external_id': instance.externalId,
      'description': instance.description,
      'extra_info': instance.extraInfo,
      'attempts': instance.attempts,
      'due_date': instance.dueDate,
      'customer_id': instance.customerId,
      'card_id': instance.cardId,
      'back_url': instance.backUrl,
      'success_url': instance.successUrl,
      'failure_url': instance.failureUrl,
      'template': instance.template,
      'checkout_url': instance.checkoutUrl,
    };

CustomerAndAccessToken _$CustomerAndAccessTokenFromJson(
        Map<String, dynamic> json) =>
    CustomerAndAccessToken(
      customer: json['customer'] == null
          ? null
          : ExtendedCustomer.fromJson(json['customer'] as Map<String, dynamic>),
      customerAccessToken: json['customer_access_token'] as String?,
    );

Map<String, dynamic> _$CustomerAndAccessTokenToJson(
        CustomerAndAccessToken instance) =>
    <String, dynamic>{
      'customer': instance.customer?.toJson(),
      'customer_access_token': instance.customerAccessToken,
    };

OrderAndAccessToken _$OrderAndAccessTokenFromJson(Map<String, dynamic> json) =>
    OrderAndAccessToken(
      order: json['order'] == null
          ? null
          : OrderOut.fromJson(json['order'] as Map<String, dynamic>),
      orderAccessToken: json['order_access_token'] as String?,
    );

Map<String, dynamic> _$OrderAndAccessTokenToJson(
        OrderAndAccessToken instance) =>
    <String, dynamic>{
      'order': instance.order?.toJson(),
      'order_access_token': instance.orderAccessToken,
    };

PaginatedOrderOut _$PaginatedOrderOutFromJson(Map<String, dynamic> json) =>
    PaginatedOrderOut(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => OrderOut.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedOrderOutToJson(PaginatedOrderOut instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

PaginatedPaymentOut _$PaginatedPaymentOutFromJson(Map<String, dynamic> json) =>
    PaginatedPaymentOut(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => PaymentOut.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedPaymentOutToJson(
        PaginatedPaymentOut instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

PaginatedRefundOut _$PaginatedRefundOutFromJson(Map<String, dynamic> json) =>
    PaginatedRefundOut(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => RefundOut.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedRefundOutToJson(PaginatedRefundOut instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

PayerOut _$PayerOutFromJson(Map<String, dynamic> json) => PayerOut(
      panMasked: json['pan_masked'] as String?,
      expiryDate: json['expiry_date'] as String?,
      holder: json['holder'] as String?,
      paymentSystem: json['payment_system'] as String?,
      emitter: json['emitter'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      customerId: json['customer_id'] as String?,
      cardId: json['card_id'] as String?,
    );

Map<String, dynamic> _$PayerOutToJson(PayerOut instance) => <String, dynamic>{
      'pan_masked': instance.panMasked,
      'expiry_date': instance.expiryDate,
      'holder': instance.holder,
      'payment_system': instance.paymentSystem,
      'emitter': instance.emitter,
      'email': instance.email,
      'phone': instance.phone,
      'customer_id': instance.customerId,
      'card_id': instance.cardId,
    };

PaymentCancel _$PaymentCancelFromJson(Map<String, dynamic> json) =>
    PaymentCancel(
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$PaymentCancelToJson(PaymentCancel instance) =>
    <String, dynamic>{
      'reason': instance.reason,
    };

PaymentCapture _$PaymentCaptureFromJson(Map<String, dynamic> json) =>
    PaymentCapture(
      amount: json['amount'] as int?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$PaymentCaptureToJson(PaymentCapture instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'reason': instance.reason,
    };

PaymentError _$PaymentErrorFromJson(Map<String, dynamic> json) => PaymentError(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PaymentErrorToJson(PaymentError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

PaymentIn _$PaymentInFromJson(Map<String, dynamic> json) => PaymentIn(
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      customerCard: json['customer_card'] == null
          ? null
          : CustomerCard.fromJson(
              json['customer_card'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      contacts: json['contacts'] == null
          ? null
          : Contacts.fromJson(json['contacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentInToJson(PaymentIn instance) => <String, dynamic>{
      'payment_method': instance.paymentMethod?.toJson(),
      'customer_card': instance.customerCard?.toJson(),
      'card': instance.card?.toJson(),
      'contacts': instance.contacts?.toJson(),
    };

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      token: json['token'] as String?,
      saveCard: json['save_card'] as bool? ?? false,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'token': instance.token,
      'save_card': instance.saveCard,
    };

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      panMasked: json['pan_masked'] as String?,
      expiryDate: json['expiry_date'] as String?,
      holder: json['holder'] as String?,
      paymentSystem: json['payment_system'] as String?,
      emitter: json['emitter'] as String?,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'pan_masked': instance.panMasked,
      'expiry_date': instance.expiryDate,
      'holder': instance.holder,
      'payment_system': instance.paymentSystem,
      'emitter': instance.emitter,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      ip: json['ip'] as String?,
      fingerprint: json['fingerprint'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'ip': instance.ip,
      'fingerprint': instance.fingerprint,
    };

ApplePayIn _$ApplePayInFromJson(Map<String, dynamic> json) => ApplePayIn(
      url: json['url'] as String?,
      platform: json['platform'] as String?,
      domainName: json['domain_name'] as String?,
    );

Map<String, dynamic> _$ApplePayInToJson(ApplePayIn instance) =>
    <String, dynamic>{
      'url': instance.url,
      'platform': instance.platform,
      'domain_name': instance.domainName,
    };

ApplePayOut _$ApplePayOutFromJson(Map<String, dynamic> json) => ApplePayOut(
      epochTimestamp: json['epochTimestamp'] as int?,
      expiresAt: json['expiresAt'] as int?,
      merchantSessionIdentifier: json['merchantSessionIdentifier'] as String?,
      nonce: json['nonce'] as String?,
      merchantIdentifier: json['merchantIdentifier'] as String?,
      domainName: json['domainName'] as String?,
      displayName: json['displayName'] as String?,
      signature: json['signature'] as String?,
      operationalAnalyticsIdentifier:
          json['operationalAnalyticsIdentifier'] as String?,
      retries: json['retries'] as int?,
    );

Map<String, dynamic> _$ApplePayOutToJson(ApplePayOut instance) =>
    <String, dynamic>{
      'epochTimestamp': instance.epochTimestamp,
      'expiresAt': instance.expiresAt,
      'merchantSessionIdentifier': instance.merchantSessionIdentifier,
      'nonce': instance.nonce,
      'merchantIdentifier': instance.merchantIdentifier,
      'domainName': instance.domainName,
      'displayName': instance.displayName,
      'signature': instance.signature,
      'operationalAnalyticsIdentifier': instance.operationalAnalyticsIdentifier,
      'retries': instance.retries,
    };

PaymentMethodIn _$PaymentMethodInFromJson(Map<String, dynamic> json) =>
    PaymentMethodIn(
      paymentTool: json['payment_tool'] == null
          ? null
          : PaymentTool.fromJson(json['payment_tool'] as Map<String, dynamic>),
      $client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentMethodInToJson(PaymentMethodIn instance) =>
    <String, dynamic>{
      'payment_tool': instance.paymentTool?.toJson(),
      'client': instance.$client?.toJson(),
    };

PaymentMethodOut _$PaymentMethodOutFromJson(Map<String, dynamic> json) =>
    PaymentMethodOut(
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      session: json['session'] as String?,
      token: json['token'] as String?,
      expiresAt: json['expires_at'] as String?,
    );

Map<String, dynamic> _$PaymentMethodOutToJson(PaymentMethodOut instance) =>
    <String, dynamic>{
      'card': instance.card?.toJson(),
      'session': instance.session,
      'token': instance.token,
      'expires_at': instance.expiresAt,
    };

PaymentTool _$PaymentToolFromJson(Map<String, dynamic> json) => PaymentTool(
      type: paymentToolTypeFromJson(json['type']),
      pan: json['pan'] as String?,
      expiryDate: json['expiry_date'] as String?,
      cvc: json['cvc'] as String?,
      holder: json['holder'] as String?,
      applePay: json['apple_pay'] == null
          ? null
          : ApplePayData.fromJson(json['apple_pay'] as Map<String, dynamic>),
      googlePay: json['google_pay'] == null
          ? null
          : GooglePayData.fromJson(json['google_pay'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentToolToJson(PaymentTool instance) =>
    <String, dynamic>{
      'type': paymentToolTypeToJson(instance.type),
      'pan': instance.pan,
      'expiry_date': instance.expiryDate,
      'cvc': instance.cvc,
      'holder': instance.holder,
      'apple_pay': instance.applePay?.toJson(),
      'google_pay': instance.googlePay?.toJson(),
    };

ApplePayData _$ApplePayDataFromJson(Map<String, dynamic> json) => ApplePayData(
      token: json['token'] as String?,
      cardNetwork: json['card_network'] as String?,
      cardType: json['cardType'],
    );

Map<String, dynamic> _$ApplePayDataToJson(ApplePayData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'card_network': instance.cardNetwork,
      'cardType': instance.cardType,
    };

GooglePayData _$GooglePayDataFromJson(Map<String, dynamic> json) =>
    GooglePayData(
      token: json['token'] as String?,
      cardNetwork: json['card_network'] as String?,
      cardDetails: json['card_details'] as String?,
    );

Map<String, dynamic> _$GooglePayDataToJson(GooglePayData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'card_network': instance.cardNetwork,
      'card_details': instance.cardDetails,
    };

CustomerCard _$CustomerCardFromJson(Map<String, dynamic> json) => CustomerCard(
      cardId: json['card_id'] as String?,
      cvc: json['cvc'] as String?,
    );

Map<String, dynamic> _$CustomerCardToJson(CustomerCard instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
      'cvc': instance.cvc,
    };

PaymentOut _$PaymentOutFromJson(Map<String, dynamic> json) => PaymentOut(
      id: json['id'] as String?,
      status: paymentStatusFromJson(json['status']),
      createdAt: json['created_at'] as String?,
      approvedAmount: json['approved_amount'] as int?,
      capturedAmount: json['captured_amount'] as int?,
      refundedAmount: json['refunded_amount'] as int?,
      processingFee: (json['processing_fee'] as num?)?.toDouble(),
      payer: json['payer'] == null
          ? null
          : PayerOut.fromJson(json['payer'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : PaymentError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentOutToJson(PaymentOut instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': paymentStatusToJson(instance.status),
      'created_at': instance.createdAt,
      'approved_amount': instance.approvedAmount,
      'captured_amount': instance.capturedAmount,
      'refunded_amount': instance.refundedAmount,
      'processing_fee': instance.processingFee,
      'payer': instance.payer?.toJson(),
      'error': instance.error?.toJson(),
    };

RefundIn _$RefundInFromJson(Map<String, dynamic> json) => RefundIn(
      amount: json['amount'] as int?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$RefundInToJson(RefundIn instance) => <String, dynamic>{
      'amount': instance.amount,
      'reason': instance.reason,
    };

RefundOut _$RefundOutFromJson(Map<String, dynamic> json) => RefundOut(
      id: json['id'] as String?,
      status: refundStatusFromJson(json['status']),
      createdAt: json['created_at'] as String?,
      amount: json['amount'] as int?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$RefundOutToJson(RefundOut instance) => <String, dynamic>{
      'id': instance.id,
      'status': refundStatusToJson(instance.status),
      'created_at': instance.createdAt,
      'amount': instance.amount,
      'reason': instance.reason,
    };

ScheduleOut _$ScheduleOutFromJson(Map<String, dynamic> json) => ScheduleOut(
      status: scheduleStatusEnumFromJson(json['status']),
      nextPay: json['next_pay'] as String?,
      step: json['step'] as int?,
      unit: scheduleUnitEnumFromJson(json['unit']),
    );

Map<String, dynamic> _$ScheduleOutToJson(ScheduleOut instance) =>
    <String, dynamic>{
      'status': scheduleStatusEnumToJson(instance.status),
      'next_pay': instance.nextPay,
      'step': instance.step,
      'unit': scheduleUnitEnumToJson(instance.unit),
    };

ExtendedCard _$ExtendedCardFromJson(Map<String, dynamic> json) => ExtendedCard(
      id: json['id'] as String?,
      customerId: json['customer_id'] as String?,
      status: cardStatusFromJson(json['status']),
      createdAt: json['created_at'] as String?,
      panMasked: json['pan_masked'] as String?,
      expiryDate: json['expiry_date'] as String?,
      holder: json['holder'] as String?,
      paymentSystem: json['payment_system'] as String?,
      emitter: json['emitter'] as String?,
      cvcRequired: json['cvc_required'] as bool?,
      error: json['error'] == null
          ? null
          : PaymentError.fromJson(json['error'] as Map<String, dynamic>),
      action: json['action'] == null
          ? null
          : TDSAction.fromJson(json['action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtendedCardToJson(ExtendedCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'status': cardStatusToJson(instance.status),
      'created_at': instance.createdAt,
      'pan_masked': instance.panMasked,
      'expiry_date': instance.expiryDate,
      'holder': instance.holder,
      'payment_system': instance.paymentSystem,
      'emitter': instance.emitter,
      'cvc_required': instance.cvcRequired,
      'error': instance.error?.toJson(),
      'action': instance.action?.toJson(),
    };

ExtendedCustomer _$ExtendedCustomerFromJson(Map<String, dynamic> json) =>
    ExtendedCustomer(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      status: customerStatusFromJson(json['status']),
      externalId: json['external_id'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      checkoutUrl: json['checkout_url'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$ExtendedCustomerToJson(ExtendedCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'status': customerStatusToJson(instance.status),
      'external_id': instance.externalId,
      'email': instance.email,
      'phone': instance.phone,
      'checkout_url': instance.checkoutUrl,
      'access_token': instance.accessToken,
    };

BindingCard _$BindingCardFromJson(Map<String, dynamic> json) => BindingCard(
      pan: json['pan'] as String?,
      exp: json['exp'] as String?,
      cvc: json['cvc'] as String?,
      holder: json['holder'] as String?,
    );

Map<String, dynamic> _$BindingCardToJson(BindingCard instance) =>
    <String, dynamic>{
      'pan': instance.pan,
      'exp': instance.exp,
      'cvc': instance.cvc,
      'holder': instance.holder,
    };

SubscriptionIn _$SubscriptionInFromJson(Map<String, dynamic> json) =>
    SubscriptionIn(
      customerId: json['customer_id'] as String?,
      cardId: json['card_id'] as String?,
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
      description: json['description'] as String?,
      extraInfo: json['extraInfo'],
      nextPay: json['next_pay'] as String?,
      step: json['step'] as int?,
      unit: scheduleUnitEnumFromJson(json['unit']),
    );

Map<String, dynamic> _$SubscriptionInToJson(SubscriptionIn instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'card_id': instance.cardId,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'extraInfo': instance.extraInfo,
      'next_pay': instance.nextPay,
      'step': instance.step,
      'unit': scheduleUnitEnumToJson(instance.unit),
    };

SubscriptionOut _$SubscriptionOutFromJson(Map<String, dynamic> json) =>
    SubscriptionOut(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
      description: json['description'] as String?,
      extraInfo: json['extraInfo'],
      payer: json['payer'] == null
          ? null
          : PayerOut.fromJson(json['payer'] as Map<String, dynamic>),
      schedule: json['schedule'] == null
          ? null
          : ScheduleOut.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionOutToJson(SubscriptionOut instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'extraInfo': instance.extraInfo,
      'payer': instance.payer?.toJson(),
      'schedule': instance.schedule?.toJson(),
    };

SubscriptionStatusIn _$SubscriptionStatusInFromJson(
        Map<String, dynamic> json) =>
    SubscriptionStatusIn(
      status: scheduleStatusEnumFromJson(json['status']),
    );

Map<String, dynamic> _$SubscriptionStatusInToJson(
        SubscriptionStatusIn instance) =>
    <String, dynamic>{
      'status': scheduleStatusEnumToJson(instance.status),
    };

SubscriptionUpdate _$SubscriptionUpdateFromJson(Map<String, dynamic> json) =>
    SubscriptionUpdate(
      customerId: json['customer_id'] as String?,
      cardId: json['card_id'] as String?,
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
      description: json['description'] as String?,
      extraInfo: json['extraInfo'],
      nextPay: json['next_pay'] as String?,
      step: json['step'] as int?,
      unit: scheduleUnitEnumFromJson(json['unit']),
    );

Map<String, dynamic> _$SubscriptionUpdateToJson(SubscriptionUpdate instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'card_id': instance.cardId,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'extraInfo': instance.extraInfo,
      'next_pay': instance.nextPay,
      'step': instance.step,
      'unit': scheduleUnitEnumToJson(instance.unit),
    };

WebhookIn _$WebhookInFromJson(Map<String, dynamic> json) => WebhookIn(
      url: json['url'] as String?,
      events: webhookEventNameEnumListFromJson(json['events'] as List?),
    );

Map<String, dynamic> _$WebhookInToJson(WebhookIn instance) => <String, dynamic>{
      'url': instance.url,
      'events': webhookEventNameEnumListToJson(instance.events),
    };

WebhookOut _$WebhookOutFromJson(Map<String, dynamic> json) => WebhookOut(
      url: json['url'] as String?,
      events: webhookEventNameEnumListFromJson(json['events'] as List?),
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      active: json['active'] as bool?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$WebhookOutToJson(WebhookOut instance) =>
    <String, dynamic>{
      'url': instance.url,
      'events': webhookEventNameEnumListToJson(instance.events),
      'id': instance.id,
      'created_at': instance.createdAt,
      'active': instance.active,
      'key': instance.key,
    };

WebhookPatch _$WebhookPatchFromJson(Map<String, dynamic> json) => WebhookPatch(
      url: json['url'] as String?,
      events: webhookEventNameEnumListFromJson(json['events'] as List?),
    );

Map<String, dynamic> _$WebhookPatchToJson(WebhookPatch instance) =>
    <String, dynamic>{
      'url': instance.url,
      'events': webhookEventNameEnumListToJson(instance.events),
    };

CardIn _$CardInFromJson(Map<String, dynamic> json) => CardIn(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$CardInToJson(CardIn instance) => <String, dynamic>{
      'token': instance.token,
    };

CustomerIn _$CustomerInFromJson(Map<String, dynamic> json) => CustomerIn(
      externalId: json['external_id'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$CustomerInToJson(CustomerIn instance) =>
    <String, dynamic>{
      'external_id': instance.externalId,
      'email': instance.email,
      'phone': instance.phone,
    };

WebhookEvent _$WebhookEventFromJson(Map<String, dynamic> json) => WebhookEvent(
      event: webhookEventNameEnumFromJson(json['event']),
      order: json['order'] == null
          ? null
          : WebhookOrder.fromJson(json['order'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : ExtendedPayment.fromJson(json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WebhookEventToJson(WebhookEvent instance) =>
    <String, dynamic>{
      'event': webhookEventNameEnumToJson(instance.event),
      'order': instance.order?.toJson(),
      'payment': instance.payment?.toJson(),
    };

WebhookOrder _$WebhookOrderFromJson(Map<String, dynamic> json) => WebhookOrder(
      id: json['id'] as String?,
      shopId: json['shop_id'] as String?,
      status: orderStatusFromJson(json['status']),
      createdAt: json['created_at'] as String?,
      amount: json['amount'] as int?,
      currency: currencyEnumFromJson(json['currency']),
      captureMethod: captureMethodFromJson(json['capture_method']),
      externalId: json['external_id'] as String?,
      description: json['description'] as String?,
      extraInfo: json['extra_info'],
      dueDate: json['due_date'] as String?,
    );

Map<String, dynamic> _$WebhookOrderToJson(WebhookOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shop_id': instance.shopId,
      'status': orderStatusToJson(instance.status),
      'created_at': instance.createdAt,
      'amount': instance.amount,
      'currency': currencyEnumToJson(instance.currency),
      'capture_method': captureMethodToJson(instance.captureMethod),
      'external_id': instance.externalId,
      'description': instance.description,
      'extra_info': instance.extraInfo,
      'due_date': instance.dueDate,
    };

ExtendedPayment _$ExtendedPaymentFromJson(Map<String, dynamic> json) =>
    ExtendedPayment(
      id: json['id'] as String?,
      orderId: json['order_id'] as String?,
      status: paymentStatusFromJson(json['status']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      approvedAmount: json['approved_amount'] as int?,
      capturedAmount: json['captured_amount'] as int?,
      refundedAmount: json['refunded_amount'] as int?,
      processingFee: (json['processing_fee'] as num?)?.toDouble(),
      payer: json['payer'] == null
          ? null
          : PayerOut.fromJson(json['payer'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : PaymentError.fromJson(json['error'] as Map<String, dynamic>),
      acquirer: json['acquirer'] == null
          ? null
          : Acquirer.fromJson(json['acquirer'] as Map<String, dynamic>),
      action: json['action'] == null
          ? null
          : TDSAction.fromJson(json['action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtendedPaymentToJson(ExtendedPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'status': paymentStatusToJson(instance.status),
      'created_at': instance.createdAt?.toIso8601String(),
      'approved_amount': instance.approvedAmount,
      'captured_amount': instance.capturedAmount,
      'refunded_amount': instance.refundedAmount,
      'processing_fee': instance.processingFee,
      'payer': instance.payer?.toJson(),
      'error': instance.error?.toJson(),
      'acquirer': instance.acquirer?.toJson(),
      'action': instance.action?.toJson(),
    };

ExtendedRefund _$ExtendedRefundFromJson(Map<String, dynamic> json) =>
    ExtendedRefund(
      id: json['id'] as String?,
      paymentId: json['payment_id'] as String?,
      orderId: json['order_id'] as String?,
      status: refundStatusFromJson(json['status']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      error: json['error'] == null
          ? null
          : PaymentError.fromJson(json['error'] as Map<String, dynamic>),
      acquirer: json['acquirer'] == null
          ? null
          : Acquirer.fromJson(json['acquirer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtendedRefundToJson(ExtendedRefund instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_id': instance.paymentId,
      'order_id': instance.orderId,
      'status': refundStatusToJson(instance.status),
      'created_at': instance.createdAt?.toIso8601String(),
      'error': instance.error?.toJson(),
      'acquirer': instance.acquirer?.toJson(),
    };

Acquirer _$AcquirerFromJson(Map<String, dynamic> json) => Acquirer(
      name: json['name'] as String?,
      reference: json['reference'] as String?,
    );

Map<String, dynamic> _$AcquirerToJson(Acquirer instance) => <String, dynamic>{
      'name': instance.name,
      'reference': instance.reference,
    };

TDSAction _$TDSActionFromJson(Map<String, dynamic> json) => TDSAction(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TDSActionToJson(TDSAction instance) => <String, dynamic>{
      'url': instance.url,
    };

BrandOut _$BrandOutFromJson(Map<String, dynamic> json) => BrandOut(
      brand: myPaymentCardBrandFromJson(json['brand']),
    );

Map<String, dynamic> _$BrandOutToJson(BrandOut instance) => <String, dynamic>{
      'brand': myPaymentCardBrandToJson(instance.brand),
    };

BinInfo _$BinInfoFromJson(Map<String, dynamic> json) => BinInfo(
      code: json['code'] as String?,
      brand: json['brand'] as String?,
      type: json['type'] as String?,
      emitterCode: json['emitter_code'] as String?,
      emitterName: json['emitter_name'] as String?,
    );

Map<String, dynamic> _$BinInfoToJson(BinInfo instance) => <String, dynamic>{
      'code': instance.code,
      'brand': instance.brand,
      'type': instance.type,
      'emitter_code': instance.emitterCode,
      'emitter_name': instance.emitterName,
    };

SessionCard _$SessionCardFromJson(Map<String, dynamic> json) => SessionCard(
      token: json['token'] as String?,
      status: masterpassCardStatusFromJson(json['status']),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionCardToJson(SessionCard instance) =>
    <String, dynamic>{
      'token': instance.token,
      'status': masterpassCardStatusToJson(instance.status),
      'card': instance.card?.toJson(),
    };

SessionIn _$SessionInFromJson(Map<String, dynamic> json) => SessionIn(
      phone: json['phone'] as String?,
      fingerprint: json['fingerprint'] as String?,
      phoneCheckDate: json['phone_check_date'] as String?,
      channel: masterpassChannelTypeFromJson(json['channel']),
    );

Map<String, dynamic> _$SessionInToJson(SessionIn instance) => <String, dynamic>{
      'phone': instance.phone,
      'fingerprint': instance.fingerprint,
      'phone_check_date': instance.phoneCheckDate,
      'channel': masterpassChannelTypeToJson(instance.channel),
    };

SessionOut _$SessionOutFromJson(Map<String, dynamic> json) => SessionOut(
      session: json['session'] as String?,
      isOtpRequired: json['is_otp_required'] as bool?,
      isOtpRequiredDate: json['is_otp_required_date'],
      cards: (json['cards'] as List<dynamic>?)
              ?.map((e) => SessionCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SessionOutToJson(SessionOut instance) =>
    <String, dynamic>{
      'session': instance.session,
      'is_otp_required': instance.isOtpRequired,
      'is_otp_required_date': instance.isOtpRequiredDate,
      'cards': instance.cards?.map((e) => e.toJson()).toList(),
    };

MasterpassCardIn _$MasterpassCardInFromJson(Map<String, dynamic> json) =>
    MasterpassCardIn(
      customerId: json['customer_id'] as String?,
      cardId: json['card_id'] as String?,
    );

Map<String, dynamic> _$MasterpassCardInToJson(MasterpassCardIn instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'card_id': instance.cardId,
    };

MasterpassCardOut _$MasterpassCardOutFromJson(Map<String, dynamic> json) =>
    MasterpassCardOut(
      token: json['token'] as String?,
      recommendation: masterpassCardRequiredFromJson(json['recommendation']),
      required: masterpassCardRequiredFromJson(json['required']),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasterpassCardOutToJson(MasterpassCardOut instance) =>
    <String, dynamic>{
      'token': instance.token,
      'recommendation': masterpassCardRequiredToJson(instance.recommendation),
      'required': masterpassCardRequiredToJson(instance.required),
      'card': instance.card?.toJson(),
    };

ChangePhoneIn _$ChangePhoneInFromJson(Map<String, dynamic> json) =>
    ChangePhoneIn(
      oldPhone: json['old_phone'] as String?,
      newPhone: json['new_phone'] as String?,
    );

Map<String, dynamic> _$ChangePhoneInToJson(ChangePhoneIn instance) =>
    <String, dynamic>{
      'old_phone': instance.oldPhone,
      'new_phone': instance.newPhone,
    };

ChangePhoneOut _$ChangePhoneOutFromJson(Map<String, dynamic> json) =>
    ChangePhoneOut(
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ChangePhoneOutToJson(ChangePhoneOut instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };

MasterpassPostbackIn _$MasterpassPostbackInFromJson(
        Map<String, dynamic> json) =>
    MasterpassPostbackIn(
      orderId: json['order_id'] as String?,
      channel: masterpassChannelTypeFromJson(json['channel']),
    );

Map<String, dynamic> _$MasterpassPostbackInToJson(
        MasterpassPostbackIn instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'channel': masterpassChannelTypeToJson(instance.channel),
    };

MasterpassPostbackOut _$MasterpassPostbackOutFromJson(
        Map<String, dynamic> json) =>
    MasterpassPostbackOut(
      orderId: json['order_id'] as String?,
      externalId: json['external_id'] as String?,
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$MasterpassPostbackOutToJson(
        MasterpassPostbackOut instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'external_id': instance.externalId,
      'amount': instance.amount,
      'currency': instance.currency,
    };
