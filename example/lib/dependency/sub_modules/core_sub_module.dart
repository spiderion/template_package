import 'package:template_package/template_package.dart';

import '../../core/configuration/remote_config.dart';
import '../../core/data/dao.dart';
import '../../core/data/database.dart';

/// this is the core submodule where you would like to put your third party package dependencies
/// The submodules all follow the same pattern
/// They have an init method where you can initialize other submodules see the example in [BlocSubModule]
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
}
