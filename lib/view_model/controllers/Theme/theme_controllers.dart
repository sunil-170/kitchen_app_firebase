import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/Theme_model.dart';

class ThemeController extends GetxController {
  ThemeController() {
    setCurrentTheme(preferences.getCurrentTheme());
  }

  ThemesModel get _dark => ThemesModel(title: "Dark", mode: ThemeMode.dark);
  ThemesModel get _light => ThemesModel(title: "Light", mode: ThemeMode.light);
  ThemesModel get _system =>
      ThemesModel(title: "systemdefault", mode: ThemeMode.system);

  List<ThemesModel> get themes => [_light, _dark, _system];

  late Rx<ThemesModel> _currentTheme = Rx<ThemesModel>(_light);
  ThemesModel get currentTheme => _currentTheme.value;

  setCurrentTheme(ThemesModel theme) {
    preferences.setCurrentTheme(theme);
    Get.changeThemeMode(theme.mode);
    _currentTheme(theme);
  }

  bool isDarkMode() {
    return currentTheme == _dark ||
        (currentTheme == _system &&
            SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark);
  }
}
