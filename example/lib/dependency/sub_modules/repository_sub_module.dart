import 'package:template_package/template_package.dart';

import '../../core/repositories/initial_repository.dart';
import 'core_sub_module.dart';

class RepositorySubModule extends ISubModule {
  late CoreSubModule _coreSubModule;

  @override
  setUp(List<ISubModule> subModules) {
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
  }

  @override
  Future<void> initialize() async {}

  InitialRepository userRepository() =>
      InitialRepository(_coreSubModule.remoteConfig(), _coreSubModule.dao());
}
