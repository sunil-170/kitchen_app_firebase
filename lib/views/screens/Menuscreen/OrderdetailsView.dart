import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/Dailog/cancel_dialog.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/pdf/mybill.dart';

/// *******   Order Details Widget  *********** ///
class OrderdetailsView extends StatelessWidget {
  OrderdetailsView({super.key});
  final font = alldataManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.viewD.tr),
      body: SafeArea(
          child: ListView(children: [
        Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              /// /// ******* Orders Details  *********** ///
              PrimaryContainer(
                verticalPadding: 0,
                horizontalPadding: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: Image.asset(font.getimg.order_img)),
                    Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "North Indian Meal",
                                style: font.gettexttheme.fs20_bold,
                              ),
                              Text("\u{20B9}140 /-",
                                  style: font.gettexttheme.fs20_bold.copyWith(
                                      color: font.getcolor.primaryColor))
                            ],
                          ),
                          AppServices.addHeight(2),
                          Text(
                            "Order ID: 022222",
                            style: font.gettexttheme.fs14_regular,
                          ),
                          AppServices.addHeight(10),
                          GradientDivider(
                            data: font,
                            middleGradient: true,
                          ),
                          AppServices.addHeight(10),
                          Text(
                            "Soy,  Rice, Bell paper, Penuts",
                            style: font.gettexttheme.fs14_regular
                                .copyWith(color: font.getcolor.gray),
                          ),
                          AppServices.addHeight(10),
                          Text(
                              "Lorem ipsum dolor sit amet consectetur. Venenatis urna mattis mi at sed dapibus. Blandit non lacus nisi donec a sagittis.",
                              style: font.gettexttheme.fs14_regular
                                  .copyWith(color: font.getcolor.gray)),
                          AppServices.addHeight(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.favorite_border_rounded,
                                    color: font.getcolor.primaryColor,
                                  ),
                                  AppServices.addWidth(5),
                                  Text(
                                    "90%",
                                    style: font.gettexttheme.fs12_regular
                                        .copyWith(
                                            color: font.getcolor.primaryColor),
                                  ),
                                  SizedBox(
                                    height: 25,
                                    child: VerticalDivider(
                                      color: font.getcolor.primaryColor,
                                    ),
                                  ),
                                  AppServices.addWidth(5),
                                  Icon(
                                    Icons.star,
                                    color: font.getcolor.primaryColor,
                                  ),
                                  AppServices.addWidth(8),
                                  Text("8.9",
                                      style: font.gettexttheme.fs12_regular
                                          .copyWith(
                                              color:
                                                  font.getcolor.primaryColor)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              AppServices.addHeight(10),

              /// *******  Customer Details  *********** ///
              PrimaryContainer(
                verticalPadding: 5,
                horizontalPadding: 8,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      leading: Image.asset(font.getimg.custmer_img),
                      title: Text(
                        "Sunil Singh",
                        style: font.gettexttheme.fs18_medium,
                      ),
                      subtitle: Text(
                        "+919812673370",
                        style: font.gettexttheme.fs14_regular
                            .copyWith(color: font.getcolor.gray),
                      ),
                      trailing:
                          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                    ),
                    AppServices.addHeight(5),
                    GradientDivider(
                      data: font,
                      middleGradient: true,
                    ),
                    AppServices.addHeight(10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                        ),
                        AppServices.addWidth(10),
                        Expanded(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text:
                                    "Hotel The Icon, Talaki Gate, Rishi Nagar, Near bus stand, Hisar",
                                style: font.gettexttheme.fs16_regular),
                            TextSpan(
                                text: " - 4 KM away",
                                style: font.gettexttheme.fs16_regular.copyWith(
                                    color: font.getcolor.primaryColor))
                          ])),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              AppServices.addHeight(10),

              /// *******   Tiffin Service  Price  *********** ///
              PrimaryContainer(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tiffin Base Price",
                          style: font.gettexttheme.fs16_regular,
                        ),
                        Text("\u{20B9}140 /-",
                            style: font.gettexttheme.fs16_regular)
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: GradientDivider(data: font)),
                        AppServices.addWidth(10),
                        Text("+ Addons", style: font.gettexttheme.fs12_regular),
                        AppServices.addWidth(10),
                        Expanded(
                            child: Transform.rotate(
                                angle: (pi),
                                child: GradientDivider(data: font))),
                      ],
                    ),
                    AppServices.addHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Roti", style: font.gettexttheme.fs16_regular),
                        Text("\u{20B9}50 /-",
                            style: font.gettexttheme.fs16_regular)
                      ],
                    ),
                    AppServices.addHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Jeera Rayta",
                            style: font.gettexttheme.fs16_regular),
                        Text("\u{20B9}40 /-",
                            style: font.gettexttheme.fs16_regular)
                      ],
                    ),
                    AppServices.addHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dahi", style: font.gettexttheme.fs16_regular),
                        Text("\u{20B9}20 /-",
                            style: font.gettexttheme.fs16_regular)
                      ],
                    ),
                    AppServices.addHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Grand Total",
                            style: font.gettexttheme.fs16_regular
                                .copyWith(color: font.getcolor.primaryColor)),
                        AppServices.addWidth(10),
                        Expanded(child: GradientDivider(data: font)),
                        AppServices.addWidth(10),
                        Text("\u{20B9}250 /-",
                            style: font.gettexttheme.fs16_regular
                                .copyWith(color: font.getcolor.primaryColor))
                      ],
                    ),
                  ],
                ),
              ),
              AppServices.addHeight(10),

              /// *******     Primary Buttons  *********** ///
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PrimaryButton(
                        foregroundColor: font.getcolor.primaryColor,
                        backgroundColor: font.getcolor.lightred,
                        title: LanguageConsts.decline.tr,
                        onPressed: () {
                          /// *******   Dialog For Cancellations  *********** ///
                          Get.dialog(CancelDailog(font: font),
                              barrierDismissible: false);
                        }),
                  ),
                  AppServices.addWidth(10),
                  Expanded(
                    flex: 3,
                    child: PrimaryButton(
                        backgroundColor: font.getcolor.green,
                        title: LanguageConsts.accept.tr,
                        onPressed: () {
                          Get.to(MyBillView());
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ])),
    );
  }
}
