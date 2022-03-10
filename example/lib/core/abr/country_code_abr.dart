import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:template_package/base_br/business_rules.dart';

import '../models/country_code.dart';

class CountryCodeAbr extends ABR {
  Future<dynamic> getCountries() async {
    final resultJson = await rootBundle.loadString('assets/country_codes.json');
    final List<dynamic> data = jsonDecode(resultJson);
    return data.map((e) => CountryCode.fromMap(e)).toList();
  }
}
