import 'package:base_bloc/bloc/base_bloc.dart';
import 'package:base_bloc/bloc/event.dart';
import 'package:template_package/analytics/base_analytics.dart';
import 'package:template_package/template_package.dart';

abstract class TemplateBloc extends BaseBloc {
  final BaseAnalytics analytics;
  final List<Type>? analyticFrameworkTypes;

  TemplateBloc(this.analytics, {this.analyticFrameworkTypes});

  @override
  void postUiEvent(BaseBlocEvent event) {
    if (event.analyticEventName?.isNotEmpty == true) {
      analytics.logEvent(event.analyticEventName!.toLowerCase(), [...?analyticFrameworkTypes]);
    }
  }

  void addEvent(BaseBlocEvent event) => super.event.add(event);
}
