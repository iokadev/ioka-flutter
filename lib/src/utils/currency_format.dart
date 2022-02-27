String formatTengeAmount(int amount) {
  final whole = amount ~/ 100;
  final fraction = amount % 100;

  final wholeString = whole.toString();
  var wholeFormattedString = '';

  for (var i = 0; i < wholeString.length; i++) {
    wholeFormattedString += wholeString[i];

    if ((wholeString.length - i - 1) % 3 == 0 && i != wholeString.length - 1) {
      wholeFormattedString += ' ';
    }
  }

  if (fraction == 0) {
    return '$wholeFormattedString ₸';
  } else {
    return '$wholeFormattedString,$fraction ₸';
  }
}

String formatMaskedPan(String maskedPan) {
  return '•••• ${maskedPan.split('*').last}';
}