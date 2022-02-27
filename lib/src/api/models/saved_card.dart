import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/card_number.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/api.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';

class SavedCard {
  const SavedCard({
    required this.id,
    required this.customerId,
    required this.status,
    required this.createdAt,
    required this.panMasked,
    required this.expiryDate,
    required this.cvcRequired,
    this.paymentSystem,
    this.emitter,
  });

  SavedCard.fromExtendedCard(ExtendedCard card)
      : id = card.id!,
        customerId = card.customerId!,
        status = card.status!,
        createdAt = DateTime.parse(card.createdAt!),
        panMasked = card.panMasked!,
        expiryDate = card.expiryDate!,
        cvcRequired = card.cvcRequired!,
        paymentSystem = card.paymentSystem,
        emitter = card.emitter;

  final String id;
  final String customerId;
  final CardStatus status;
  final DateTime createdAt;
  final String panMasked;
  final String expiryDate;
  final String? paymentSystem;
  final String? emitter;
  final bool cvcRequired;

  CreditCardType get cardType {
    return validateCardNumber(panMasked.split('*').first).ccType;
  }

  String get formattedMaskedPan => formatMaskedPan(panMasked);
}
