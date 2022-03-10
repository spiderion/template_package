class CountryCode {
  final String name;
  final String code;
  final String dialCode;

  CountryCode(this.name, this.code, this.dialCode);

  CountryCode.fromMap(Map json)
      : name = json['name'],
        code = json['code'],
        dialCode = json['dial_code'];
}
