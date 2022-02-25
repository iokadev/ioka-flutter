import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ioka/src/models/checkout_model.dart';
import 'package:ioka/src/utils/currency_format.dart';
import 'package:ioka/src/utils/lerp_implicit_animation_widget.dart';
import 'package:ioka/src/utils/multi_value_listenable_builder.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';
import 'package:ioka/src/widgets/text_field/form/cvc_form_field.dart';
import 'package:ioka/src/widgets/text_field/form/expiry_date_form_field.dart';
import 'package:ioka/src/widgets/text_field/form/pan_form_field.dart';
import 'package:provider/provider.dart';

class CupertinoCheckoutView extends StatelessWidget {
  const CupertinoCheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CheckoutModel>();

    return CupertinoPageScaffold(
      navigationBar: IokaCupertinoNavigationBar(
        middle: Text('К оплате ${formatTengeAmount(model.amount)}'),
      ),
      child: SafeArea(
        child: Form(
          key: model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: _CupertinoCheckoutViewInputs(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: KeyboardVisibilityBuilder(
                  builder: (context, isKeyboardVisible) {
                    return _CupertinoCheckoutViewActions(
                      isSafetyLabelVisible: !isKeyboardVisible,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CupertinoCheckoutViewInputs extends StatelessWidget {
  const _CupertinoCheckoutViewInputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CheckoutModel>();
    final isEnabled = model.isInteractable;

    return Column(
      children: [
        MultiValueListenableBuilder(
          listenables: [
            model.cardTypeNotifier,
            model.cardEmitterNotifier,
          ],
          builder: (context) => CupertinoPanFormField(
            isEnabled: isEnabled,
            onChanged: (v) => model.cardNumberNotifier.value = v,
            cardEmitter: model.cardEmitterNotifier.value,
            cardType: model.cardTypeNotifier.value,
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
                isEnabled: isEnabled,
                onChanged: (v) => model.cardExpiryDateNotifier.value = v,
                onValidated: () {
                  FocusScope.of(context).nextFocus();
                },
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: model.cardTypeNotifier,
                builder: (context, _, __) => CupertinoCvcFormField(
                  isEnabled: isEnabled,
                  onChanged: (v) => model.cardCvcNotifier.value = v,
                  cardType: model.cardTypeNotifier.value,
                  onValidated: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 40.0,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('Сохранить карту'),
            textColor: context.colors.textPrimary,
            trailing: ValueListenableBuilder(
              valueListenable: model.saveCardNotifier,
              builder: (context, _, __) => CupertinoSwitch(
                value: model.saveCardNotifier.value,
                activeColor:
                    isEnabled ? context.colors.primary : context.colors.grey,
                onChanged: isEnabled
                    ? (value) => model.saveCardNotifier.value = value
                    : null,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _CupertinoCheckoutViewActions extends StatelessWidget {
  const _CupertinoCheckoutViewActions({
    Key? key,
    this.isSafetyLabelVisible = true,
  }) : super(key: key);

  final bool isSafetyLabelVisible;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CheckoutModel>();

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56.0,
          child: ValueListenableBuilder(
            valueListenable: model.isValidNotifier,
            builder: (context, _, __) => LerpImplicitAnimationWidget<Color>(
              value:
                  model.isValid ? context.colors.primary : context.colors.grey,
              builder: (context, color) => CupertinoProgressButton(
                borderRadius: context.themeExtras.borderRadius,
                onPressed: model.isValid ? () => model.submit(context) : null,
                color: color,
                disabledColor: color,
                child: Text(
                  'Оплатить ${formatTengeAmount(model.amount)}',
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 100),
          alignment: Alignment.bottomCenter,
          crossFadeState: isSafetyLabelVisible
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: TransactionsSecureLabelWidget(),
          ),
          secondChild: const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}
