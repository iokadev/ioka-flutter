import 'package:flutter/services.dart';

class PanInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final pan = newValue.text;

    final baseOffset = newValue.selection.baseOffset;
    var baseOffsetDiff = 0;
    var newPan = '';

    for (var i = 0; i < pan.length; i++) {
      newPan += pan[i];

      if ((i + 1) % 4 == 0 && i != pan.length - 1) {
        newPan += ' ';

        if (i < baseOffset) {
          baseOffsetDiff += 1;
        }
      }
    }

    return TextEditingValue(
      text: newPan,
      selection: TextSelection.collapsed(
        offset: baseOffset + baseOffsetDiff,
      ),
    );
  }

  static List<TextInputFormatter> get formatters => [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(
          19,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
        ),
        PanInputFormatter(),
      ];
}
