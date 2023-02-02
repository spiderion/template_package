import 'base_analytics.dart';

/// A common default analytic proxy to use to capture analytics events
class AnalyticsProxy extends BaseAnalytics {
  final List<BaseAnalytics> _analyticList;
  bool enable;

  /// Pass a list of analytics implementations of [BaseAnalytics]
  /// If list is empty no analytics will be sent out to any element
  AnalyticsProxy(this._analyticList, {required this.enable}) : super();

  @override
  Future<void> logEvent(String? name, List<Type>? sendTo,
      {Map<String, dynamic>? properties = const {}}) async {
    if (name != null && name.isNotEmpty) {
      if (isInitialized == true) {
        await Future.forEach(_analyticList, (BaseAnalytics analyticPlatform) async {
          await analyticPlatform.logEvent(name, sendTo, properties: properties);
        });
      }
    }
  }

  ///  will need to be called before any analytics are sent out
  @override
  Future<void> initialize() async {
    if (!isInitialized && enable) {
      isInitialized = true;
      await Future.forEach(_analyticList, (BaseAnalytics analyticPlatform) async {
        await analyticPlatform.initialize();
      });
    }
  }

  @override
  Future<void> logPageName(String? pageName, List<Type> sendTo,
      {Map<String, dynamic> properties = const {}}) async {
    if (pageName == null || pageName.isEmpty) return;
    await Future.forEach(_analyticList, (BaseAnalytics analyticPlatform) async {
      await analyticPlatform.logPageName(pageName, sendTo, properties: properties);
    });
  }

  @override
  Future<void> identifyUser(String? uid) async {
    await Future.forEach(_analyticList, (BaseAnalytics analyticPlatform) async {
      await analyticPlatform.identifyUser(uid);
    });
  }

  @override
  Future<void> setUserProperties(Map<String, dynamic> properties) async {
    await Future.forEach(_analyticList, (BaseAnalytics analyticPlatform) async {
      await analyticPlatform.setUserProperties(properties);
    });
  }

  @override
  Future<void> setUserPropertiesWithOptions(Map<String, dynamic> properties, String analyticOption) async {
    await Future.forEach(_analyticList, (BaseAnalytics analyticPlatform) async {
      await analyticPlatform.setUserPropertiesWithOptions(properties, analyticOption);
    });
  }

  Future<void> dispose() async {
    await Future.forEach(_analyticList, (BaseAnalytics analyticPlatform) async {
      await analyticPlatform.dispose();
    });
  }

  @override
  isSensitiveScreen(bool isSensitive, List<Type> sendTo, {Map<String, dynamic> properties = const {}}) async {
    await Future.forEach(_analyticList, (BaseAnalytics analyticPlatform) async {
      await analyticPlatform.isSensitiveScreen(isSensitive, sendTo, properties: properties);
    });
  }
}
