import 'package:flutter/cupertino.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/views/confirmation/cupertino_confirmation_view.dart';
import 'package:provider/provider.dart';


class CupertinoBindingConfirmationView extends StatelessWidget {
  const CupertinoBindingConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BindingConfirmationModel>();
    return CupertinoConfirmationView(model: model);
  }
}
