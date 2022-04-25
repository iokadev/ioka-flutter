import 'package:flutter/cupertino.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

class CupertinoCheckoutWithNewCardView extends StatelessWidget {
  const CupertinoCheckoutWithNewCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CheckoutWithNewCardModel>();
    final mediaQuery = MediaQuery.of(context);

    return CupertinoPageScaffold(
      navigationBar: IokaCupertinoNavigationBar(
        middle: Text(context.l10n.checkoutWithNewCardViewTitle(model.amount)),
      ),
      child: SafeArea(
        child: Form(
          key: model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: CardInputForm(
                    onChanged: model.onChanged,
                    isEnabled: model.isInteractable,
                    canSaveCard: model.canSaveCard,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _CupertinoCheckoutViewActions(
                  isSafetyLabelVisible: mediaQuery.viewInsets.bottom == 0.0,
                ),
              ),
            ],
          ),
        ),
      ),
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
    final model = context.watch<CheckoutWithNewCardModel>();

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56.0,
          child: ValueListenableBuilder(
            valueListenable: model.cardInputDataNotifier,
            builder: (context, CardInputData? cardData, __) {
              final isValid = cardData?.isValid ?? false;
              return IokaCupertinoProgressButton(
                onPressed: isValid ? () => model.submit(context) : null,
                child: Text(
                  context.l10n.checkoutWithNewCardViewPayAction(model.amount),
                ),
              );
            },
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
