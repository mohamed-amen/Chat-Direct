import 'dart:convert';

import 'package:chat_direct/data/local_data.dart';
import 'package:chat_direct/models/phone_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneCodeProvider extends ChangeNotifier {
  PhoneCodeModel? selectedPhoneCode;
  List<PhoneCodeModel> allPhoneCodes = [];

  Future<void> loadCodesDataAsset() async {
    String data = await rootBundle.loadString("assets/country phone codes.json");
    List decodedData = jsonDecode(data);

    for (Map code in decodedData) {
      allPhoneCodes.add(PhoneCodeModel.fromMap(code));
    }
  }

  List<PhoneCodeModel> searchPhoneCodes(String searchText) {
    List<PhoneCodeModel> searchResults = [];

    for (PhoneCodeModel phoneCode in allPhoneCodes) {
      String englishName = phoneCode.englishName.toLowerCase();
      String arabicName = phoneCode.arabicName;
      String countryCode = phoneCode.countryCode.toLowerCase();
      String phoneCodeString = phoneCode.phoneCode;

      if (englishName.contains(searchText) ||
          arabicName.contains(searchText) ||
          countryCode.contains(searchText) ||
          phoneCodeString.contains(searchText)) {
        searchResults.add(phoneCode);
      }
    }

    return searchResults;
  }

  Future<void> selectNewPhoneCode(PhoneCodeModel? newPhoneCode) async {
    selectedPhoneCode = newPhoneCode;
    await LocalData.savePhoneCode(newPhoneCode);
    notifyListeners();
  }
}
