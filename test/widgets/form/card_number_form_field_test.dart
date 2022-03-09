import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';

import '../../views/view_test_utils.dart';

void main() {
  group('CupertinoCardNumberFormField', () {
    autoGoldenTest(
      name: 'cupertino_card_number_form_field',
      child: CupertinoCardNumberFormField(onChanged: (v) {}),
    );
  });
}
