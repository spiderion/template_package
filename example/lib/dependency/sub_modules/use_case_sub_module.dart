import 'package:example/dependency/sub_modules/repository_sub_module.dart';
import 'package:template_package/template_package.dart';

import '../../core/use_cases/user_use_case.dart';

class UseCaseSubModule extends ISubModule {
  late RepositorySubModule _repositorySubModule;

  @override
  init(List<ISubModule> subModules) {
    _repositorySubModule =
        subModules.singleWhere((element) => element is RepositorySubModule) as RepositorySubModule;
  }

  SomeUseCase userUseCase() => SomeUseCase(_repositorySubModule.userRepository());
}
