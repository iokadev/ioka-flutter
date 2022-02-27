import 'package:flutter/services.dart';

class CvcInputFormatter {
  static List<TextInputFormatter> formatters(int maxLength) => [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(
          maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
        ),
      ];
}
