import 'package:example/dependency/sub_modules/use_case_sub_module.dart';
import 'package:template_package/template_package.dart';

import '../../features/initial/initial_bloc.dart';
import 'core_sub_module.dart';

class BlocSubModule extends ISubModule {
  late CoreSubModule _coreSubModule;
  late UseCaseSubModule _useCaseSubModule;

  @override
  init(List<ISubModule> subModules) {
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
    _useCaseSubModule = subModules.singleWhere((element) => element is UseCaseSubModule) as UseCaseSubModule;
  }

  InitialBloc rootBloc() => InitialBloc(_coreSubModule.analytics(), _useCaseSubModule.userUseCase());
}
