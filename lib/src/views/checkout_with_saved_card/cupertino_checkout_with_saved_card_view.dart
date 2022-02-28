import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart' as generated;
import 'package:provider/provider.dart';

Future<generated.ExtendedPayment?> showCvcConfirmationDialog(
  BuildContext context, {
  required CheckoutWithSavedCardModel model,
  IokaTheme? theme,
  Platform? platform,
  Locale? locale,
}) {
  return showIokaDialog<generated.ExtendedPayment?>(
    context,
    title: (context) => Text(context.l10n.cvcConfirmationDialogTitle),
    alignment: Alignment.bottomCenter,
    builder: (context) => ChangeNotifierProvider.value(
      value: model,
      child: const _CvcConfirmationDialogBody(),
    ),
    theme: theme,
    platform: platform,
    locale: locale,
  );
}

class _CvcConfirmationDialogBody extends StatelessWidget {
  const _CvcConfirmationDialogBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CheckoutWithSavedCardModel>(context);
    final card = model.savedCard;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoCvcFormField(
          onChanged: (v) => model.cvcNotifier.value = v,
          isEnabled: model.isInteractable,
          cardType: card.cardType,
          autofocus: true,
          prefix: Row(
            children: [
              const SizedBox(width: 16.0),
              CardTypeWidget(cardType: card.cardType),
              const SizedBox(width: 12.0),
              Text(
                card.formattedMaskedPan,
                style: context.typography.body,
              ),
              const SizedBox(width: 12.0),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ValueListenableBuilder(
          valueListenable: model.cvcNotifier,
          builder: (context, _, __) => IokaCupertinoProgressButton(
            onPressed: model.isValid ? () => model.submit(context) : null,
            child: Text(context.l10n.cvcConfirmationDialogSubmitAction),
          ),
        ),
      ],
    );
  }
}
