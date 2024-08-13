import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/extensions/string_extensions.dart';
import 'package:kitchen_app/view_model/controllers/add_meal_controller.dart';
import 'package:kitchen_app/view_model/enums/enums.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/bottom_sheet.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/Menuscreen/Today_meal.dart';
import 'package:kitchen_app/views/screens/Menuscreen/widget/checkboxwidget.dart';
import 'package:kitchen_app/views/screens/search/widget/TransprntBtn.dart';

/// *******  ADD Meal Widget          *********** ///
class AddMenuView extends StatefulWidget {
  AddMenuView({super.key});

  @override
  State<AddMenuView> createState() => _AddMenuViewState();
}

class _AddMenuViewState extends State<AddMenuView> {
  final data = alldataManager;
  File? imageFile;

  List<String> meal_cat = [LanguageConsts.veg.tr, LanguageConsts.Nonvveg.tr];
  List<String> colorlist = [];
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
 
  String isMealaddons = "";
  RxString isIncluded = "".obs;
  String isBreakfast = "";
  String isLunch = "";
  String isDinner = "";

  var initial_value = "";

  final addMealController = Get.put(AddMealController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.addM.tr),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// *******     Add Meal Photo     *********** ///
              GestureDetector(
                onTap: () async {
                  var re = await showModalBottomSheet(
                      context: context, builder: (context) => Image_picker());
                  setState(() {
                    imageFile = re;
                  });
                },
                child: PrimaryContainer(
                    horizontalPadding: 0,
                    verticalPadding: 0,
                    border: true,
                    isExpanded: true,
                    child: imageFile == null
                        ? Column(
                            children: [
                              Icon(
                                Icons.file_download_outlined,
                                size: 50,
                              ),
                              AppServices.addHeight(10),
                              Text(
                                LanguageConsts.dragYPHO.tr,
                                style: data.gettexttheme.fs14_regular,
                              ),
                              Text(
                                LanguageConsts.BrowseFD.tr,
                                style: data.gettexttheme.fs14_regular.copyWith(
                                    color: data.getcolor.primaryColor),
                              ),
                            ],
                          )
                        : Image.file(
                            fit: BoxFit.cover,
                            imageFile!,
                            height: 100,
                          )),
              ),
              AppServices.addHeight(15),
              Text(
                LanguageConsts.Availability.tr,
                style: data.gettexttheme.fs16_regular,
              ),
              AppServices.addHeight(15),
              PrimaryContainer(
                child: Column(
                  children: [
                    /// *******  Meal Category   *********** ///
                    Row(
                      children: [
                        ...List.generate(MealCategory.values.length, (index) {
                          bool check = food_list.any((e) =>
                              e ==
                              MealCategory.values[index].name.toTitleCase());
                          return Expanded(
                            child: CheckboxWidget(
                                checkcolor: data.getcolor.primaryColor,
                                text: MealCategory.values[index]
                                    .toString()
                                    .toTitleCase(),
                                style: data.gettexttheme.fs16_regular,
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
                    AppServices.addHeight(15),
                    GradientDivider(
                      data: data,
                      middleGradient: true,
                    ),
                    AppServices.addHeight(10),

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
                                      check ? data.getcolor.primaryColor : null,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                      color:
                                          data.getcolor.gray.withOpacity(0.2))),
                              child: Text(week_list[index],
                                  style: data.gettexttheme.fs16_regular
                                      .copyWith(
                                          color: check
                                              ? data.getcolor.white
                                              : data.getcolor.black)),
                            ),
                          );
                        })
                      ],
                    )
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
                            activeColor: data.getcolor.primaryColor,
                            value: meal_cat[index],
                            groupValue: initial_value,
                            onChanged: (value) => setState(() {
                                  initial_value = value.toString();
                                })),
                        Text(
                          meal_cat[index],
                          style: data.gettexttheme.fs16_regular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppServices.addHeight(15),
              PrimaryContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// *******    Meal Text Filled   *********** ///
                    PrimaryTextField(
                      title: LanguageConsts.mealN.tr,
                      hintText: LanguageConsts.EnterYMN.tr,
                    ),
                    AppServices.addHeight(10),

                    PrimaryTextField(
                      title: LanguageConsts.InsideBM.tr,
                      hintText: LanguageConsts.EnterYMD.tr,
                    ),
                    AppServices.addHeight(10),

                    PrimaryTextField(
                      title: LanguageConsts.description.tr,
                      maxLines: 4,
                      hintText: LanguageConsts.EnterYD.tr,
                    ),
                    AppServices.addHeight(10),

                    Row(
                      children: [
                        PrimaryTextField(
                          title: LanguageConsts.price.tr,
                          hintText: LanguageConsts.EnterYP.tr,
                          isExpanded: true,
                          keyboardType: TextInputType.number,
                        ),
                        Expanded(child: SizedBox())
                      ],
                    ),
                    AppServices.addHeight(13),
                    Obx(
                      () => CheckboxWidget(
                          checkcolor: data.getcolor.primaryColor,
                          text: LanguageConsts.includedIS.tr,
                          style: data.gettexttheme.fs12_regular,
                          onSelect: (v) {
                            if (isIncluded.isEmpty) {
                              isIncluded(v);
                            } else {
                              isIncluded("");
                            }
                          },
                          selected_text: isIncluded.value),
                    ),
                  ],
                ),
              ),
              AppServices.addHeight(10),
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(left: 11.w),
                  child: CheckboxWidget(
                      checkcolor: data.getcolor.primaryColor,
                      text: LanguageConsts.mealA.tr,
                      style: data.gettexttheme.fs16_regular,
                      onSelect: (v) {
                        if (addMealController.isMealaddons.isEmpty) {
                          addMealController.setisMealaddons(v);
                        } else {
                          addMealController.setisMealaddons("");
                        }
                      },
                      selected_text: addMealController.isMealaddons),
                ),
              ),
              AppServices.addHeight(10),
              Obx(
                () => addMealController.isMealaddons.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: List.generate(
                              addMealController.meallist.length,
                              (index) => Stack(children: [
                                PrimaryContainer(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PrimaryTextField(
                                              title: LanguageConsts.category.tr,
                                              controller: addMealController
                                                  .meallist[index]
                                                  .categoryController,
                                              hintText:
                                                  LanguageConsts.EnterYC.tr,
                                            ),
                                          ],
                                        ),
                                      ),
                                      AppServices.addWidth(10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PrimaryTextField(
                                              title: LanguageConsts.price.tr,
                                              controller: addMealController
                                                  .meallist[index]
                                                  .priceController,
                                              hintText:
                                                  LanguageConsts.EnterYP.tr,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        addMealController.removemeallist(
                                            addMealController.meallist[index]);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: data.getcolor.primaryColor,
                                      ),
                                    )),
                              ]).paddingOnly(
                                  bottom: addMealController.meallist.length != 1
                                      ? 10
                                      : 0),
                            ),
                          ),
                          AppServices.addHeight(15),
                          TransprntBtn(
                              onPressed: () {
                                final aa = MealAddonsFormModel();
                                addMealController.setMeallist(aa);
                              },
                              icon: Icon(
                                Icons.add_circle_outline_sharp,
                                color: data.getcolor.primaryColor,
                              ),
                              text: LanguageConsts.addmore.tr,
                              style: data.gettexttheme.fs14_regular
                                  .copyWith(color: data.getcolor.primaryColor)),
                        ],
                      )
                    : SizedBox(),
              ),
              AppServices.addHeight(10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PrimaryButton(
                        foregroundColor: data.getcolor.primaryColor,
                        backgroundColor: data.getcolor.lightred,
                        title: LanguageConsts.reset.tr,
                        onPressed: () {}),
                  ),
                  AppServices.addWidth(10),
                  Expanded(
                    flex: 3,
                    child: PrimaryButton(
                        backgroundColor: data.getcolor.green,
                        title: LanguageConsts.uploadD.tr,
                        onPressed: () {
                          Get.to(TodayMealView());
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
