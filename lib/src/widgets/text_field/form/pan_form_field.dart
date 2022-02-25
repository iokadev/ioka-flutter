import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/card_number.dart';
import 'package:credit_card_validator/validation_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';
import 'package:ioka/src/widgets/text_field/formatters/pan_input_formatter.dart';

class CupertinoPanFormField extends StatelessWidget {
  const CupertinoPanFormField({
    Key? key,
    required this.onChanged,
    this.onValidated,
    this.cardType,
    this.cardEmitter,
    this.isEnabled = true,
  }) : super(key: key);

  final CreditCardType? cardType;
  final String? cardEmitter;
  final ValueChanged<String> onChanged;
  final VoidCallback? onValidated;
  final bool isEnabled;

  CCNumValidationResults getValidationResults(String value) =>
      validateCardNumber(value);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (state) => IokaCupertinoTextField(
        hint: 'Введите номер карты',
        inputFormatters: PanInputFormatter.formatters,
        keyboardType: TextInputType.number,
        onChanged: (v) {
          if (onValidated != null && getValidationResults(v).isValid) {
            onValidated!();
          }

          onChanged(v);
        },
        formState: state,
        enabled: isEnabled,
        suffix: Row(
          children: [
            if (cardEmitter != null) ...[
              CardEmitterWidget(cardEmitter: cardEmitter),
              const SizedBox(width: 8.0),
            ],
            if (cardType != null) ...[
              CardTypeWidget(cardType: cardType),
              const SizedBox(width: 16.0),
            ],
          ],
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: '',
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        final results = getValidationResults(value);

        return results.isPotentiallyValid ? null : 'Неверный номер карты';
      },
    );
  }
}
