import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_app/firebase_class/firebase_data.dart';
import 'package:kitchen_app/firebase_class/models.dart';
import 'package:kitchen_app/firebase_class/product_form.dart';
import 'package:kitchen_app/firebase_options.dart';
import 'package:kitchen_app/ordermodel/order_controller.dart';
import 'package:kitchen_app/res/config/prefs/prefs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'singleton/Alldatamanager.dart';

late Size screenSize;
late AllDataManager alldataManager;
Prefs preferences = Prefs.instance;
late SharedPreferences prefs;
Future<void> main() async {
  // ...
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  prefs = await SharedPreferences.getInstance();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseData()),
        ChangeNotifierProvider(create: (_) => OrderConntroller()),
      ],
      child: MaterialApp(
        home: ProductFormView(),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   screenSize = MediaQuery.of(context).size;
  //   alldataManager = AllDataManager.instance;
  //   print(screenSize.width);
  //   return ScreenUtilInit(
  //     splitScreenMode: false,
  //     designSize: Size(AppConfig.screenWidth, AppConfig.screenHeight),
  //     child: GetMaterialApp(
  //       initialRoute: Routesname.Splashscreen,
  //       translations: Languages(),
  //       locale: Languages.locale,
  //       fallbackLocale: Languages.fallbacklocle,
  //       initialBinding: InitialBindings(),
  //       getPages: Routes.zgenerateRoutes(),
  //       themeMode: preferences.getCurrentTheme().mode,
  //       theme: GetThemes.lightTheme(context: context),
  //       darkTheme: GetThemes.darkmode(context: context),
  //       unknownRoute: GetPage(name: "/notfound", page: () => DefaultRoute()),
  //       debugShowCheckedModeBanner: false,
  //     ),
  //   );
  // }
}
