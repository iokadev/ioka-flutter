import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

Future<bool> showDeleteSavedCardDialog(
  BuildContext context, {
  required SavedCard savedCard,
  required String customerAccessToken,
}) async {
  final result = await showDialog(
    context: context,
    builder: (_) => _DeleteSavedCardsDialog(
      savedCard: savedCard,
      customerAccessToken: customerAccessToken,
    ),
  );

  if(result != null && result) {
    return true;
  }

  return false;
}

class _DeleteSavedCardsDialog extends StatelessWidget {
  const _DeleteSavedCardsDialog({
    Key? key,
    required this.savedCard,
    required this.customerAccessToken,
  }) : super(key: key);

  final String customerAccessToken;
  final SavedCard savedCard;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IokaIcon(
              IokaIcons.remove,
              color: theme.colorScheme.error,
              size: 56.0,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Вы уверены, что хотите удалить карту ${savedCard.formattedMaskedPan}?',
              style: theme.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 48.0,
              child: CupertinoProgressButton(
                color: theme.colorScheme.error,
                borderRadius: BorderRadius.circular(8.0),
                onPressed: () async {
                  await Ioka.instance.deleteSavedCard(
                    customerAccessToken: customerAccessToken,
                    cardId: savedCard.id,
                  );

                  Navigator.of(context).pop(true);
                },
                child: Text('Удалить'),
              ),
            ),
            const SizedBox(height: 4.0),
            SizedBox(
              width: double.infinity,
              height: 48.0,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Отмена',
                  style: theme.textTheme.subtitle2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
