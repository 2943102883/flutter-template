import 'package:flutter/foundation.dart' show kDebugMode;

class Config {
  /// 连接超时时间
  static Duration connectTimeout = const Duration(seconds: 60);

  /// 响应超时时间
  static Duration receiveTimeout = const Duration(seconds: 60);

  /// 开发环境的URL
  static String devBaseUrl = 'http://175.178.27.89:9876/';

  /// 生产环境的URL
  static String prodBaseUrl = 'http://175.178.27.89:9876/';

  /// 是否是开发环境
  static bool isDev = kDebugMode;

  /// 打印CURL
  static bool printCURL = true;
}
