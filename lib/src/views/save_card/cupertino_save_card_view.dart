import 'package:flutter/cupertino.dart';
import 'package:functional_listener/functional_listener.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

class CupertinoSaveCardView extends StatelessWidget {
  const CupertinoSaveCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SaveCardModel>();

    return CupertinoPageScaffold(
      navigationBar: IokaCupertinoNavigationBar(
        middle: Text(context.l10n.saveCardViewTitle),
      ),
      child: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: CardInputForm(
                    onChanged: model.onChanged,
                    isEnabled: model.isInteractable,
                    canSaveCard: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 56.0,
                  child: ValueListenableBuilder(
                    valueListenable: model.cardInputDataNotifier
                        .map((v) => v != null && v.isValid),
                    builder: (context, bool isValid, _) {
                      return IokaCupertinoProgressButton(
                        onPressed: isValid ? () => model.submit(context) : null,
                        child: Text(context.l10n.saveCardViewSaveAction),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
