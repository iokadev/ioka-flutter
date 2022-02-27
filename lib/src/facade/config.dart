enum IokaApiMode {
  staging,
  production,
}

class IokaConfiguration {
  IokaConfiguration({
    required this.mode,
    this.automaticallyGenerateTheme = false,
  });

  final IokaApiMode mode;
  final bool automaticallyGenerateTheme;

  String get baseUrl {
    switch (mode) {
      case IokaApiMode.staging:
        return 'https://stage-api.ioka.kz';
      case IokaApiMode.production:
        return 'https://api.ioka.kz';
    }
  }

  String get paymentConfirmationRedirectUrl {
    switch (mode) {
      case IokaApiMode.staging:
        return 'https://stage-checkout.ioka.kz/orders/';
      case IokaApiMode.production:
        return 'https://payments.ioka.kz/orders/';
    }
  }

  String get bindingConfirmationRedirectUrl {
    switch (mode) {
      case IokaApiMode.staging:
        return 'https://stage-checkout.ioka.kz/customers/';
      case IokaApiMode.production:
        return 'https://payments.ioka.kz/customers/';
    }
  }

  
}
