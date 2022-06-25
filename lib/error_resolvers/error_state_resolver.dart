import 'package:template_package/error_state.dart';
import 'package:template_package/template_package.dart';

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
      sinkState!.add(ErrorState(error: either));
      if (onError != null) onError();
    } else if (execute != null) {
      return await execute();
    }
  }
}
