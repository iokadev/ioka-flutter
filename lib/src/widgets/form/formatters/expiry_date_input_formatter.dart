import 'package:flutter/services.dart';

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final value = newValue.text;

    String month;
    String? year;

    if (value.length >= 2) {
      month = value.substring(0, 2);
    } else {
      month = value;
    }

    if (value.length > 2) {
      year = value.substring(2);
    }

    var baseOffset = newValue.selection.baseOffset;

    if (baseOffset > 2) {
      baseOffset += 1;
    }

    return TextEditingValue(
      text: month + (year != null ? '/$year' : ''),
      selection: TextSelection.collapsed(offset: baseOffset),
    );
  }

  static List<TextInputFormatter> get formatters => [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(
          4,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
        ),
        ExpiryDateInputFormatter(),
      ];
}
