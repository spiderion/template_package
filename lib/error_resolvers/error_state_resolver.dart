import 'package:clean_architecture/error/error.dart';
import 'package:clean_architecture/request_and_response_model/result_model.dart';
import 'package:template_package/template_package.dart';

import '../error_state.dart';

abstract class ErrorStateResolver {
  Future<dynamic> call(ResultModel either, Sink<BaseBlocPrimaryState>? sinkState,
      {Function? execute, Function? onError});
}

class DefaultErrorStateResolver extends ErrorStateResolver {
  @override
  Future<dynamic> call(final either, Sink<BaseBlocPrimaryState>? sinkState,
      {Function? execute, Function? onError}) async {
    if (either is Error) {
      LoggerDefault.log.e(either.message);
      sinkState!.add(ErrorState(message: either.message));
      if (onError != null) onError();
    } else if (execute != null) {
      return await execute();
    }
  }
}
