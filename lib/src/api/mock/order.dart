import 'package:ioka/src/api/api.dart';

class MockOrder {
  const MockOrder({
    required this.id,
    required this.amount,
    required this.status,
  });

  final String id;
  final int amount;
  final OrderStatus status;

  MockOrder copyWith({
    String? id,
    int? amount,
    OrderStatus? status,
  }) {
    return MockOrder(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MockOrder &&
        other.id == id &&
        other.amount == amount &&
        other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ amount.hashCode ^ status.hashCode;
}
