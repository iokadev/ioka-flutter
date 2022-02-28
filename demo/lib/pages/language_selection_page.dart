import 'package:demo/l10n/l10n.dart';
import 'package:demo/models/settings_model.dart';
import 'package:demo/pages/profile_page.dart';
import 'package:demo/widgets/separated_column.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsModel = context.watch<SettingsModel>();
    final l10n = DemoLocalizations.of(context);

    final locales = IokaLocalizations.localizations.keys.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(l10n.languageSelectionPageTitle),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          margin: EdgeInsets.zero,
          child: SeparatedColumn(
            itemCount: locales.length,
            separatorPadding: EdgeInsets.zero,
            builder: (context, i, radius) {
              final locale = locales[i];

              return CardRowWidget(
                onTap: () => settingsModel.locale = locale,
                borderRadius: radius,
                trailing: Radio(
                  groupValue: settingsModel.locale,
                  value: locale,
                  onChanged: (v) => settingsModel.locale = locale,
                ),
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(localeToName(locale)),
              );
            },
          ),
        ),
      ),
    );
  }
}
