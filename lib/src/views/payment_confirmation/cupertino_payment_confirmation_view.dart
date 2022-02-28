import 'package:flutter/cupertino.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/views/confirmation/cupertino_confirmation_view.dart';
import 'package:provider/provider.dart';

class CupertinoPaymentConfirmationView extends StatelessWidget {
  const CupertinoPaymentConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PaymentConfirmationModel>();
    return CupertinoConfirmationView(model: model);
  }
}
