enum EnvironmentMode {
  production,
  development,
}

class Environments {
  static const EnvironmentMode _currentEnvironments =
      EnvironmentMode.development;
  static const List<Map<String, dynamic>> _availableEnvironment = [
    {'env': EnvironmentMode.development, 'url': 'https://dummyjson.com/'},
    {'env': EnvironmentMode.production, 'url': 'https://dummyjson.com/'}
  ];

  static String getEnvironment() {
    return _availableEnvironment
        .firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )
        .values
        .last
        .toString();
  }
}
