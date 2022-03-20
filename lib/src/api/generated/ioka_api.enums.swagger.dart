import 'package:json_annotation/json_annotation.dart';

enum CaptureMethod {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('AUTO')
  auto,
  @JsonValue('MANUAL')
  manual
}

const $CaptureMethodMap = {
  CaptureMethod.auto: 'AUTO',
  CaptureMethod.manual: 'MANUAL'
};

enum CurrencyEnum {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('KZT')
  kzt
}

const $CurrencyEnumMap = {CurrencyEnum.kzt: 'KZT'};

enum WebhookEventNameEnum {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('PAYMENT_APPROVED')
  paymentApproved,
  @JsonValue('PAYMENT_CAPTURED')
  paymentCaptured,
  @JsonValue('PAYMENT_CANCELLED')
  paymentCancelled,
  @JsonValue('PAYMENT_DECLINED')
  paymentDeclined
}

const $WebhookEventNameEnumMap = {
  WebhookEventNameEnum.paymentApproved: 'PAYMENT_APPROVED',
  WebhookEventNameEnum.paymentCaptured: 'PAYMENT_CAPTURED',
  WebhookEventNameEnum.paymentCancelled: 'PAYMENT_CANCELLED',
  WebhookEventNameEnum.paymentDeclined: 'PAYMENT_DECLINED'
};

enum EventNameEnum {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('ORDER_CREATED')
  orderCreated,
  @JsonValue('ORDER_PAID')
  orderPaid,
  @JsonValue('ORDER_UNPAID')
  orderUnpaid,
  @JsonValue('PAYMENT_CREATED')
  paymentCreated,
  @JsonValue('PAYMENT_PENDING')
  paymentPending,
  @JsonValue('PAYMENT_APPROVED')
  paymentApproved,
  @JsonValue('PAYMENT_CAPTURED')
  paymentCaptured,
  @JsonValue('PAYMENT_CANCELLED')
  paymentCancelled,
  @JsonValue('PAYMENT_DECLINED')
  paymentDeclined,
  @JsonValue('REFUND_PENDING')
  refundPending,
  @JsonValue('REFUND_APPROVED')
  refundApproved,
  @JsonValue('REFUND_DECLINED')
  refundDeclined
}

const $EventNameEnumMap = {
  EventNameEnum.orderCreated: 'ORDER_CREATED',
  EventNameEnum.orderPaid: 'ORDER_PAID',
  EventNameEnum.orderUnpaid: 'ORDER_UNPAID',
  EventNameEnum.paymentCreated: 'PAYMENT_CREATED',
  EventNameEnum.paymentPending: 'PAYMENT_PENDING',
  EventNameEnum.paymentApproved: 'PAYMENT_APPROVED',
  EventNameEnum.paymentCaptured: 'PAYMENT_CAPTURED',
  EventNameEnum.paymentCancelled: 'PAYMENT_CANCELLED',
  EventNameEnum.paymentDeclined: 'PAYMENT_DECLINED',
  EventNameEnum.refundPending: 'REFUND_PENDING',
  EventNameEnum.refundApproved: 'REFUND_APPROVED',
  EventNameEnum.refundDeclined: 'REFUND_DECLINED'
};

enum CustomerEventNameEnum {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('CUSTOMER_CREATED')
  customerCreated,
  @JsonValue('CUSTOMER_READY')
  customerReady,
  @JsonValue('CARD_CREATED')
  cardCreated,
  @JsonValue('CARD_ACTION_REQUIRED')
  cardActionRequired,
  @JsonValue('CARD_APPROVED')
  cardApproved,
  @JsonValue('CARD_DECLINED')
  cardDeclined
}

const $CustomerEventNameEnumMap = {
  CustomerEventNameEnum.customerCreated: 'CUSTOMER_CREATED',
  CustomerEventNameEnum.customerReady: 'CUSTOMER_READY',
  CustomerEventNameEnum.cardCreated: 'CARD_CREATED',
  CustomerEventNameEnum.cardActionRequired: 'CARD_ACTION_REQUIRED',
  CustomerEventNameEnum.cardApproved: 'CARD_APPROVED',
  CustomerEventNameEnum.cardDeclined: 'CARD_DECLINED'
};

enum OrderStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('UNPAID')
  unpaid,
  @JsonValue('ON_HOLD')
  onHold,
  @JsonValue('PAID')
  paid
}

const $OrderStatusMap = {
  OrderStatus.unpaid: 'UNPAID',
  OrderStatus.onHold: 'ON_HOLD',
  OrderStatus.paid: 'PAID'
};

enum CustomerStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('PENDING')
  pending,
  @JsonValue('READY')
  ready
}

const $CustomerStatusMap = {
  CustomerStatus.pending: 'PENDING',
  CustomerStatus.ready: 'READY'
};

enum PayerType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('PAYMENT_TOKEN')
  paymentToken,
  @JsonValue('BINDING')
  binding
}

const $PayerTypeMap = {
  PayerType.paymentToken: 'PAYMENT_TOKEN',
  PayerType.binding: 'BINDING'
};

enum PaymentToolType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('CARD')
  card,
  @JsonValue('APPLE_PAY')
  applePay,
  @JsonValue('GOOGLE_PAY')
  googlePay
}

const $PaymentToolTypeMap = {
  PaymentToolType.card: 'CARD',
  PaymentToolType.applePay: 'APPLE_PAY',
  PaymentToolType.googlePay: 'GOOGLE_PAY'
};

enum PaymentStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('REQUIRES_ACTION')
  requiresAction,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('CAPTURED')
  captured,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('DECLINED')
  declined
}

const $PaymentStatusMap = {
  PaymentStatus.requiresAction: 'REQUIRES_ACTION',
  PaymentStatus.approved: 'APPROVED',
  PaymentStatus.captured: 'CAPTURED',
  PaymentStatus.cancelled: 'CANCELLED',
  PaymentStatus.declined: 'DECLINED'
};

enum RefundStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('PENDING')
  pending,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('DECLINED')
  declined
}

const $RefundStatusMap = {
  RefundStatus.pending: 'PENDING',
  RefundStatus.approved: 'APPROVED',
  RefundStatus.declined: 'DECLINED'
};

enum ScheduleStatusEnum {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('ACTIVE')
  active,
  @JsonValue('PAUSED')
  paused,
  @JsonValue('CANCELLED')
  cancelled
}

const $ScheduleStatusEnumMap = {
  ScheduleStatusEnum.active: 'ACTIVE',
  ScheduleStatusEnum.paused: 'PAUSED',
  ScheduleStatusEnum.cancelled: 'CANCELLED'
};

enum ScheduleUnitEnum {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('DAY')
  day,
  @JsonValue('WEEK')
  week,
  @JsonValue('MONTH')
  month
}

const $ScheduleUnitEnumMap = {
  ScheduleUnitEnum.day: 'DAY',
  ScheduleUnitEnum.week: 'WEEK',
  ScheduleUnitEnum.month: 'MONTH'
};

enum CardStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('PENDING')
  pending,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('DECLINED')
  declined
}

const $CardStatusMap = {
  CardStatus.pending: 'PENDING',
  CardStatus.approved: 'APPROVED',
  CardStatus.declined: 'DECLINED'
};

enum MasterpassCardStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('INACTIVE')
  inactive,
  @JsonValue('ACTIVE')
  active,
  @JsonValue('CVC2_ALWAYS')
  cvc2Always,
  @JsonValue('CVC2_SUSPENDED')
  cvc2Suspended,
  @JsonValue('ACTIVE_SUSPENDED')
  activeSuspended,
  @JsonValue('EXPIRED')
  expired
}

const $MasterpassCardStatusMap = {
  MasterpassCardStatus.inactive: 'INACTIVE',
  MasterpassCardStatus.active: 'ACTIVE',
  MasterpassCardStatus.cvc2Always: 'CVC2_ALWAYS',
  MasterpassCardStatus.cvc2Suspended: 'CVC2_SUSPENDED',
  MasterpassCardStatus.activeSuspended: 'ACTIVE_SUSPENDED',
  MasterpassCardStatus.expired: 'EXPIRED'
};

enum MasterpassChannelType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('RECURRING')
  recurring,
  @JsonValue('WEB')
  web,
  @JsonValue('APP_IOS')
  appIos,
  @JsonValue('APP_ANDROID')
  appAndroid,
  @JsonValue('TVE')
  tve,
  @JsonValue('SMART_TV')
  smartTv,
  @JsonValue('SMART_DEVICE')
  smartDevice,
  @JsonValue('USSD')
  ussd,
  @JsonValue('IVR')
  ivr,
  @JsonValue('OFFLINE')
  offline,
  @JsonValue('OTHER')
  other
}

const $MasterpassChannelTypeMap = {
  MasterpassChannelType.recurring: 'RECURRING',
  MasterpassChannelType.web: 'WEB',
  MasterpassChannelType.appIos: 'APP_IOS',
  MasterpassChannelType.appAndroid: 'APP_ANDROID',
  MasterpassChannelType.tve: 'TVE',
  MasterpassChannelType.smartTv: 'SMART_TV',
  MasterpassChannelType.smartDevice: 'SMART_DEVICE',
  MasterpassChannelType.ussd: 'USSD',
  MasterpassChannelType.ivr: 'IVR',
  MasterpassChannelType.offline: 'OFFLINE',
  MasterpassChannelType.other: 'OTHER'
};

enum MasterpassCardRequired {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('NONE')
  none,
  @JsonValue('CVC2')
  cvc2,
  @JsonValue('THREE_DS')
  threeDs,
  @JsonValue('THREE_DS_AND_CVC2_OR_CVC2')
  threeDsAndCvc2OrCvc2,
  @JsonValue('THREE_DS_AND_CVC2')
  threeDsAndCvc2
}

const $MasterpassCardRequiredMap = {
  MasterpassCardRequired.none: 'NONE',
  MasterpassCardRequired.cvc2: 'CVC2',
  MasterpassCardRequired.threeDs: 'THREE_DS',
  MasterpassCardRequired.threeDsAndCvc2OrCvc2: 'THREE_DS_AND_CVC2_OR_CVC2',
  MasterpassCardRequired.threeDsAndCvc2: 'THREE_DS_AND_CVC2'
};

enum MasterpassUserStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('INACTIVE')
  inactive,
  @JsonValue('ACTIVE')
  active,
  @JsonValue('SUSPENDED')
  suspended
}

const $MasterpassUserStatusMap = {
  MasterpassUserStatus.inactive: 'INACTIVE',
  MasterpassUserStatus.active: 'ACTIVE',
  MasterpassUserStatus.suspended: 'SUSPENDED'
};

enum MasterpassFingerprintStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('NON_VALID')
  nonValid,
  @JsonValue('VALID')
  valid,
  @JsonValue('TXN_VERIFIED')
  txnVerified
}

const $MasterpassFingerprintStatusMap = {
  MasterpassFingerprintStatus.nonValid: 'NON_VALID',
  MasterpassFingerprintStatus.valid: 'VALID',
  MasterpassFingerprintStatus.txnVerified: 'TXN_VERIFIED'
};

enum AmountCategory {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('FIXED')
  fixed,
  @JsonValue('RANGE')
  range
}

const $AmountCategoryMap = {
  AmountCategory.fixed: 'FIXED',
  AmountCategory.range: 'RANGE'
};

enum DateCategory {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('DAILY')
  daily,
  @JsonValue('MONTHLY')
  monthly,
  @JsonValue('QUARTERLY')
  quarterly,
  @JsonValue('YEARLY')
  yearly,
  @JsonValue('MANUAL')
  manual
}

const $DateCategoryMap = {
  DateCategory.daily: 'DAILY',
  DateCategory.monthly: 'MONTHLY',
  DateCategory.quarterly: 'QUARTERLY',
  DateCategory.yearly: 'YEARLY',
  DateCategory.manual: 'MANUAL'
};

enum MyPaymentCardBrand {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('AMERICAN_EXPRESS')
  americanExpress,
  @JsonValue('MASTERCARD')
  mastercard,
  @JsonValue('VISA')
  visa,
  @JsonValue('MAESTRO')
  maestro,
  @JsonValue('MIR')
  mir,
  @JsonValue('JCB')
  jcb,
  @JsonValue('DINER_CLUB')
  dinerClub,
  @JsonValue('DISCOVERY')
  discovery,
  @JsonValue('UNION_PAY')
  unionPay,
  @JsonValue('HIPER')
  hiper,
  @JsonValue('HIPERCARD')
  hipercard,
  @JsonValue('ELO')
  elo,
  @JsonValue('UNKNOWN')
  unknown
}

const $MyPaymentCardBrandMap = {
  MyPaymentCardBrand.americanExpress: 'AMERICAN_EXPRESS',
  MyPaymentCardBrand.mastercard: 'MASTERCARD',
  MyPaymentCardBrand.visa: 'VISA',
  MyPaymentCardBrand.maestro: 'MAESTRO',
  MyPaymentCardBrand.mir: 'MIR',
  MyPaymentCardBrand.jcb: 'JCB',
  MyPaymentCardBrand.dinerClub: 'DINER_CLUB',
  MyPaymentCardBrand.discovery: 'DISCOVERY',
  MyPaymentCardBrand.unionPay: 'UNION_PAY',
  MyPaymentCardBrand.hiper: 'HIPER',
  MyPaymentCardBrand.hipercard: 'HIPERCARD',
  MyPaymentCardBrand.elo: 'ELO',
  MyPaymentCardBrand.unknown: 'UNKNOWN'
};
