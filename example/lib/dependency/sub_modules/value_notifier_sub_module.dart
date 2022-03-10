import 'package:dependency_provider/base_sub_module.dart';

import '../../core/notifiers/theme_notifier/theme_notifier.dart';
import '../../theme/theme_primary/app_theme_dark.dart';

class ValueNotifierSubModule implements ISubModule {
  late ThemeNotifier themeNotifier;

  @override
  init(List<ISubModule> subModules) {
    themeNotifier = ThemeNotifier(appThemeDark);
  }
}
