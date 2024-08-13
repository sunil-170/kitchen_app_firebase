import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/singleton/Alldatamanager.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

/// *******  Notification Screen   *********** ///
class NotificationView extends StatelessWidget {
  NotificationView({super.key});
  final data = alldataManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.notification.tr),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Transform.rotate(
                        angle: (pi), child: GradientDivider(data: data)),
                  ),
                  AppServices.addWidth(10),
                  Text(
                    LanguageConsts.today.tr,
                    style: data.gettexttheme.fs16_regular,
                  ),
                  AppServices.addWidth(10),
                  Expanded(
                    child: GradientDivider(data: data),
                  ),
                ],
              ),
              AppServices.addHeight(20),
              PrimaryContainer(
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) => Notificationwidget(data: data),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        AppServices.addHeight(10),
                    itemCount: 10),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class Notificationwidget extends StatelessWidget {
  const Notificationwidget({
    super.key,
    required this.data,
  });

  final AllDataManager data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: data.getcolor.gray.withOpacity(0.1))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: data.getcolor.primaryColor),
            child: Image.asset(
              data.getimg.notification_img,
              height: 20.w,
              width: 20.w,
            ),
          ),
          AppServices.addWidth(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Order Arriving",
                        style: data.gettexttheme.fs16_regular,
                      ),
                    ),
                    Text(
                      "05 min ago",
                      style: data.gettexttheme.fs12_regular,
                    ),
                  ],
                ),
                Text(
                  "Your Upcoming order will be arrive on your location at 01:00 PM.",
                  style: data.gettexttheme.fs14_regular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
