import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/screens/Menuscreen/OrderdetailsView.dart';
import 'package:kitchen_app/views/screens/orders/ordercommonwidget.dart';

class OrdersListView extends StatelessWidget {
  OrdersListView({super.key});

  final data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: LanguageConsts.orders.tr,
        autoImplyLeading: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Transform.rotate(
                          angle: (pi), child: GradientDivider(data: data))),
                  AppServices.addWidth(15),
                  Text(
                    "June 22,2024",
                    style: data.gettexttheme.fs16_regular,
                  ),
                  AppServices.addWidth(15),
                  Expanded(child: GradientDivider(data: data)),
                ],
              ),
              AppServices.addHeight(15),
              GestureDetector(
                  onTap: () {
                    Get.to(OrderdetailsView());
                  },
                  child: Ordercommonwidget(data: data)),
              AppServices.addHeight(15),

              /// *******   Order Data Tile    *********** ///
              GestureDetector(
                  onTap: () {
                    Get.to(OrderdetailsView());
                  },
                  child: Ordercommonwidget(data: data)),
            ],
          ),
        ),
      )),
    );
  }
}
