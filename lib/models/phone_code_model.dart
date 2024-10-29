class PhoneCodeModel {
  String englishName;
  String arabicName;
  String countryCode;
  String flag;
  String phoneCode;

  PhoneCodeModel._({
    required this.englishName,
    required this.arabicName,
    required this.countryCode,
    required this.flag,
    required this.phoneCode,
  });

  factory PhoneCodeModel.fromMap(Map data) {
    return PhoneCodeModel._(
      englishName: data['name'],
      arabicName: data['ar_name'],
      countryCode: data['country_code'],
      flag: data['emoji'],
      phoneCode: data['phone_code'],
    );
  }

  Map toMap() {
    return {
      'name': englishName,
      'ar_name': arabicName,
      'country_code': countryCode,
      'emoji': flag,
      'phone_code': phoneCode,
    };
  }
}
