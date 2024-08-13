import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/extensions/string_extensions.dart';
import 'package:kitchen_app/view_model/enums/enums.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/Menuscreen/widget/checkboxwidget.dart';

import '../../components/widgets/primary_appbar.dart';

class View_itemDetailsView extends StatefulWidget {
  View_itemDetailsView({super.key});

  @override
  State<View_itemDetailsView> createState() => _View_itemDetailsViewState();
}

class _View_itemDetailsViewState extends State<View_itemDetailsView> {
  final data = alldataManager;

  List<String> food_list = [];
  List<String> week_list = [
    LanguageConsts.sun.tr,
    LanguageConsts.mon.tr,
    LanguageConsts.tue.tr,
    LanguageConsts.wed.tr,
    LanguageConsts.thu.tr,
    LanguageConsts.fri.tr,
    LanguageConsts.sat.tr
  ];
  List<String> colorlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.back.tr),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryContainer(
              verticalPadding: 0,
              horizontalPadding: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.sp),
                      child: Image.asset(data.getimg.meal_img)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "North Indian Meal",
                              style: data.gettexttheme.fs20_bold,
                            ),
                            Text("\u{20B9}120/-",
                                style: data.gettexttheme.fs20_bold.copyWith(
                                    color: data.getcolor.primaryColor))
                          ],
                        ),
                        AppServices.addHeight(5),
                        Text(
                          "Soy, Rice, Bell paper, Penuts Soy, Rice, Bell paper, Penuts",
                          style: data.gettexttheme.fs14_regular
                              .copyWith(color: data.getcolor.gray),
                        ),
                        AppServices.addHeight(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.favorite_border_rounded,
                                  color: data.getcolor.primaryColor,
                                ),
                                AppServices.addWidth(10),
                                Text(
                                  "90%",
                                  style: data.gettexttheme.fs12_regular
                                      .copyWith(
                                          color: data.getcolor.primaryColor),
                                ),
                                SizedBox(
                                  height: 25,
                                  child: VerticalDivider(
                                    color: data.getcolor.primaryColor,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: data.getcolor.primaryColor,
                                ),
                                AppServices.addWidth(5),
                                Text("8.9",
                                    style: data.gettexttheme.fs12_regular
                                        .copyWith(
                                            color: data.getcolor.primaryColor)),
                                SizedBox(
                                  height: 25,
                                  child: VerticalDivider(
                                    color: data.getcolor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        AppServices.addHeight(10),
                        Text(
                          "*Included in Subscription",
                          style: data.gettexttheme.fs12_regular
                              .copyWith(color: data.getcolor.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppServices.addHeight(15),
            Text(
              LanguageConsts.Availability.tr,
              style: data.gettexttheme.fs16_regular,
            ),
            AppServices.addHeight(15),

            /// *******  Meal Category   *********** ///
            PrimaryContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      ...List.generate(MealCategory.values.length, (index) {
                        return Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_box_outlined,
                                color: data.getcolor.primaryColor,
                              ),
                              AppServices.addWidth(5),
                              Text(
                                MealCategory.values[index].name.toTitleCase(),
                                style: data.gettexttheme.fs16_regular.copyWith(
                                    color: data.getcolor.primaryColor),
                              )
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                  AppServices.addHeight(15),
                  GradientDivider(
                    data: data,
                    middleGradient: true,
                  ),
                  AppServices.addHeight(15),

                  /// ******* Week Day   *********** ///
                  Wrap(
                    spacing: 10, runSpacing: 10,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(week_list.length, (index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            constraints: BoxConstraints(minWidth: 45),
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                              color: data.getcolor.primaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(week_list[index],
                                textAlign: TextAlign.center,
                                style: data.gettexttheme.fs16_regular
                                    .copyWith(color: data.getcolor.white)),
                          ),
                        );
                      })
                    ],
                  ),
                ],
              ),
            ),
            AppServices.addHeight(15),

            /// *******   Tiffin Service  Price  *********** ///
            PrimaryContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: GradientDivider(data: font)),
                      AppServices.addWidth(10),
                      Text(LanguageConsts.addons.tr,
                          style: font.gettexttheme.fs12_regular),
                      AppServices.addWidth(10),
                      Expanded(
                          child: Transform.rotate(
                              angle: (pi), child: GradientDivider(data: font))),
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
                ],
              ),
            ),
            AppServices.addHeight(15),
            Row(
              children: [
                PrimaryButton(
                    isExpanded: true,
                    title: LanguageConsts.Edit.tr,
                    onPressed: () {})
              ],
            )
          ],
        ),
      )),
    );
  }
}
