// config.dart
String get apiHost {
  bool isProd = const bool.fromEnvironment('dart.vm.product');
  if (isProd) {
    return 'https://www.kindacode.com/api/some-path';
  }

  return "https://localhost/api/some-path";
}