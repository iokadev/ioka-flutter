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
            initialUrl: model.urlWithRedirect,
            onWebViewCreated: model.onControllerInitialized,
            navigationDelegate: (v) => model.navigationDelegate(context, v),
            javascriptMode: JavascriptMode.unrestricted,
          ),
          ValueListenableBuilder(
            valueListenable: model.isLoadingNotifier,
            builder: (context, bool isLoading, _) {
              return IgnorePointer(
                ignoring: !isLoading,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  opacity: isLoading ? 1.0 : 0.0,
                  child: Container(
                    color: context.colors.background,
                    alignment: Alignment.center,
                    child: const CupertinoActivityIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
