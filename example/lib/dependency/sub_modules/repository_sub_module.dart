import 'package:template_package/template_package.dart';

import '../../core/repositories/initial_repository.dart';
import 'core_sub_module.dart';

class RepositorySubModule extends ISubModule {
  late CoreSubModule _coreSubModule;

  @override
  init(List<ISubModule> subModules) {
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
  }

  InitialRepository userRepository() =>
      InitialRepository(_coreSubModule.remoteConfig(), _coreSubModule.dao());
}
