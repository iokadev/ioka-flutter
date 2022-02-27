import 'package:demo/api/api.dart';
import 'package:demo/l10n/l10n.dart';
import 'package:demo/pages/delete_card_dialog.dart';
import 'package:demo/pages/profile_page.dart';
import 'package:demo/widgets/saved_cards_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

class SavedCardsPage extends StatefulWidget {
  const SavedCardsPage({Key? key}) : super(key: key);

  @override
  State<SavedCardsPage> createState() => _SavedCardsPageState();
}

class _SavedCardsPageState extends State<SavedCardsPage> {
  var _isLoading = true;
  String? _customerAccessToken;
  List<SavedCard>? _cards;

  @override
  void initState() {
    super.initState();
    _loadSavedCards();
  }

  Future<void> _loadSavedCards() async {
    setState(() => _isLoading = true);

    try {
      _customerAccessToken = await DemoApi.instance.getProfile();
      _cards = await Ioka.instance.getSavedCards(
        customerAccessToken: _customerAccessToken!,
      );
    } catch (e) {
      // Show error
      print(e);
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = DemoLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(l10n.savedCardsPageTitle),
      ),
      body: _cards == null
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0) +
                  MediaQuery.of(context).viewPadding.copyWith(top: 0.0),
              child: Card(
                margin: EdgeInsets.zero,
                child: SavedCardsList(
                  cards: _cards!,
                  cardTrailingBuilder: (context, card) => SizedBox(
                    width: 32.0,
                    height: 32.0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: IokaIcon(IokaIcons.remove,
                          color: theme.colorScheme.error),
                      onPressed: () async {
                        final isDeleted = await showDeleteSavedCardDialog(
                          context,
                          savedCard: card,
                          customerAccessToken: _customerAccessToken!,
                        );

                        if (isDeleted) {
                          _cards!.remove(card);
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  trailingBuilder: (context, borderRadius) => CardRowWidget(
                    onTap: () async {
                      final card = await Ioka.instance.saveNewCard(
                        context: context,
                        customerAccessToken: _customerAccessToken!,
                      );

                      if (card != null) {
                        _cards!.add(card);
                        setState(() {});
                      }
                    },
                    borderRadius: borderRadius,
                    leading: IokaIcon(
                      IokaIcons.plusAlt,
                      color: theme.disabledColor,
                    ),
                    trailing: IokaIcon(
                      IokaIcons.angleRight,
                      color: theme.disabledColor,
                    ),
                    child: Text(l10n.savedCardsPageAddCardAction),
                  ),
                ),
              ),
            ),
    );
  }
}
