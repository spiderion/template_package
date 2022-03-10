import 'package:template_package/template_package.dart';

import '../../core/abr/country_code_abr.dart';
import '../../core/abr/first_page_launcher_abr.dart';
import 'bloc_sub_module.dart';

class ABRSubModule implements ISubModule {
  late BlocSubModule _blocSubModule;

  @override
  init(List<ISubModule> subModules) {
    _blocSubModule = subModules.whereType<BlocSubModule>().first;
  }

  CountryCodeAbr get countryCodeAbr => CountryCodeAbr();

  FirstPageLauncherABR firstPageLauncherABR() => FirstPageLauncherABR(_blocSubModule);
}
