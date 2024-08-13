import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';

class GetThemes {
  ///===================== Light Theme ==========================
  static ThemeData lightTheme({required BuildContext context}) =>
      ThemeData.light().copyWith(

          /// Appbar theme mode
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleSpacing: 0,
              foregroundColor: alldataManager.getcolor.black,
              titleTextStyle: alldataManager.gettexttheme.fs16_regular
                  .copyWith(color: alldataManager.getcolor.black)),

          /// Text button theme mode

          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  // minimumSize: Size(
                  //   MediaQuery.of(context).size.width,
                  //   50,
                  // ),
                  foregroundColor: alldataManager.getcolor.white,
                  backgroundColor: alldataManager.getcolor.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),

          ///  scaffold  theme mode
          scaffoldBackgroundColor: alldataManager.getcolor.cream,

          // Dialog Theme
          dialogTheme: DialogTheme(
              backgroundColor: alldataManager.getcolor.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))));

  //// =========================== Dark Mode===================================

  static ThemeData darkmode({required BuildContext context}) =>
      ThemeData.dark().copyWith(

          /// Appbar theme mode
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleSpacing: 0,
              surfaceTintColor: Colors.transparent,
              foregroundColor: alldataManager.getcolor.white,
              titleTextStyle: alldataManager.gettexttheme.fs16_regular
                  .copyWith(color: alldataManager.getcolor.white)),

          /// Text button theme mode

          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  // minimumSize: Size(
                  //   MediaQuery.of(context).size.width,
                  //   50,
                  // ),
                  foregroundColor: alldataManager.getcolor.white,
                  backgroundColor: alldataManager.getcolor.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),

          ///  scaffold  theme mode
          scaffoldBackgroundColor: alldataManager.getcolor.sccfoldcolor,

          // Dialog Theme
          dialogTheme: DialogTheme(
              backgroundColor: alldataManager.getcolor.darkContainerColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))));
}
