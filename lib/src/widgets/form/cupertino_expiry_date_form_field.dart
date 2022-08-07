import 'package:credit_card_validator/expiration_date.dart';
import 'package:credit_card_validator/validation_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CupertinoExpiryDateFormField extends StatelessWidget {
  const CupertinoExpiryDateFormField({
    Key? key,
    required this.onChanged,
    this.onValidated,
    this.isEnabled = true,
    this.fieldKey,
  }) : super(key: key);

  final GlobalKey<FormFieldState>? fieldKey;
  final ValueChanged<String> onChanged;
  final VoidCallback? onValidated;
  final bool isEnabled;

  ValidationResults getValidationResults(String value) =>
      validateExpirationDate(value);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      key: fieldKey,
      builder: (state) => IokaCupertinoTextField(
        hint: context.l10n.cardExpiryDateInputHint,
        inputFormatters: ExpiryDateInputFormatter.formatters,
        keyboardType: TextInputType.number,
        onChanged: (v) {
          if (onValidated != null && getValidationResults(v).isValid) {
            onValidated!();
          }

          onChanged(v);
        },
        enabled: isEnabled,
        formState: state,
        secure: true,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: '',
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        final result = getValidationResults(value);

        return result.isPotentiallyValid
            ? null
            : context.l10n.cardExpiryDateInputError;
      },
    );
  }
}
