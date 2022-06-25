import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:template_package/logger/logger.dart';
import 'package:template_package/utils/build_mode_detector.dart';

/// Used by BaseWidget to translate your text
class Translations {
  Map<dynamic, dynamic>? localizedValues;

  Translations({required this.localizedValues});

  static Translations? of(BuildContext context) {
    return Localizations.of(context, Translations);
  }

  static Future<Translations> load(Locale locale) async {
    String jsonContent = await rootBundle.loadString("assets/locale/i18n_${locale.languageCode}.json");
    return Translations(localizedValues: json.decode(jsonContent));
  }

  static Future<Translations> loadTest() async {
    Map<dynamic, dynamic> test = {"test": "test"};
    return Translations(localizedValues: test);
  }

  String text(String? key, [Map<String, String?>? arguments]) {
    String extraText = "";
    if (isInDebugMode) extraText = " not found";
    String translation = localizedValues?[key] ?? key! + extraText;
    if (arguments == null || arguments.length == 0) {
      return translation;
    }
    arguments.forEach((argumentKey, value) {
      if (value == null) {
        LoggerDefault.log.wtf('Value for "$argumentKey" is null in call of translate(\'$key\')');
        value = '';
      }
      translation = translation.replaceAll("\$$argumentKey", value);
    });
    return translation;
  }
}
