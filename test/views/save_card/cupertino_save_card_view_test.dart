import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

import '../../test_utils.dart';
import '../view_test_utils.dart';

Widget _buildWidget({
  required String customerAccessToken,
  Brightness? brightness,
}) {
  return viewWrapper(
    brightness: brightness,
    child: ChangeNotifierProvider(
      create: (_) => SaveCardModel(
        customerAccessToken: customerAccessToken,
      ),
      builder: (_, __) => const CupertinoSaveCardView(),
    ),
  );
}

Future<void> main() async {
  const customerAccessToken = 'token';

  group('CupertinoSaveCardView', () {
    autoGoldenTestViewWithDifferentParameters(
      name: 'cupertino_save card_view',
      child: ChangeNotifierProvider(
        create: (_) => SaveCardModel(
          customerAccessToken: customerAccessToken,
        ),
        builder: (_, __) => const CupertinoSaveCardView(),
      ),
    );
  });
}
