import 'package:template_package/template_package.dart';

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
