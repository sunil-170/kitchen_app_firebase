import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/language_model.dart';
import 'package:kitchen_app/view_model/translations.dart';

class LanguageController extends GetxController {
  LanguageController() {
    setLanguage(preferences.getLanguage());
  }

  Rx<LanguageModel> _selectedLanguage = Rx<LanguageModel>(Languages.english);
  LanguageModel get selectedLanguage => _selectedLanguage.value;

  setLanguage(LanguageModel data) {
    _selectedLanguage(data);
    Get.updateLocale(Locale(data.languagecode, data.countrycode));
    preferences.setLanguage(data: data);
  }
}
