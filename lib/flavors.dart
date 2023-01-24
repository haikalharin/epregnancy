enum Flavor {
  DEVELOPMENT,
  PRODUCTION,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'Komunitaz dev';
      case Flavor.PRODUCTION:
        return 'Komunitaz';
      default:
        return 'title';
    }
  }

}
