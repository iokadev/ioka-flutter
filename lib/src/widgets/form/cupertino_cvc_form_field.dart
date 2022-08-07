import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/security_code.dart';
import 'package:credit_card_validator/validation_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CupertinoCvcFormField extends StatelessWidget {
  const CupertinoCvcFormField({
    Key? key,
    required this.onChanged,
    required this.cardType,
    this.prefix,
    this.onValidated,
    this.isEnabled = true,
    this.autofocus = false,
    this.fieldKey,
  }) : super(key: key);

  final GlobalKey<FormFieldState>? fieldKey;
  final ValueChanged<String> onChanged;
  final CreditCardType? cardType;
  final VoidCallback? onValidated;
  final Widget? prefix;
  final bool autofocus;
  final bool isEnabled;

  ValidationResults getValidationResults(String value) => validateSecurityCode(
        value,
        cardType ?? CreditCardType.unknown,
      );

  @override
  Widget build(BuildContext context) {
    final maxLength = cardType == CreditCardType.amex ? 4 : 3;

    return FormField<String>(
      key: fieldKey,
      builder: (state) => IokaCupertinoTextField(
        hint: context.l10n.cardCvcInputHint,
        inputFormatters: CvcInputFormatter.formatters(maxLength),
        keyboardType: TextInputType.number,
        onChanged: (v) {
          if (onValidated != null && getValidationResults(v).isValid) {
            onValidated!();
          }

          onChanged(v);
        },
        autofocus: autofocus,
        prefix: prefix,
        formState: state,
        secure: true,
        obscureText: true,
        enabled: isEnabled,
        suffix: Builder(
          builder: (context) => CupertinoButton(
            child: IokaIcon(
              IokaIcons.info,
              color: context.colors.grey,
            ),
            onPressed: () {
              showCvcTooltip(context);
            },
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.disabled,
      initialValue: '',
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        final results = getValidationResults(value);

        return results.isPotentiallyValid
            ? null
            : context.l10n.cardCvcInputError;
      },
    );
  }
}
