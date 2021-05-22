import 'package:flutter/material.dart';
import 'package:template_package/utils/translations.dart';

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  final bool isTest;
  final List<Locale> supportedLocales;

  const TranslationsDelegate({this.isTest = false, required this.supportedLocales});

  @override
  bool isSupported(Locale locale) => supportedLocales.any((element) => element.countryCode == locale.countryCode);

  @override
  Future<Translations> load(Locale locale) async {
    return isTest ? await Translations.loadTest() : await Translations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => false;
}
