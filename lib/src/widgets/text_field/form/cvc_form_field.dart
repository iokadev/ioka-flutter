import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/security_code.dart';
import 'package:credit_card_validator/validation_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';
import 'package:ioka/src/widgets/text_field/formatters/cvc_input_formatter.dart';

class CupertinoCvcFormField extends StatelessWidget {
  const CupertinoCvcFormField({
    Key? key,
    required this.onChanged,
    required this.cardType,
    this.onValidated,
    this.isEnabled = true,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final CreditCardType? cardType;
  final VoidCallback? onValidated;
  final bool isEnabled;

  ValidationResults getValidationResults(String value) => validateSecurityCode(
        value,
        cardType ?? CreditCardType.unknown,
      );

  @override
  Widget build(BuildContext context) {
    final maxLength = cardType == CreditCardType.amex ? 4 : 3;

    return FormField<String>(
      builder: (state) => IokaCupertinoTextField(
        hint: 'CVV',
        inputFormatters: CvcInputFormatter.formatters(maxLength),
        keyboardType: TextInputType.number,
        onChanged: (v) {
          if (onValidated != null && getValidationResults(v).isValid) {
            onValidated!();
          }

          onChanged(v);
        },
        formState: state,
        secure: true,
        obscureText: true,
        enabled: isEnabled,
        suffix: CupertinoButton(
          child: IokaIcon(
            IokaIcons.info,
            color: context.colors.grey,
          ),
          onPressed: () {},
        ),
      ),
      autovalidateMode: AutovalidateMode.disabled,
      initialValue: '',
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        final results = getValidationResults(value);

        return results.isPotentiallyValid ? null : 'Неверный CVV';
      },
    );
  }
}
