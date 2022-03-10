import 'package:flutter/material.dart';
import 'package:template_package/template_package.dart';

import '../../dependency/sub_modules/bloc_sub_module.dart';
import '../../features/initial/initial_page.dart';

class FirstPageLauncherABR implements ABR {
  final BlocSubModule _blocSubModule;

  FirstPageLauncherABR(this._blocSubModule);

  Future<Widget> decideFirstScreen({dynamic userProfile}) async {
    if (!(await _isCurrentVersionAllowed())) {
      return getMaintenancePage();
    }
    return getRootPage();
  }

  Widget getRequiredOptionPage(userProfile) => const Scaffold(body: Center(child: Text("optionRequired")));

  Widget getRootPage() => InitialPage(() => _blocSubModule.rootBloc());

  Widget getMaintenancePage() => const Scaffold(body: Center(child: Text("maintenance")));

  Future<bool> _isCurrentVersionAllowed() async => true;

  Widget getLogInPage() => const Scaffold(body: Center(child: Text("login")));

  Widget getConnectionErrorPage() => const Scaffold(body: Center(child: Text("app start error")));
}
