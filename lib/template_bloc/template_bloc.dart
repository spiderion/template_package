import 'package:template_package/template_package.dart';

abstract class TemplateBloc extends BaseBloc {
  final BaseAnalytics analytics;
  final List<Type>? analyticFrameworkTypes;

  TemplateBloc(this.analytics, {this.analyticFrameworkTypes});

  /// this will automatically send the event received from the UI to your analytics implementation
  /// if you passed the type list to your Template bloc when extending it
  @override
  void postUiEvent(BaseBlocEvent event) {
    if (event.analyticEventName?.isNotEmpty == true) {
      analytics.logEvent(event.analyticEventName!.toLowerCase(), [...?analyticFrameworkTypes],
          properties: event.eventProperties ?? {});
    }
  }

  /// Useful function to log an event without using the analytics directly
  void logEvent(String name, {Map<String, dynamic>? properties, List<Type>? sendTo}) =>
      analytics.logEvent(name, sendTo, properties: properties);

  /// Used in the BaseWidgetImplementation
  void addEvent(BaseBlocEvent event) => super.event.add(event);
}
