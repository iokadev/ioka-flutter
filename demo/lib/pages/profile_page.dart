import 'package:demo/l10n/l10n.dart';
import 'package:demo/models/settings_model.dart';
import 'package:demo/pages/language_selection_page.dart';
import 'package:demo/pages/saved_cards_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsModel = context.watch<SettingsModel>();
    final l10n = DemoLocalizations.of(context);

    final iconColor = theme.disabledColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(l10n.profilePageTitle),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              child: CardRowWidget(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SavedCardsPage(),
                  ),
                ),
                leading: IokaIcon(
                  IokaIcons.creditCard,
                  color: theme.textTheme.bodyText2?.color,
                ),
                trailing: IokaIcon(
                  IokaIcons.angleRight,
                  color: iconColor,
                ),
                child: Text(l10n.savedCardsPageTitle),
              ),
            ),
            const SizedBox(height: 8.0),
            Card(
              margin: EdgeInsets.zero,
              child: CardRowWidget(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const LanguageSelectionPage(),
                  ),
                ),
                leading: IokaIcon(
                  IokaIcons.globe,
                  color: iconColor,
                ),
                trailing: Row(
                  children: [
                    Text(
                      settingsModel.localeName,
                      style: theme.textTheme.subtitle1!.copyWith(
                        color: iconColor,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    IokaIcon(
                      IokaIcons.angleRight,
                      color: iconColor,
                    ),
                  ],
                ),
                child: Text(l10n.languageSelectionPageTitle),
              ),
            ),
            const SizedBox(height: 8.0),
            Card(
              margin: EdgeInsets.zero,
              child: CardRowWidget(
                leading: IokaIcon(
                  IokaIcons.moon,
                  color: iconColor,
                ),
                trailing: CupertinoSwitch(
                  onChanged: (v) {
                    settingsModel.themeMode =
                        v ? ThemeMode.dark : ThemeMode.light;
                  },
                  value: settingsModel.brightness == Brightness.dark,
                  activeColor: theme.colorScheme.primary,
                ),
                child: Text(l10n.darkTheme),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardRowWidget extends StatelessWidget {
  const CardRowWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.leading,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      customBorder:
          borderRadius == null ? Theme.of(context).cardTheme.shape : null,
      child: Padding(
        padding: padding,
        child: SizedBox(
          height: 56.0,
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: 14.0),
              ],
              Expanded(
                child: DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 16.0),
                  child: child,
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 14.0),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
