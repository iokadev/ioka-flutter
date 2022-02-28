import 'package:flutter/cupertino.dart';
import 'package:ioka/src/models/confirmation_model.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CupertinoConfirmationView extends StatelessWidget {
  const CupertinoConfirmationView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ConfirmationModel model;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: IokaCupertinoNavigationBar(
        middle: Text(context.l10n.paymentConfirmationViewTitle),
      ),
      child: Stack(
        children: [
          WebView(
            initialUrl: model.url,
            onWebViewCreated: model.onControllerInitialized,
            onPageFinished: (v) => model.onPageFinished(context, v),
            javascriptMode: JavascriptMode.unrestricted,
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: model.isLoadingNotifier,
              builder: (context, bool isLoading, _) {
                if (isLoading) {
                  return const CupertinoActivityIndicator();
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
