class Env {
  Env._();

  static const appName = String.fromEnvironment('DOG_APP_NAME', defaultValue: 'Random Dogs');
  static const http = _HttpConfig();
}

class _HttpConfig {
  const _HttpConfig();

  final baseUrl = const String.fromEnvironment('BASE_URL');
  final connectTimeout = const Duration(seconds: 15);
  final receiveTimeout = const Duration(seconds: 15);
  final sendTimeout = const Duration(seconds: 15);
}
