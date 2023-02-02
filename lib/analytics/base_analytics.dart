/// Extend this class to make a custom version of your analytics implementation
abstract class BaseAnalytics {
  Map<String, dynamic>? updateOptions;

  BaseAnalytics();

  Future<void> logEvent(String name, List<Type>? sendTo, {Map<String, dynamic>? properties = const {}});

  Future<void> initialize();

  Future<void> logPageName(String pageName, List<Type> sendTo, {Map<String, dynamic> properties = const {}});

  isSensitiveScreen(bool isSensitive, List<Type> sendTo, {Map<String, dynamic> properties = const {}});

  bool isInitialized = false;

  Future<void> identifyUser(String? uid);

  bool shouldSendToThisPlatform(List<Type>? allowedTypes) {
    if (allowedTypes == null || allowedTypes.isEmpty) return false;
    return allowedTypes.contains(this.runtimeType);
  }

  Future<void> setUserProperties(Map<String, dynamic> properties);

  Future<void> setUserPropertiesWithOptions(Map<String, dynamic> properties, String analyticOption);

  Future<void> dispose();
}
