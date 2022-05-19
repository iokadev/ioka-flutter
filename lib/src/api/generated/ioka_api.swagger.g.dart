// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ioka_api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  return val;
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) =>
    ValidationError(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ValidationErrorToJson(ValidationError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  return val;
}

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

Map<String, dynamic> _$CardPayerToJson(CardPayer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pan', instance.pan);
  writeNotNull('exp', instance.exp);
  writeNotNull('cvc', instance.cvc);
  writeNotNull('holder', instance.holder);
  writeNotNull('save', instance.save);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('card_id', instance.cardId);
  return val;
}

ToolPayer _$ToolPayerFromJson(Map<String, dynamic> json) => ToolPayer(
      toolType: toolTypeEnumFromJson(json['tool_type']),
      applePay: json['apple_pay'] == null
          ? null
          : ToolPayer$ApplePay.fromJson(
              json['apple_pay'] as Map<String, dynamic>),
      googlePay: json['google_pay'] == null
          ? null
          : ToolPayer$GooglePay.fromJson(
              json['google_pay'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolPayerToJson(ToolPayer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tool_type', toolTypeEnumToJson(instance.toolType));
  writeNotNull('apple_pay', instance.applePay?.toJson());
  writeNotNull('google_pay', instance.googlePay?.toJson());
  return val;
}

Contacts _$ContactsFromJson(Map<String, dynamic> json) => Contacts(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ContactsToJson(Contacts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  return val;
}

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

Map<String, dynamic> _$OrderEventOutToJson(OrderEventOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', eventNameEnumToJson(instance.name));
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('order_id', instance.orderId);
  writeNotNull('payment_id', instance.paymentId);
  writeNotNull('refund_id', instance.refundId);
  writeNotNull('md', instance.md);
  writeNotNull('pa_req', instance.paReq);
  writeNotNull('acs_url', instance.acsUrl);
  writeNotNull('term_url', instance.termUrl);
  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  return val;
}

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

Map<String, dynamic> _$CustomerEventOutToJson(CustomerEventOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', customerEventNameEnumToJson(instance.name));
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('customer_id', instance.customerId);
  writeNotNull('card_id', instance.cardId);
  writeNotNull('md', instance.md);
  writeNotNull('pa_req', instance.paReq);
  writeNotNull('acs_url', instance.acsUrl);
  writeNotNull('term_url', instance.termUrl);
  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  return val;
}

OrderUpdate _$OrderUpdateFromJson(Map<String, dynamic> json) => OrderUpdate(
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$OrderUpdateToJson(OrderUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  return val;
}

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

Map<String, dynamic> _$OrderInToJson(OrderIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('currency', currencyEnumToJson(instance.currency));
  writeNotNull('capture_method', captureMethodToJson(instance.captureMethod));
  writeNotNull('external_id', instance.externalId);
  writeNotNull('description', instance.description);
  writeNotNull('extra_info', instance.extraInfo);
  writeNotNull('attempts', instance.attempts);
  writeNotNull('due_date', instance.dueDate);
  writeNotNull('customer_id', instance.customerId);
  writeNotNull('card_id', instance.cardId);
  writeNotNull('back_url', instance.backUrl);
  writeNotNull('success_url', instance.successUrl);
  writeNotNull('failure_url', instance.failureUrl);
  writeNotNull('template', instance.template);
  return val;
}

OrderOut _$OrderOutFromJson(Map<String, dynamic> json) => OrderOut(
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

Map<String, dynamic> _$OrderOutToJson(OrderOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('shop_id', instance.shopId);
  writeNotNull('status', orderStatusToJson(instance.status));
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', currencyEnumToJson(instance.currency));
  writeNotNull('capture_method', captureMethodToJson(instance.captureMethod));
  writeNotNull('external_id', instance.externalId);
  writeNotNull('description', instance.description);
  writeNotNull('extra_info', instance.extraInfo);
  writeNotNull('attempts', instance.attempts);
  writeNotNull('due_date', instance.dueDate);
  writeNotNull('customer_id', instance.customerId);
  writeNotNull('card_id', instance.cardId);
  writeNotNull('back_url', instance.backUrl);
  writeNotNull('success_url', instance.successUrl);
  writeNotNull('failure_url', instance.failureUrl);
  writeNotNull('template', instance.template);
  writeNotNull('checkout_url', instance.checkoutUrl);
  return val;
}

CustomerAndAccessToken _$CustomerAndAccessTokenFromJson(
        Map<String, dynamic> json) =>
    CustomerAndAccessToken(
      customer: json['customer'] == null
          ? null
          : ExtendedCustomer.fromJson(json['customer'] as Map<String, dynamic>),
      customerAccessToken: json['customer_access_token'] as String?,
    );

Map<String, dynamic> _$CustomerAndAccessTokenToJson(
    CustomerAndAccessToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customer', instance.customer?.toJson());
  writeNotNull('customer_access_token', instance.customerAccessToken);
  return val;
}

OrderAndAccessToken _$OrderAndAccessTokenFromJson(Map<String, dynamic> json) =>
    OrderAndAccessToken(
      order: json['order'] == null
          ? null
          : OrderOut.fromJson(json['order'] as Map<String, dynamic>),
      orderAccessToken: json['order_access_token'] as String?,
    );

Map<String, dynamic> _$OrderAndAccessTokenToJson(OrderAndAccessToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order', instance.order?.toJson());
  writeNotNull('order_access_token', instance.orderAccessToken);
  return val;
}

PaginatedOrderOut _$PaginatedOrderOutFromJson(Map<String, dynamic> json) =>
    PaginatedOrderOut(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => OrderOut.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedOrderOutToJson(PaginatedOrderOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  return val;
}

PaginatedPaymentOut _$PaginatedPaymentOutFromJson(Map<String, dynamic> json) =>
    PaginatedPaymentOut(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => PaymentOut.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedPaymentOutToJson(PaginatedPaymentOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  return val;
}

PaginatedRefundOut _$PaginatedRefundOutFromJson(Map<String, dynamic> json) =>
    PaginatedRefundOut(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => RefundOut.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedRefundOutToJson(PaginatedRefundOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  return val;
}

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

Map<String, dynamic> _$PayerOutToJson(PayerOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pan_masked', instance.panMasked);
  writeNotNull('expiry_date', instance.expiryDate);
  writeNotNull('holder', instance.holder);
  writeNotNull('payment_system', instance.paymentSystem);
  writeNotNull('emitter', instance.emitter);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('customer_id', instance.customerId);
  writeNotNull('card_id', instance.cardId);
  return val;
}

PaymentCancel _$PaymentCancelFromJson(Map<String, dynamic> json) =>
    PaymentCancel(
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$PaymentCancelToJson(PaymentCancel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reason', instance.reason);
  return val;
}

PaymentCapture _$PaymentCaptureFromJson(Map<String, dynamic> json) =>
    PaymentCapture(
      amount: json['amount'] as int?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$PaymentCaptureToJson(PaymentCapture instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('reason', instance.reason);
  return val;
}

PaymentError _$PaymentErrorFromJson(Map<String, dynamic> json) => PaymentError(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PaymentErrorToJson(PaymentError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  return val;
}

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

Map<String, dynamic> _$PaymentInToJson(PaymentIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payment_method', instance.paymentMethod?.toJson());
  writeNotNull('customer_card', instance.customerCard?.toJson());
  writeNotNull('card', instance.card?.toJson());
  writeNotNull('contacts', instance.contacts?.toJson());
  return val;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      token: json['token'] as String?,
      saveCard: json['save_card'] as bool? ?? false,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('save_card', instance.saveCard);
  return val;
}

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      panMasked: json['pan_masked'] as String?,
      expiryDate: json['expiry_date'] as String?,
      holder: json['holder'] as String?,
      paymentSystem: json['payment_system'] as String?,
      emitter: json['emitter'] as String?,
    );

Map<String, dynamic> _$CardToJson(Card instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pan_masked', instance.panMasked);
  writeNotNull('expiry_date', instance.expiryDate);
  writeNotNull('holder', instance.holder);
  writeNotNull('payment_system', instance.paymentSystem);
  writeNotNull('emitter', instance.emitter);
  return val;
}

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      ip: json['ip'] as String?,
      fingerprint: json['fingerprint'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ip', instance.ip);
  writeNotNull('fingerprint', instance.fingerprint);
  return val;
}

ApplePayIn _$ApplePayInFromJson(Map<String, dynamic> json) => ApplePayIn(
      url: json['url'] as String?,
      platform: json['platform'] as String?,
      domainName: json['domain_name'] as String?,
    );

Map<String, dynamic> _$ApplePayInToJson(ApplePayIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('platform', instance.platform);
  writeNotNull('domain_name', instance.domainName);
  return val;
}

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

Map<String, dynamic> _$ApplePayOutToJson(ApplePayOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('epochTimestamp', instance.epochTimestamp);
  writeNotNull('expiresAt', instance.expiresAt);
  writeNotNull('merchantSessionIdentifier', instance.merchantSessionIdentifier);
  writeNotNull('nonce', instance.nonce);
  writeNotNull('merchantIdentifier', instance.merchantIdentifier);
  writeNotNull('domainName', instance.domainName);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('signature', instance.signature);
  writeNotNull('operationalAnalyticsIdentifier',
      instance.operationalAnalyticsIdentifier);
  writeNotNull('retries', instance.retries);
  return val;
}

PaymentMethodIn _$PaymentMethodInFromJson(Map<String, dynamic> json) =>
    PaymentMethodIn(
      paymentTool: json['payment_tool'] == null
          ? null
          : PaymentTool.fromJson(json['payment_tool'] as Map<String, dynamic>),
      $client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentMethodInToJson(PaymentMethodIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payment_tool', instance.paymentTool?.toJson());
  writeNotNull('client', instance.$client?.toJson());
  return val;
}

PaymentMethodOut _$PaymentMethodOutFromJson(Map<String, dynamic> json) =>
    PaymentMethodOut(
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      session: json['session'] as String?,
      token: json['token'] as String?,
      expiresAt: json['expires_at'] as String?,
    );

Map<String, dynamic> _$PaymentMethodOutToJson(PaymentMethodOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('card', instance.card?.toJson());
  writeNotNull('session', instance.session);
  writeNotNull('token', instance.token);
  writeNotNull('expires_at', instance.expiresAt);
  return val;
}

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

Map<String, dynamic> _$PaymentToolToJson(PaymentTool instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', paymentToolTypeToJson(instance.type));
  writeNotNull('pan', instance.pan);
  writeNotNull('expiry_date', instance.expiryDate);
  writeNotNull('cvc', instance.cvc);
  writeNotNull('holder', instance.holder);
  writeNotNull('apple_pay', instance.applePay?.toJson());
  writeNotNull('google_pay', instance.googlePay?.toJson());
  return val;
}

ApplePayData _$ApplePayDataFromJson(Map<String, dynamic> json) => ApplePayData(
      token: json['token'] as String?,
      cardNetwork: json['card_network'] as String?,
      cardType: json['cardType'],
    );

Map<String, dynamic> _$ApplePayDataToJson(ApplePayData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('card_network', instance.cardNetwork);
  writeNotNull('cardType', instance.cardType);
  return val;
}

GooglePayData _$GooglePayDataFromJson(Map<String, dynamic> json) =>
    GooglePayData(
      token: json['token'] as String?,
      cardNetwork: json['card_network'] as String?,
      cardDetails: json['card_details'] as String?,
    );

Map<String, dynamic> _$GooglePayDataToJson(GooglePayData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('card_network', instance.cardNetwork);
  writeNotNull('card_details', instance.cardDetails);
  return val;
}

CustomerCard _$CustomerCardFromJson(Map<String, dynamic> json) => CustomerCard(
      cardId: json['card_id'] as String?,
      cvc: json['cvc'] as String?,
    );

Map<String, dynamic> _$CustomerCardToJson(CustomerCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('card_id', instance.cardId);
  writeNotNull('cvc', instance.cvc);
  return val;
}

PaymentOut _$PaymentOutFromJson(Map<String, dynamic> json) => PaymentOut(
      id: json['id'] as String?,
      shopId: json['shop_id'] as String?,
      orderId: json['order_id'] as String?,
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
      acquirer: json['acquirer'] == null
          ? null
          : Acquirer.fromJson(json['acquirer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentOutToJson(PaymentOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('shop_id', instance.shopId);
  writeNotNull('order_id', instance.orderId);
  writeNotNull('status', paymentStatusToJson(instance.status));
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('approved_amount', instance.approvedAmount);
  writeNotNull('captured_amount', instance.capturedAmount);
  writeNotNull('refunded_amount', instance.refundedAmount);
  writeNotNull('processing_fee', instance.processingFee);
  writeNotNull('payer', instance.payer?.toJson());
  writeNotNull('error', instance.error?.toJson());
  writeNotNull('acquirer', instance.acquirer?.toJson());
  return val;
}

RefundIn _$RefundInFromJson(Map<String, dynamic> json) => RefundIn(
      amount: json['amount'] as int?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$RefundInToJson(RefundIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('reason', instance.reason);
  return val;
}

RefundOut _$RefundOutFromJson(Map<String, dynamic> json) => RefundOut(
      id: json['id'] as String?,
      status: refundStatusFromJson(json['status']),
      createdAt: json['created_at'] as String?,
      amount: json['amount'] as int?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$RefundOutToJson(RefundOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', refundStatusToJson(instance.status));
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('amount', instance.amount);
  writeNotNull('reason', instance.reason);
  return val;
}

ScheduleOut _$ScheduleOutFromJson(Map<String, dynamic> json) => ScheduleOut(
      status: scheduleStatusEnumFromJson(json['status']),
      nextPay: json['next_pay'] as String?,
      step: json['step'] as int?,
      unit: scheduleUnitEnumFromJson(json['unit']),
    );

Map<String, dynamic> _$ScheduleOutToJson(ScheduleOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', scheduleStatusEnumToJson(instance.status));
  writeNotNull('next_pay', instance.nextPay);
  writeNotNull('step', instance.step);
  writeNotNull('unit', scheduleUnitEnumToJson(instance.unit));
  return val;
}

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

Map<String, dynamic> _$ExtendedCardToJson(ExtendedCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('customer_id', instance.customerId);
  writeNotNull('status', cardStatusToJson(instance.status));
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('pan_masked', instance.panMasked);
  writeNotNull('expiry_date', instance.expiryDate);
  writeNotNull('holder', instance.holder);
  writeNotNull('payment_system', instance.paymentSystem);
  writeNotNull('emitter', instance.emitter);
  writeNotNull('cvc_required', instance.cvcRequired);
  writeNotNull('error', instance.error?.toJson());
  writeNotNull('action', instance.action?.toJson());
  return val;
}

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

Map<String, dynamic> _$ExtendedCustomerToJson(ExtendedCustomer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('status', customerStatusToJson(instance.status));
  writeNotNull('external_id', instance.externalId);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('checkout_url', instance.checkoutUrl);
  writeNotNull('access_token', instance.accessToken);
  return val;
}

BindingCard _$BindingCardFromJson(Map<String, dynamic> json) => BindingCard(
      pan: json['pan'] as String?,
      exp: json['exp'] as String?,
      cvc: json['cvc'] as String?,
      holder: json['holder'] as String?,
    );

Map<String, dynamic> _$BindingCardToJson(BindingCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pan', instance.pan);
  writeNotNull('exp', instance.exp);
  writeNotNull('cvc', instance.cvc);
  writeNotNull('holder', instance.holder);
  return val;
}

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

Map<String, dynamic> _$SubscriptionInToJson(SubscriptionIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customer_id', instance.customerId);
  writeNotNull('card_id', instance.cardId);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('description', instance.description);
  writeNotNull('extraInfo', instance.extraInfo);
  writeNotNull('next_pay', instance.nextPay);
  writeNotNull('step', instance.step);
  writeNotNull('unit', scheduleUnitEnumToJson(instance.unit));
  return val;
}

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

Map<String, dynamic> _$SubscriptionOutToJson(SubscriptionOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('description', instance.description);
  writeNotNull('extraInfo', instance.extraInfo);
  writeNotNull('payer', instance.payer?.toJson());
  writeNotNull('schedule', instance.schedule?.toJson());
  return val;
}

SubscriptionStatusIn _$SubscriptionStatusInFromJson(
        Map<String, dynamic> json) =>
    SubscriptionStatusIn(
      status: scheduleStatusEnumFromJson(json['status']),
    );

Map<String, dynamic> _$SubscriptionStatusInToJson(
    SubscriptionStatusIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', scheduleStatusEnumToJson(instance.status));
  return val;
}

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

Map<String, dynamic> _$SubscriptionUpdateToJson(SubscriptionUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customer_id', instance.customerId);
  writeNotNull('card_id', instance.cardId);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('description', instance.description);
  writeNotNull('extraInfo', instance.extraInfo);
  writeNotNull('next_pay', instance.nextPay);
  writeNotNull('step', instance.step);
  writeNotNull('unit', scheduleUnitEnumToJson(instance.unit));
  return val;
}

WebhookIn _$WebhookInFromJson(Map<String, dynamic> json) => WebhookIn(
      url: json['url'] as String?,
      events: webhookEventNameEnumListFromJson(json['events'] as List?),
    );

Map<String, dynamic> _$WebhookInToJson(WebhookIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('events', webhookEventNameEnumListToJson(instance.events));
  return val;
}

WebhookOut _$WebhookOutFromJson(Map<String, dynamic> json) => WebhookOut(
      url: json['url'] as String?,
      events: webhookEventNameEnumListFromJson(json['events'] as List?),
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      active: json['active'] as bool?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$WebhookOutToJson(WebhookOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('events', webhookEventNameEnumListToJson(instance.events));
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('active', instance.active);
  writeNotNull('key', instance.key);
  return val;
}

WebhookPatch _$WebhookPatchFromJson(Map<String, dynamic> json) => WebhookPatch(
      url: json['url'] as String?,
      events: webhookEventNameEnumListFromJson(json['events'] as List?),
    );

Map<String, dynamic> _$WebhookPatchToJson(WebhookPatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('events', webhookEventNameEnumListToJson(instance.events));
  return val;
}

CardIn _$CardInFromJson(Map<String, dynamic> json) => CardIn(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$CardInToJson(CardIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  return val;
}

CustomerIn _$CustomerInFromJson(Map<String, dynamic> json) => CustomerIn(
      externalId: json['external_id'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$CustomerInToJson(CustomerIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('external_id', instance.externalId);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  return val;
}

WebhookEvent _$WebhookEventFromJson(Map<String, dynamic> json) => WebhookEvent(
      event: webhookEventNameEnumFromJson(json['event']),
      order: json['order'] == null
          ? null
          : WebhookOrder.fromJson(json['order'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : ExtendedPayment.fromJson(json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WebhookEventToJson(WebhookEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('event', webhookEventNameEnumToJson(instance.event));
  writeNotNull('order', instance.order?.toJson());
  writeNotNull('payment', instance.payment?.toJson());
  return val;
}

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

Map<String, dynamic> _$WebhookOrderToJson(WebhookOrder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('shop_id', instance.shopId);
  writeNotNull('status', orderStatusToJson(instance.status));
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', currencyEnumToJson(instance.currency));
  writeNotNull('capture_method', captureMethodToJson(instance.captureMethod));
  writeNotNull('external_id', instance.externalId);
  writeNotNull('description', instance.description);
  writeNotNull('extra_info', instance.extraInfo);
  writeNotNull('due_date', instance.dueDate);
  return val;
}

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

Map<String, dynamic> _$ExtendedPaymentToJson(ExtendedPayment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('order_id', instance.orderId);
  writeNotNull('status', paymentStatusToJson(instance.status));
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('approved_amount', instance.approvedAmount);
  writeNotNull('captured_amount', instance.capturedAmount);
  writeNotNull('refunded_amount', instance.refundedAmount);
  writeNotNull('processing_fee', instance.processingFee);
  writeNotNull('payer', instance.payer?.toJson());
  writeNotNull('error', instance.error?.toJson());
  writeNotNull('acquirer', instance.acquirer?.toJson());
  writeNotNull('action', instance.action?.toJson());
  return val;
}

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

Map<String, dynamic> _$ExtendedRefundToJson(ExtendedRefund instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('payment_id', instance.paymentId);
  writeNotNull('order_id', instance.orderId);
  writeNotNull('status', refundStatusToJson(instance.status));
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('error', instance.error?.toJson());
  writeNotNull('acquirer', instance.acquirer?.toJson());
  return val;
}

Acquirer _$AcquirerFromJson(Map<String, dynamic> json) => Acquirer(
      name: json['name'] as String?,
      reference: json['reference'] as String?,
    );

Map<String, dynamic> _$AcquirerToJson(Acquirer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('reference', instance.reference);
  return val;
}

TDSAction _$TDSActionFromJson(Map<String, dynamic> json) => TDSAction(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TDSActionToJson(TDSAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  return val;
}

BrandOut _$BrandOutFromJson(Map<String, dynamic> json) => BrandOut(
      brand: myPaymentCardBrandFromJson(json['brand']),
    );

Map<String, dynamic> _$BrandOutToJson(BrandOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brand', myPaymentCardBrandToJson(instance.brand));
  return val;
}

BinInfo _$BinInfoFromJson(Map<String, dynamic> json) => BinInfo(
      code: json['code'] as String?,
      brand: json['brand'] as String?,
      type: json['type'] as String?,
      emitterCode: json['emitter_code'] as String?,
      emitterName: json['emitter_name'] as String?,
    );

Map<String, dynamic> _$BinInfoToJson(BinInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('brand', instance.brand);
  writeNotNull('type', instance.type);
  writeNotNull('emitter_code', instance.emitterCode);
  writeNotNull('emitter_name', instance.emitterName);
  return val;
}

SessionCard _$SessionCardFromJson(Map<String, dynamic> json) => SessionCard(
      token: json['token'] as String?,
      status: masterpassCardStatusFromJson(json['status']),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionCardToJson(SessionCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('status', masterpassCardStatusToJson(instance.status));
  writeNotNull('card', instance.card?.toJson());
  return val;
}

SessionIn _$SessionInFromJson(Map<String, dynamic> json) => SessionIn(
      phone: json['phone'] as String?,
      fingerprint: json['fingerprint'] as String?,
      phoneCheckDate: json['phone_check_date'] as String?,
      channel: masterpassChannelTypeFromJson(json['channel']),
    );

Map<String, dynamic> _$SessionInToJson(SessionIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone);
  writeNotNull('fingerprint', instance.fingerprint);
  writeNotNull('phone_check_date', instance.phoneCheckDate);
  writeNotNull('channel', masterpassChannelTypeToJson(instance.channel));
  return val;
}

SessionOut _$SessionOutFromJson(Map<String, dynamic> json) => SessionOut(
      session: json['session'] as String?,
      isOtpRequired: json['is_otp_required'] as bool?,
      isOtpRequiredDate: json['is_otp_required_date'],
      cards: (json['cards'] as List<dynamic>?)
              ?.map((e) => SessionCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SessionOutToJson(SessionOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('session', instance.session);
  writeNotNull('is_otp_required', instance.isOtpRequired);
  writeNotNull('is_otp_required_date', instance.isOtpRequiredDate);
  writeNotNull('cards', instance.cards?.map((e) => e.toJson()).toList());
  return val;
}

MasterpassCardIn _$MasterpassCardInFromJson(Map<String, dynamic> json) =>
    MasterpassCardIn(
      customerId: json['customer_id'] as String?,
      cardId: json['card_id'] as String?,
    );

Map<String, dynamic> _$MasterpassCardInToJson(MasterpassCardIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customer_id', instance.customerId);
  writeNotNull('card_id', instance.cardId);
  return val;
}

MasterpassCardOut _$MasterpassCardOutFromJson(Map<String, dynamic> json) =>
    MasterpassCardOut(
      token: json['token'] as String?,
      recommendation: masterpassCardRequiredFromJson(json['recommendation']),
      required: masterpassCardRequiredFromJson(json['required']),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasterpassCardOutToJson(MasterpassCardOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull(
      'recommendation', masterpassCardRequiredToJson(instance.recommendation));
  writeNotNull('required', masterpassCardRequiredToJson(instance.required));
  writeNotNull('card', instance.card?.toJson());
  return val;
}

ChangePhoneIn _$ChangePhoneInFromJson(Map<String, dynamic> json) =>
    ChangePhoneIn(
      oldPhone: json['old_phone'] as String?,
      newPhone: json['new_phone'] as String?,
    );

Map<String, dynamic> _$ChangePhoneInToJson(ChangePhoneIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('old_phone', instance.oldPhone);
  writeNotNull('new_phone', instance.newPhone);
  return val;
}

ChangePhoneOut _$ChangePhoneOutFromJson(Map<String, dynamic> json) =>
    ChangePhoneOut(
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ChangePhoneOutToJson(ChangePhoneOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone);
  return val;
}

MasterpassPostbackIn _$MasterpassPostbackInFromJson(
        Map<String, dynamic> json) =>
    MasterpassPostbackIn(
      orderId: json['order_id'] as String?,
      channel: masterpassChannelTypeFromJson(json['channel']),
    );

Map<String, dynamic> _$MasterpassPostbackInToJson(
    MasterpassPostbackIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order_id', instance.orderId);
  writeNotNull('channel', masterpassChannelTypeToJson(instance.channel));
  return val;
}

MasterpassPostbackOut _$MasterpassPostbackOutFromJson(
        Map<String, dynamic> json) =>
    MasterpassPostbackOut(
      orderId: json['order_id'] as String?,
      externalId: json['external_id'] as String?,
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$MasterpassPostbackOutToJson(
    MasterpassPostbackOut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order_id', instance.orderId);
  writeNotNull('external_id', instance.externalId);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  return val;
}

ToolPayer$ApplePay _$ToolPayer$ApplePayFromJson(Map<String, dynamic> json) =>
    ToolPayer$ApplePay(
      token: json['token'] as String?,
      cardNetwork: json['card_network'] as String?,
      cardType: json['card_type'] as String?,
      amount: json['amount'],
      currency: currencyEnumFromJson(json['currency']),
      holder: json['holder'],
      email: json['email'],
      phone: json['phone'],
    );

Map<String, dynamic> _$ToolPayer$ApplePayToJson(ToolPayer$ApplePay instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('card_network', instance.cardNetwork);
  writeNotNull('card_type', instance.cardType);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', currencyEnumToJson(instance.currency));
  writeNotNull('holder', instance.holder);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  return val;
}

ToolPayer$GooglePay _$ToolPayer$GooglePayFromJson(Map<String, dynamic> json) =>
    ToolPayer$GooglePay(
      token: json['token'] as String?,
      cardNetwork: json['card_network'] as String?,
      cardDetatils: json['card_detatils'] as String?,
      amount: json['amount'],
      currency: currencyEnumFromJson(json['currency']),
      holder: json['holder'],
      email: json['email'],
      phone: json['phone'],
    );

Map<String, dynamic> _$ToolPayer$GooglePayToJson(ToolPayer$GooglePay instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('card_network', instance.cardNetwork);
  writeNotNull('card_detatils', instance.cardDetatils);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', currencyEnumToJson(instance.currency));
  writeNotNull('holder', instance.holder);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  return val;
}
