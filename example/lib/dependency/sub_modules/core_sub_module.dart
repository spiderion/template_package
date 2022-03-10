import 'package:template_package/exception_captor/default_exception_captor.dart';
import 'package:template_package/template_package.dart';

import '../../core/configuration/remote_config.dart';
import '../../core/data/dao.dart';
import '../../core/data/database.dart';

class CoreSubModule extends ISubModule {
  BaseAnalytics? _analytics;

  @override
  init(List<ISubModule> subModules) {}

  BaseAnalytics analytics() {
    _analytics ??= AnalyticsProxy([], enable: true);
    return _analytics!;
  }

  Dao dao() => DataBase({});

  RemoteConfiguration remoteConfig() => RemoteConfig();

  ExceptionCaptor exceptionCaptor() => DefaultExceptionCaptor();
}
