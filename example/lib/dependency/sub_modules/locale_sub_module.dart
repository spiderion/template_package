import 'dart:ui';

import 'package:template_package/template_package.dart';

class LocaleSubModule implements ISubModule {
  TranslationsDelegate? _translationDelegate;

  @override
  setUp(List<ISubModule> subModules) {}

  @override
  Future<void> initialize() async {}

  TranslationsDelegate translationDelegateInstance() {
    final supportedLocales = [const Locale('en'), const Locale('it')];
    _translationDelegate ??= TranslationsDelegate(
      supportedLocales: supportedLocales,
      defaultLocale: supportedLocales.first,
    );
    return _translationDelegate!;
  }
}
