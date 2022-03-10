import 'package:example/dependency/sub_modules/use_case_sub_module.dart';
import 'package:template_package/template_package.dart';

import '../../features/initial/initial_bloc.dart';
import 'core_sub_module.dart';

/// BlocSubModule will keep all your blocs creation organized
/// You will have access to all your dependencies here and will never need to use static fields
class BlocSubModule extends ISubModule {
  late CoreSubModule _coreSubModule;
  late UseCaseSubModule _useCaseSubModule;

  @override
  init(List<ISubModule> subModules) {
    /// You can add all your subModules here if you like
    /// Then use them to get the dependencies required by your blocs
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
    _useCaseSubModule = subModules.singleWhere((element) => element is UseCaseSubModule) as UseCaseSubModule;
  }

  /// create a method for each of your blocs
  InitialBloc rootBloc() => InitialBloc(_coreSubModule.analytics(), _useCaseSubModule.userUseCase());
}
