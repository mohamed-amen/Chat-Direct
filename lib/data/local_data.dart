import 'dart:developer';

import 'package:chat_direct/models/phone_code_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalData {
  static Box? _hiveBox;
  static const String _boxName = "phoneCodes";
  static const String _phoneCodeKey = "selectedPhoneCode";

  LocalData._();

  static Future<void> loadLocalData() async {
    await Hive.initFlutter();
    _hiveBox = await Hive.openBox(_boxName);
  }

  static PhoneCodeModel? get savedPhoneCode {
    log("loaded: ${_hiveBox!.get(_phoneCodeKey)}");

    Map? selectedPhoneCodeMap = _hiveBox?.get(_phoneCodeKey);

    if (selectedPhoneCodeMap == null) return null;

    return PhoneCodeModel.fromMap(selectedPhoneCodeMap);
  }

  static Future savePhoneCode(PhoneCodeModel? phoneCode) async {
    await _hiveBox?.put(_phoneCodeKey, phoneCode?.toMap());

    log("saved: ${_hiveBox!.get(_phoneCodeKey)}");
  }
}
