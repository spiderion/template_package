import 'package:template_package/template_package.dart';

class MyCustomEvent extends BaseBlocEvent {
  final String? dataFromUi;

  MyCustomEvent(String? analyticEventName, {required this.dataFromUi}) : super(analyticEventName);
}

class MyButtonTapCustomEvent extends BaseBlocEvent {
  final dynamic dataFromUi;

  MyButtonTapCustomEvent(String analytic, {this.dataFromUi}) : super(analytic);
}
