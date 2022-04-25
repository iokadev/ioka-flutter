/// Returns the value of an enum as a string.
/// 
/// Example:
/// - CurrencyEnum.KZT -> KZT
String enumToString(dynamic value) {
  return value.toString().split('.').last;
}
