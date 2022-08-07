import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/card_number.dart';
import 'package:credit_card_validator/validation_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CupertinoCardNumberFormField extends StatelessWidget {
  const CupertinoCardNumberFormField({
    Key? key,
    required this.onChanged,
    this.onScanned,
    this.onValidated,
    this.cardType,
    this.cardEmitter,
    this.isEnabled = true,
    this.fieldKey,
  }) : super(key: key);

  final GlobalKey<FormFieldState>? fieldKey;
  final CreditCardType? cardType;
  final String? cardEmitter;
  final ValueChanged<String> onChanged;
  final ValueChanged<CardInputData>? onScanned;
  final VoidCallback? onValidated;
  final bool isEnabled;

  CCNumValidationResults getValidationResults(String value) =>
      validateCardNumber(value);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      key: fieldKey,
      builder: (state) => IokaCupertinoTextField(
        hint: context.l10n.cardNumberInputHint,
        inputFormatters: PanInputFormatter.formatters,
        keyboardType: TextInputType.number,
        onChanged: (v) {
          if (onValidated != null && getValidationResults(v).isValid) {
            onValidated!();
          }

          onChanged(v.replaceAll(' ', ''));
        },
        formState: state,
        enabled: isEnabled,
        secure: true,
        suffix: Row(
          children: [
            CardEmitterWidget(cardEmitter: cardEmitter),
            const SizedBox(width: 8.0),
            CardTypeWidget(cardType: cardType),
            if (onScanned != null) ...[
              _CardScanButton(
                onScanned: isEnabled ? onScanned : null,
              ),
            ] else ...[
              const SizedBox(width: 8.0),
            ],
          ],
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: '',
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        final results = getValidationResults(value);

        return results.isPotentiallyValid
            ? null
            : context.l10n.cardNumberInputError;
      },
    );
  }
}

class _CardScanButton extends StatelessWidget {
  const _CardScanButton({
    Key? key,
    required this.onScanned,
  }) : super(key: key);

  final ValueChanged<CardInputData>? onScanned;

  Future<void> _scanCard() async {
    final result = await CardScanner.scanCard(
      scanOptions: const CardScanOptions(
        scanCardHolderName: false,
        validCardsToScanBeforeFinishingScan: 1,
      ),
    );

    if (result != null) {
      onScanned!(
        CardInputData.scanner(
          cardNumber: result.cardNumber,
          expiryDate: result.expiryDate,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onScanned != null ? _scanCard : null,
      child: IokaIcon(
        IokaIcons.camera,
        color: context.colors.primary,
      ),
    );
  }
}
