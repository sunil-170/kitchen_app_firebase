import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final bool shadow;
  final double horizontalPadding;
  final double verticalPadding;
  final bool border;
  final bool isExpanded;
  final bool isheight;
  PrimaryContainer(
      {super.key,
      required this.child,
      this.shadow = false,
      this.horizontalPadding = 10,
      this.verticalPadding = 10,
      this.border = false,
      this.isExpanded = false,
      this.isheight = false});

  final styles = alldataManager;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: isheight ? AppServices.getScreenHeight : null,
        width: isExpanded ? AppServices.getScreenWidth : null,
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding.w, horizontal: horizontalPadding.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Get.isDarkMode
                ? styles.getcolor.darkContainerColor
                : styles.getcolor.white,
            border: border
                ? Border.all(color: styles.getcolor.black20, width: 0.75)
                : null,
            boxShadow: shadow
                ? [
                    BoxShadow(
                        color: styles.getcolor.black10,
                        blurRadius: 12,
                        spreadRadius: 0,
                        offset: Offset(0, 0))
                  ]
                : null),
        child: child);
  }
}
