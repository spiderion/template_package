abstract class ResultModel {}

class ResultSuccess extends ResultModel {
  dynamic result;

  ResultSuccess({this.result});
}

class ResultConfigValue extends ResultModel {
  final dynamic value;

  ResultConfigValue(this.value);
}
