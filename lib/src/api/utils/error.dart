import 'dart:convert';

class IokaError {
  IokaError({
    required this.code,
    required this.message,
  });

  factory IokaError.fromMap(Map<String, dynamic> map) {
    return IokaError(
      code: map['code'] ?? '',
      message: map['message'] ?? '',
    );
  }

  factory IokaError.fromJson(String source) =>
      IokaError.fromMap(json.decode(source));

  final String code;
  final String message;

  IokaError copyWith({
    String? code,
    String? message,
  }) {
    return IokaError(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'IokaError(code: $code, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IokaError && other.code == code && other.message == message;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode;
}
