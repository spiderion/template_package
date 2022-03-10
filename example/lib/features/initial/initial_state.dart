import 'package:template_package/template_package.dart';

/// Define any type of DataState as you like make sure you extend [BaseBlocDataState]
class InitialDataState extends BaseBlocDataState {
  final String text;
  final String appName;
  final String someData;
  final bool isHorizontalStyle;
  final String appPackage;
  final String appVersion;

  InitialDataState({
    required this.text,
    required this.appName,
    this.someData = '',
    this.isHorizontalStyle = false,
    this.appPackage = 'unknown',
    this.appVersion = 'unknown',
  });
}
