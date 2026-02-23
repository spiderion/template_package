import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_package/locale/translations.dart';

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  final bool isTest;
  final List<Locale> supportedLocales;
  final Locale defaultLocale;
  Translations? translations;

  TranslationsDelegate({
    this.isTest = false,
    required this.supportedLocales,
    required this.defaultLocale,
  });

  @override
  bool isSupported(Locale locale) => supportedLocales.any((e) => e.languageCode == locale.languageCode);

  @override
  Future<Translations> load(Locale locale) async {
    return isTest ? loadTest() : loadLocale(locale);
  }

  Future<Translations> loadLocale(Locale locale) async {
    if (translations != null) return translations!;
    final start = DateTime.now();
    final jsonContent = await rootBundle.loadString("assets/locale/i18n_${locale.languageCode}.json");
    final afterLoad = DateTime.now();
    debugPrint('LOAD_ASSET_LOCALE_TIME: ${afterLoad.difference(start).inMilliseconds} ms');
    final localizedValues = await compute(_parseJson, jsonContent);
    final afterParse = DateTime.now();
    debugPrint('JSON_PARSE_TIME: ${afterParse.difference(afterLoad).inMilliseconds} ms');
    translations = Translations(localizedValues: localizedValues);
    final afterTranslations = DateTime.now();
    debugPrint('TRANSLATIONS_OBJECT_TIME: ${afterTranslations.difference(afterParse).inMilliseconds} ms');
    debugPrint('TOTAL_LOCALE_LOAD_TIME: ${afterTranslations.difference(start).inMilliseconds} ms');
    return translations!;
  }

  Future<Translations> loadTest() async {
    translations = Translations(localizedValues: {"test": "test"});
    return translations!;
  }

  Future<Translations> loadSupportedLocale() {
    if (isSupported(getPlatformSelectedLocale())) {
      return load(getPlatformSelectedLocale());
    }
    return load(defaultLocale);
  }

  Locale getPlatformSelectedLocale() {
    String languageCode = Platform.localeName.split('_')[0];
    String countryCode = Platform.localeName.split('_')[1];
    return Locale(languageCode, countryCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => false;
}

Map<String, dynamic> _parseJson(String jsonContent) {
  final decoded = json.decode(jsonContent);
  return Map<String, dynamic>.from(decoded as Map);
}
