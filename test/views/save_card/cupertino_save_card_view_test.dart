import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

import '../view_test_utils.dart';

Future<void> main() async {
  const customerAccessToken = 'token';

  group('CupertinoSaveCardView', () {
    autoGoldenTest(
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
