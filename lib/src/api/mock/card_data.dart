class MockCardData {
  const MockCardData({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvc,
    required this.requiresCvc,
    required this.emitter,
    required this.type,
  });

  final String cardNumber;
  final String expiryDate;
  final String cvc;

  final bool requiresCvc;

  final String emitter;
  final String type;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MockCardData &&
        other.cardNumber == cardNumber &&
        other.expiryDate == expiryDate &&
        other.cvc == cvc &&
        other.requiresCvc == requiresCvc &&
        other.emitter == emitter &&
        other.type == type;
  }

  @override
  int get hashCode {
    return cardNumber.hashCode ^
        expiryDate.hashCode ^
        cvc.hashCode ^
        requiresCvc.hashCode ^
        emitter.hashCode ^
        type.hashCode;
  }
}
