import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/views/binding_confirmation/binding_confirmation_view.dart';
import 'package:provider/provider.dart';

typedef PlatformAwareWidgetBuilder = Widget Function(
  BuildContext context,
  Platform platform,
);

class IokaNavigation {
  static Future<ExtendedPayment?> showPaymentConfirmationView(
    BuildContext context, {
    required String orderAccessToken,
    required String paymentId,
    required String url,
    String? redirectUrl,
  }) async {
    final result = await Navigator.of(context).pushWithExistingViewWrapper(
      context,
      (context, platform) => ChangeNotifierProvider(
        create: (context) => PaymentConfirmationModel(
          orderAccessToken: orderAccessToken,
          paymentId: paymentId,
          url: url,
        ),
        child: const CupertinoPaymentConfirmationView(),
      ),
    );

    if (result is! ExtendedPayment) {
      return null;
    }

    return result;
  }

  static Future<ExtendedCard?> showBindingConfirmationView(
    BuildContext context, {
    required String customerAccessToken,
    required String cardId,
    required String url,
    String? redirectUrl,
  }) async {
    final result = await Navigator.of(context).pushWithExistingViewWrapper(
      context,
      (context, platform) => ChangeNotifierProvider(
        create: (context) => BindingConfirmationModel(
          customerAccessToken: customerAccessToken,
          cardId: cardId,
          url: url,
        ),
        child: const CupertinoBindingConfirmationView(),
      ),
    );

    if (result is! ExtendedCard) {
      return null;
    }

    return result;
  }

  static Future<void> showPaymentSuccessView(
    BuildContext context, {
    int? orderAmount,
    String? orderNumber,
  }) {
    return Navigator.of(context).pushWithExistingViewWrapper(
      context,
      (context, platform) => CupertinoPaymentSuccessView(
        orderNumber: orderNumber,
        orderAmount: orderAmount,
      ),
    );
  }

  static Future<bool> showPaymentFailureView(
    BuildContext context, {
    String? reason,
  }) async {
    final result = await Navigator.of(context).pushWithExistingViewWrapper(
      context,
      (context, platform) => CupertinoPaymentFailureView(
        reason: reason,
      ),
    );

    if (result != null && result) {
      return true;
    }

    return false;
  }
}

typedef _RouteBuilder<T> = Route<T> Function(
  BuildContext,
  WidgetBuilder,
  Platform,
);

extension IokaNavigationHelpers on NavigatorState {
  PageRoute<T> _buildPlatformAwarePageRoute<T>(
    BuildContext context,
    WidgetBuilder builder,
    Platform platform,
  ) {
    if (platform == Platform.material) {
      return MaterialPageRoute<T>(builder: builder);
    } else {
      return CupertinoPageRoute<T>(builder: builder);
    }
  }

  ModalRoute<T> _buildPlatformAwareDialogRoute<T>(
    BuildContext context,
    WidgetBuilder builder,
    Platform platform,
  ) {
    if (platform == Platform.material) {
      return DialogRoute<T>(context: context, builder: builder);
    } else {
      return CupertinoDialogRoute<T>(context: context, builder: builder);
    }
  }

  Future<T?> pushPlatformAware<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    Platform? platform,
    _RouteBuilder<T>? routeBuilder,
  }) {
    final _platform = platform ?? IokaThemeUtils.getPlatform(context);

    final _RouteBuilder<T> _routeBuilder =
        routeBuilder ?? _buildPlatformAwarePageRoute;

    return push<T>(
      _routeBuilder(
        context,
        (context) => builder(context, _platform),
        _platform,
      ),
    );
  }

  Future<T?> pushWithViewWrapper<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    required IokaTheme? theme,
    required Platform? platform,
    required Locale? locale,
    _RouteBuilder<T>? routeBuilder,
  }) {
    return pushPlatformAware(
      context,
      (context, platform) => IokaViewWrapper(
        platform: platform,
        theme: theme,
        locale: locale,
        child: builder(context, platform),
      ),
      platform: platform,
      routeBuilder: routeBuilder,
    );
  }

  Future<T?> pushWithExistingViewWrapper<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    IokaTheme? theme,
    Platform? platform,
    Locale? locale,
    _RouteBuilder<T>? routeBuilder,
  }) {
    final existingWrapper =
        context.findAncestorWidgetOfExactType<IokaViewWrapper>()!;

    return pushPlatformAware(
      context,
      (context, platform) => IokaViewWrapper(
        platform: existingWrapper.platform,
        theme: existingWrapper.theme,
        locale: existingWrapper.locale,
        child: builder(context, platform),
      ),
      platform: platform ?? existingWrapper.platform,
      routeBuilder: routeBuilder,
    );
  }

  Future<T?> pushWithAutomaticViewWrapper<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    IokaTheme? theme,
    Platform? platform,
    Locale? locale,
    _RouteBuilder<T>? routeBuilder,
  }) async {
    final existingWrapper =
        context.findAncestorWidgetOfExactType<IokaViewWrapper>();

    if (existingWrapper != null) {
      return pushWithExistingViewWrapper(
        context,
        builder,
        theme: theme,
        platform: platform,
        locale: locale,
        routeBuilder: routeBuilder,
      );
    }

    return pushWithViewWrapper(
      context,
      builder,
      theme: theme,
      platform: platform,
      locale: locale,
      routeBuilder: routeBuilder,
    );
  }

  Future<T?> pushDialogWithViewWrapper<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    required IokaTheme? theme,
    required Platform? platform,
    required Locale? locale,
  }) {
    return pushWithViewWrapper(
      context,
      builder,
      theme: theme,
      platform: platform,
      locale: locale,
      routeBuilder: _buildPlatformAwareDialogRoute,
    );
  }


  Future<T?> pushDialogWithExistingViewWrapper<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    IokaTheme? theme,
    Platform? platform,
    Locale? locale,
  }) {
    return pushWithExistingViewWrapper(
      context,
      builder,
      theme: theme,
      platform: platform,
      locale: locale,
      routeBuilder: _buildPlatformAwareDialogRoute,
    );
  }

  Future<T?> pushDialogWithAutomaticViewWrapper<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    IokaTheme? theme,
    Platform? platform,
    Locale? locale,
  }) {
    return pushWithAutomaticViewWrapper(
      context,
      builder,
      theme: theme,
      platform: platform,
      locale: locale,
      routeBuilder: _buildPlatformAwareDialogRoute,
    );
  }

}
