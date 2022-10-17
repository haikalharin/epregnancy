import 'default_env.dart';

class Configurations {
  static String _host = DefaultConfig.host;
  static String _imageHost = DefaultConfig.imageHost;
  static String _httpClientType = '';
  static String _wpUrl = DefaultConfig.wpUrl;
  static String _consumerKey = DefaultConfig.consumerKey;
  static String _consumerSecret = DefaultConfig.consumerSecret;
  static String _mode = DefaultConfig.mode;
  static bool _isShowChucker = DefaultConfig.isShowChucker;

  Future<void> setConfigurationValues(Map<String, dynamic> value) async {
    _host = value['host'] ?? DefaultConfig.host;
    _mode = value['mode'] ?? DefaultConfig.mode;
    _isShowChucker = value['isShowChucker'] ?? DefaultConfig.isShowChucker;
    _imageHost = value['image_host'] ?? DefaultConfig.imageHost;
    _httpClientType =
        value['http_client'] ?? DefaultConfig.httpClientType.toString();
    _wpUrl = value['wpUrl'] ?? DefaultConfig.wpUrl.toString();
    _consumerKey = value['consumerKey'] ?? DefaultConfig.consumerKey.toString();
    _consumerSecret =
        value['consumerSecret'] ?? DefaultConfig.consumerSecret.toString();
  }

  static String get host => _host;

  static String get mode => _mode;

  static bool get isShowChucker => _isShowChucker;

  static String get imageHost => _imageHost;

  static String get httpClientType => _httpClientType;

  static String get wpUrl => _wpUrl;

  static String get consumerKey => _consumerKey;

  static String get consumerSecret => _consumerSecret;
}
