import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';

class PrimaryDecorations {
  static InputBorder _textFieldPrimaryBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide:
          BorderSide(color: alldataManager.getcolor.black20.withOpacity(0.1)));

  static InputDecoration primaryTextFieldDecoration = InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
    focusedBorder: _textFieldPrimaryBorder,
    enabledBorder: _textFieldPrimaryBorder,
    border: _textFieldPrimaryBorder,
  );

  static BoxDecoration primaryboxDecoration = BoxDecoration(
      color: Get.isDarkMode
          ? alldataManager.getcolor.black
          : alldataManager.getcolor.white,
      border: Border.all(color: alldataManager.getcolor.gray),
      borderRadius: BorderRadius.circular(10.r));
}
