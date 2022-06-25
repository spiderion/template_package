import 'package:flutter/services.dart';
import 'package:template_package/template_package.dart';

class DefaultExceptionCaptor extends ExceptionCaptor {
  @override
  Future<ResultModel> execute(Function function) async {
    try {
      return await function();
    } on PlatformException catch (e, s) {
      LoggerDefault.log.e(e.toString(), s.toString());
      return ServerError(message: e.code);
    } on Exception catch (e, s) {
      LoggerDefault.log.e(e.toString(), [e, s]);
      return ServerError(message: e.toString());
    } catch (e, s) {
      LoggerDefault.log.e(e.toString(), [e, s]);
      return ServerError(message: e.toString());
    }
  }
}
