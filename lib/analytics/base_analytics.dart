abstract class BaseAnalytics {
  Map<String, dynamic>? updateOptions;

  BaseAnalytics();

  logEvent(String name, List<Type>? sendTo, {Map<String, dynamic>? properties = const {}});

  initialize();

  logPageName(String pageName, List<Type> sendTo, {Map<String, dynamic> properties = const {}});

  isSensitiveScreen(bool isSensitive, List<Type> sendTo, {Map<String, dynamic> properties = const {}});

  bool isInitialized = false;

  void identifyUser(String? uid);

  bool shouldSendToThisPlatform(List<Type>? allowedTypes) {
    if (allowedTypes == null || allowedTypes.isEmpty) return false;
    return allowedTypes.contains(this.runtimeType);
  }

  void setUserProperties(Map<String, dynamic> properties);

  void setUserPropertiesWithOptions(Map<String, dynamic> properties, String analyticOption);

  dispose();
}
