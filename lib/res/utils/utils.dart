import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_app/main.dart';

class Utils {
  //Helpers
  static var data = alldataManager;
  static fieldFocusChange(FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusManager.instance.primaryFocus!.requestFocus(nextfocus);
  }

  static snackbar(
    String message,
    BuildContext context,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
      backgroundColor: data.getcolor.primaryColor,
      content: Text(message,
          style: data.gettexttheme.fs12_regular
              .copyWith(color: data.getcolor.white)),
    ));
  }
}
