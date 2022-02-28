enum IokaApiMode {
  staging,
  production,
}

class IokaConfiguration {
  IokaConfiguration({
    this.automaticallyGenerateTheme = false,
  });

  final bool automaticallyGenerateTheme;
}

class IokaInternalConfiguration extends IokaConfiguration {
  IokaInternalConfiguration({
    required this.mode,
    bool automaticallyGenerateTheme = false,
  }) : super(automaticallyGenerateTheme: automaticallyGenerateTheme);

  IokaInternalConfiguration.fromConfiguration(IokaConfiguration configuration)
      : this(
          mode: configuration.automaticallyGenerateTheme
              ? IokaApiMode.production
              : IokaApiMode.staging,
          automaticallyGenerateTheme: configuration.automaticallyGenerateTheme,
        );

  final IokaApiMode mode;

  String get baseUrl {
    switch (mode) {
      case IokaApiMode.staging:
        return 'https://stage-api.ioka.kz';
      case IokaApiMode.production:
        return 'https://api.ioka.kz';
      default:
        throw Exception('[mode] was not initialized');
    }
  }

  String get paymentConfirmationRedirectUrl {
    switch (mode) {
      case IokaApiMode.staging:
        return 'https://stage-checkout.ioka.kz/orders/';
      case IokaApiMode.production:
        return 'https://payments.ioka.kz/orders/';
      default:
        throw Exception('[mode] was not initialized');
    }
  }

  String get bindingConfirmationRedirectUrl {
    switch (mode) {
      case IokaApiMode.staging:
        return 'https://stage-checkout.ioka.kz/customers/';
      case IokaApiMode.production:
        return 'https://payments.ioka.kz/customers/';
      default:
        throw Exception('[mode] was not initialized');
    }
  }
}
