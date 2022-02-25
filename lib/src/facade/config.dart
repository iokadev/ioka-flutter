enum IokaApiMode {
  staging,
  production,
}

class IokaConfiguration {
  IokaConfiguration({required this.mode});

  final IokaApiMode mode;

  String get baseUrl {
    switch (mode) {
      case IokaApiMode.staging:
        return 'https://stage-api.ioka.kz';
      case IokaApiMode.production:
        return 'https://api.ioka.kz';
    }
  }
}
