class Environment {
  static const String appName = String.fromEnvironment('app_name', defaultValue: 'Line AI');
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');
}
