import 'package:template_package/template_package.dart';

/// Use [BaseBlocEvent]s to send events from widget to -> bloc
/// You can create them as you like and add any type of data you like
/// The analyticEventName is a useful log you can track with your analytics implementations
class SaveDataEvent extends BaseBlocEvent {
  final String data;

  SaveDataEvent(String? analyticEventName, this.data) : super(analyticEventName);
}

class GetDataEvent extends BaseBlocEvent {
  GetDataEvent(String? analyticEventName) : super(analyticEventName);
}
