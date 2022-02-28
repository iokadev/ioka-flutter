import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/card_number.dart';
import 'package:credit_card_validator/expiration_date.dart';
import 'package:credit_card_validator/security_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:ioka/ioka.dart';

class CardInputForm extends StatefulWidget {
  const CardInputForm({
    Key? key,
    required this.onChanged,
    this.isEnabled = true,
    this.canSaveCard = false,
  }) : super(key: key);

  final ValueChanged<CardInputData> onChanged;
  final bool isEnabled;
  final bool canSaveCard;

  @override
  State<CardInputForm> createState() => _CardInputFormState();
}

class _CardInputFormState extends State<CardInputForm> {
  final _cardNumberNotifier = ValueNotifier<String?>(null);
  final _cardExpiryDateNotifier = ValueNotifier<String?>(null);
  final _cardCvcNotifier = ValueNotifier<String?>(null);
  final _cardBinNotifier = ValueNotifier<String?>(null);
  final _cardTypeNotifier = ValueNotifier<CreditCardType?>(null);
  final _cardEmitterNotifier = ValueNotifier<String?>(null);
  final _saveCardNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _cardNumberNotifier.addListener(_onChanged);
    _cardExpiryDateNotifier.addListener(_onChanged);
    _cardCvcNotifier.addListener(_onChanged);
    _cardBinNotifier.addListener(_onBinChanged);
    _cardTypeNotifier.addListener(_onChanged);
    _cardEmitterNotifier.addListener(_onChanged);
    _saveCardNotifier.addListener(_onChanged);
  }

  void _onChanged() {
    final cardNumberValidationResult = validateCardNumber(
      _cardNumberNotifier.value ?? '',
    );

    _cardTypeNotifier.value = cardNumberValidationResult.ccType;

    if (_cardNumberNotifier.value != null &&
        _cardNumberNotifier.value!.length >= 6) {
      _cardBinNotifier.value = _cardNumberNotifier.value!.substring(0, 6);
    } else {
      _cardBinNotifier.value = null;
    }

    final data = CardInputData(
      cardNumber: _cardNumberNotifier.value ?? '',
      expiryDate: _cardExpiryDateNotifier.value ?? '',
      cvc: _cardCvcNotifier.value ?? '',
      bin: _cardBinNotifier.value,
      emitter: _cardEmitterNotifier.value,
      isSaved: _saveCardNotifier.value,
      type: _cardTypeNotifier.value,
    );

    widget.onChanged(data);
  }

  Future<void> _onBinChanged() async {
    try {
      if (_cardBinNotifier.value == null ||
          _cardBinNotifier.value!.length < 6) {
        _cardEmitterNotifier.value = null;
        return;
      }

      final info = await Ioka.instance.api.getEmitterByBinCode(
        binCode: _cardBinNotifier.value!,
      );

      _cardEmitterNotifier.value = info.emitterCode;
    } catch (e) {
      _cardEmitterNotifier.value = null;
    }
  }

  @override
  void dispose() {
    _cardNumberNotifier.dispose();
    _cardExpiryDateNotifier.dispose();
    _cardCvcNotifier.dispose();
    _cardBinNotifier.dispose();
    _cardTypeNotifier.dispose();
    _cardEmitterNotifier.dispose();
    _saveCardNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultiValueListenableBuilder(
          listenables: [
            _cardTypeNotifier,
            _cardEmitterNotifier,
          ],
          builder: (context) => CupertinoCardNumberFormField(
            isEnabled: widget.isEnabled,
            onChanged: (v) => _cardNumberNotifier.value = v,
            cardEmitter: _cardEmitterNotifier.value,
            cardType: _cardTypeNotifier.value,
            onValidated: () {
              FocusScope.of(context).nextFocus();
            },
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: CupertinoExpiryDateFormField(
                isEnabled: widget.isEnabled,
                onChanged: (v) => _cardExpiryDateNotifier.value = v,
                onValidated: () {
                  FocusScope.of(context).nextFocus();
                },
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _cardTypeNotifier,
                builder: (context, _, __) => CupertinoCvcFormField(
                  isEnabled: widget.isEnabled,
                  onChanged: (v) => _cardCvcNotifier.value = v,
                  cardType: _cardTypeNotifier.value,
                  onValidated: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ],
        ),
        if (widget.canSaveCard) ...[
          const SizedBox(height: 8.0),
          SizedBox(
            height: 40.0,
            child: CupertinoFormRow(
              padding: EdgeInsets.zero,
              prefix: Text(context.l10n.cardInputFormSaveCardLabel),
              child: ValueListenableBuilder(
                valueListenable: _saveCardNotifier,
                builder: (context, _, __) => CupertinoSwitch(
                  value: _saveCardNotifier.value,
                  activeColor: widget.isEnabled
                      ? context.colors.primary
                      : context.colors.grey,
                  onChanged: widget.isEnabled
                      ? (value) => _saveCardNotifier.value = value
                      : null,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class CardInputData {
  const CardInputData({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvc,
    required this.isSaved,
    this.bin,
    this.type,
    this.emitter,
  });

  final String cardNumber;
  final String expiryDate;
  final String cvc;
  final String? bin;
  final CreditCardType? type;
  final String? emitter;
  final bool isSaved;

  bool get isValid {
    return validateCardNumber(cardNumber).isValid &&
        validateExpirationDate(expiryDate).isValid &&
        validateSecurityCode(cvc, type ?? CreditCardType.unknown).isValid;
  }
}
