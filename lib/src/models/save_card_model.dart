import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';

class SaveCardModel extends ChangeNotifier {
  SaveCardModel({required this.customerAccessToken});

  final String customerAccessToken;

  final cardInputDataNotifier = ValueNotifier<CardInputData?>(null);
  CardInputData? get cardInputData => cardInputDataNotifier.value;

  final isInteractableNotifier = ValueNotifier<bool>(true);
  bool get isInteractable => isInteractableNotifier.value;

  void onChanged(CardInputData data) {
    cardInputDataNotifier.value = data;
  }

  Future<bool?> submit(BuildContext context) async {
    assert(cardInputData != null && cardInputData!.isValid);

    isInteractableNotifier.value = false;
    notifyListeners();

    try {
      var card = await Ioka.api.createBinding(
        customerAccessToken: customerAccessToken,
        pan: cardInputData!.cardNumber,
        expiryDate: cardInputData!.expiryDate,
        cvc: cardInputData!.cvc,
      );

      if (card.status == CardStatus.pending && card.action != null) {
        final newCard = await IokaNavigation.showBindingConfirmationView(
          context,
          cardId: card.id!,
          customerAccessToken: customerAccessToken,
          url: card.action!.url!,
        );

        if (newCard == null) {
          Navigator.pop(context);
          return false;
        }

        card = newCard;
      }

      if (card.status == CardStatus.approved) {
        _onSuccess(context, card: card);

        return true;
      } else {
        await _onFailure(
          context,
          reason: card.error?.message,
        );
      }
    } catch (e) {
      await _onFailure(
        context,
        reason: (e as dynamic).message,
      );
    }

    isInteractableNotifier.value = true;
    notifyListeners();

    return false;
  }

  Future<void> _onSuccess(
    BuildContext context, {
    required ExtendedCard card,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop(card);
  }

  Future<void> _onFailure(BuildContext context, {String? reason}) async {
    IokaToast.showError(
      context,
      message: reason ?? '',
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 88.0,
      ),
    );
  }

  @override
  void dispose() {
    cardInputDataNotifier.dispose();
    isInteractableNotifier.dispose();
    super.dispose();
  }
}
