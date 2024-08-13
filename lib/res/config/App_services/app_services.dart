import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppServices {
  static double getScreenHeight = Get.size.height;
  static double getScreenWidth = Get.size.width;
  static addHeight(double height) => SizedBox(
        height: height.h,
      );
  static addWidth(double width) => SizedBox(
        width: width.w,
      );
  static pushto(Widget screen) => Get.to(screen);
  static goback() => Get.back();

  static pushNamed(String screen) => Get.toNamed(screen);
  static pushAndRemoveUntilNamed(String screen) => Get.offAllNamed(screen);

  static pushandreplace(Widget screen) => Get.off(screen);
  static pushandremoveuntil(Widget screen) => Get.offAll(screen);
}
