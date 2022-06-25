import 'base_analytics.dart';

/// A common default analytic proxy to use to capture analytics events
class AnalyticsProxy extends BaseAnalytics {
  final List<BaseAnalytics> _analyticList;

  /// Pass a list of analytics implementations of [BaseAnalytics]
  /// If list is empty no analytics will be sent out to any element
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

  /// this will automatically be called on the constructor
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
