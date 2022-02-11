import 'base_analytics.dart';

class AnalyticsProxy extends BaseAnalytics {
  final List<BaseAnalytics> _analyticList;

  AnalyticsProxy(this._analyticList, {required bool enable}) : super() {
    if (enable) initialize();
  }

  @override
  logEvent(String? name, List<Type>? sendTo, {Map<String, dynamic>? properties = const {}}) {
    if (name != null && name.isNotEmpty) {
      if (isInitialized == true) {
        _analyticList.forEach((BaseAnalytics analyticPlatform) {
          analyticPlatform.logEvent(name, sendTo, properties: properties);
        });
      }
    }
  }

  @override
  void initialize() {
    if (!isInitialized) {
      isInitialized = true;
      _analyticList.forEach((BaseAnalytics analyticPlatform) {
        analyticPlatform.initialize();
      });
    }
  }

  @override
  logPageName(String? pageName, List<Type> sendTo, {Map<String, dynamic> properties = const {}}) {
    if (pageName == null || pageName.isEmpty) return;
    _analyticList.forEach((BaseAnalytics analyticPlatform) {
      analyticPlatform.logPageName(pageName, sendTo, properties: properties);
    });
  }

  @override
  void identifyUser(String? uid) {
    _analyticList.forEach((BaseAnalytics analyticPlatform) {
      analyticPlatform.identifyUser(uid);
    });
  }

  @override
  void setUserProperties(Map<String, dynamic> properties) {
    _analyticList.forEach((BaseAnalytics analyticPlatform) {
      analyticPlatform.setUserProperties(properties);
    });
  }

  @override
  void setUserPropertiesWithOptions(Map<String, dynamic> properties, String analyticOption) {
    _analyticList.forEach((BaseAnalytics analyticPlatform) {
      analyticPlatform.setUserPropertiesWithOptions(properties, analyticOption);
    });
  }

  dispose() {
    _analyticList.forEach((BaseAnalytics analyticPlatform) {
      analyticPlatform.dispose();
    });
  }

  @override
  isSensitiveScreen(bool isSensitive, List<Type> sendTo, {Map<String, dynamic> properties = const {}}) {
    _analyticList.forEach((BaseAnalytics analyticPlatform) {
      analyticPlatform.isSensitiveScreen(isSensitive, sendTo, properties: properties);
    });
  }
}
