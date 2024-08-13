import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/extensions/string_extensions.dart';
import 'package:kitchen_app/res/utils/primary_decorations.dart';
import 'package:kitchen_app/view_model/enums/enums.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/Menuscreen/widget/checkboxwidget.dart';

class AddWeeklyMenuView extends StatefulWidget {
  AddWeeklyMenuView({super.key});

  @override
  State<AddWeeklyMenuView> createState() => _AddWeeklyMenuViewState();
}

class _AddWeeklyMenuViewState extends State<AddWeeklyMenuView> {
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

  List<String> meal_cat = [LanguageConsts.veg.tr, LanguageConsts.Nonvveg.tr];

  List<String> colorlist = [];

  final style = alldataManager;
  var initial_value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Availability"),
            PrimaryContainer(
              child: Column(
                children: [
                  /// ******* Week Day   *********** ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(week_list.length, (index) {
                        bool check =
                            colorlist.any((e) => e == week_list[index]);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (check) {
                                colorlist.remove(week_list[index]);
                              } else {
                                colorlist.add(week_list[index]);
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                                color:
                                    check ? style.getcolor.primaryColor : null,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color:
                                        style.getcolor.gray.withOpacity(0.2))),
                            child: Text(week_list[index],
                                style: style.gettexttheme.fs16_regular.copyWith(
                                    color: check
                                        ? style.getcolor.white
                                        : style.getcolor.black)),
                          ),
                        );
                      })
                    ],
                  ),
                  AppServices.addHeight(10),
                  GradientDivider(
                    data: style,
                    middleGradient: true,
                  ),
                  AppServices.addHeight(10),

                  /// *******  Meal Category   *********** ///
                  Row(
                    children: [
                      ...List.generate(MealCategory.values.length, (index) {
                        bool check = food_list.any((e) =>
                            e == MealCategory.values[index].name.toTitleCase());
                        return Expanded(
                          child: CheckboxWidget(
                              checkcolor: style.getcolor.primaryColor,
                              text: MealCategory.values[index]
                                  .toString()
                                  .toTitleCase(),
                              style: style.gettexttheme.fs16_regular,
                              onSelect: (v) => setState(() {
                                    if (check) {
                                      food_list.remove(MealCategory
                                          .values[index].name
                                          .toTitleCase());
                                    } else {
                                      food_list.add(MealCategory
                                          .values[index].name
                                          .toTitleCase());
                                    }
                                  }),
                              selected_text: food_list.firstWhere(
                                  (e) =>
                                      e ==
                                      MealCategory.values[index].name
                                          .toTitleCase(),
                                  orElse: () => "")),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            AppServices.addHeight(15),

            /// *******    Food Type   *********** ///
            Row(
              children: [
                ...List.generate(
                  meal_cat.length,
                  (index) => Row(
                    children: [
                      Radio(
                          activeColor: style.getcolor.primaryColor,
                          value: meal_cat[index],
                          groupValue: initial_value,
                          onChanged: (value) => setState(() {
                                initial_value = value.toString();
                              })),
                      Text(
                        meal_cat[index],
                        style: style.gettexttheme.fs16_regular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            PrimaryContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Inside Box(Menu)"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  width: AppServices.getScreenWidth,
                  decoration: PrimaryDecorations.primaryboxDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          splashRadius: 24.0,
                          onPressed: () {
                            /// add meal for weekly menu*********///
                          },
                          icon: Icon(
                            Icons.add_circle_outline_rounded,
                            color: style.getcolor.primaryColor,
                          ))
                    ],
                  ),
                ),
              ],
            )),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: PrimaryButton(
                      foregroundColor: style.getcolor.primaryColor,
                      backgroundColor: style.getcolor.lightred,
                      title: LanguageConsts.reset.tr,
                      onPressed: () {}),
                ),
                AppServices.addWidth(10),
                Expanded(
                  flex: 3,
                  child: PrimaryButton(
                      backgroundColor: style.getcolor.green,
                      title: LanguageConsts.uploadD.tr,
                      onPressed: () {}),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
