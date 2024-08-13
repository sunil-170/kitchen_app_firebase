import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kitchen_app/DefaultRoute.dart';
import 'package:kitchen_app/res/config/prefs/prefs.dart';
import 'package:kitchen_app/res/config/routes/routs.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/res/utils/Theme/themes.dart';
import 'package:kitchen_app/res/utils/helper/app_config.dart';
import 'package:kitchen_app/view_model/bindings/initial_bindings.dart';
import 'package:kitchen_app/view_model/translations.dart';

import 'singleton/Alldatamanager.dart';

late Size screenSize;
late AllDataManager alldataManager;
Prefs preferences = Prefs.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await preferences.setPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    alldataManager = AllDataManager.instance;
    print(screenSize.width);
    return ScreenUtilInit(
      splitScreenMode: false,
      designSize: Size(AppConfig.screenWidth, AppConfig.screenHeight),
      child: GetMaterialApp(
        initialRoute: Routesname.Welcomepage,
        translations: Languages(),
        locale: Languages.locale,
        fallbackLocale: Languages.fallbacklocle,
        initialBinding: InitialBindings(),
        getPages: Routes.zgenerateRoutes(),
        themeMode: preferences.getCurrentTheme().mode,
        theme: GetThemes.lightTheme(context: context),
        darkTheme: GetThemes.darkmode(context: context),
        unknownRoute: GetPage(name: "/notfound", page: () => DefaultRoute()),
        debugShowCheckedModeBanner: false,
      ),
    );
    
  }
}
