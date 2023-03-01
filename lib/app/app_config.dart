class AppConfig {
  final String applicationName;

  static AppConfig _instance = AppConfig._internal('');

  factory AppConfig({
    required String applicationName,
  }) {
    _instance = AppConfig._internal(
      applicationName,
    );
    return _instance;
  }

  AppConfig._internal(
    this.applicationName,
  );

  static AppConfig get instance {
    return _instance;
  }

  // Environment Flavor Config
  static AppConfig dev() {
    return AppConfig(
      applicationName: 'GruChangGold',
    );
  }

  @override
  String toString() {
    return 'AppConfig{applicationName: $applicationName}';
  }
}
