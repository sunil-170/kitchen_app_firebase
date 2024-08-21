import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/TodayMealModal.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/singleton/Alldatamanager.dart';
import 'package:kitchen_app/view_model/TodayMealController/Todaymealcontroller.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/Dailog/addMealdialog.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/Menuscreen/addweeklymenu.dart';
import 'package:kitchen_app/views/screens/search/widget/TransprntBtn.dart';

class TodayMealView extends StatefulWidget {
  TodayMealView({super.key});

  @override
  State<TodayMealView> createState() => _TodayMealViewState();
}

class _TodayMealViewState extends State<TodayMealView> {
  final style = alldataManager;
  var selectcategory = "Brekfast";
  var initial_value = "";
  // List<String> category_type = [
  //   ...MealCategory.values.map((e) => e.name.toTitleCase())
  // ];
  List category_type = ["Brekfast", "Lunch", "Dinner"];
  List<String> meal_cat = [LanguageConsts.veg.tr, LanguageConsts.Nonvveg.tr];

  @override
  Widget build(BuildContext context) {
    print(selectcategory);
    print(initial_value);

    /// meal controller ///
    Get.put(Todaymealcontroller);
    // var data = Todaymealcontroller();
    // final dd = data.meallist.map((e) => e.date);
    // print(data);
    // print(dd);
    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: "Today's Meal",
        actions: [
          TransprntBtn(
              icon: Icon(
                Icons.add,
                color: style.getcolor.primaryColor,
              ),
              text: "Add New",
              style: style.gettexttheme.fs16_regular
                  .copyWith(color: style.getcolor.primaryColor),
              onPressed: () {
                Get.to(AddWeeklyMenuView());
              })
        ],
      ),
      body: SafeArea(
          child: ListView(padding: EdgeInsets.all(20.sp), children: [
        /// Added Meal Tile*****************///
        Meal_Tile(style: style),
        AppServices.addHeight(15),
        Row(
          children: [
            Expanded(
                child: Transform.rotate(
                    angle: (pi), child: GradientDivider(data: style))),
            AppServices.addWidth(10),
            Text("New Meal", style: style.gettexttheme.fs16_regular),
            AppServices.addWidth(10),
            Expanded(child: GradientDivider(data: style)),
          ],
        ),
        AppServices.addHeight(15),

        /// Meal Type ***************************///
        Container(
          padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 16.w),
          decoration: BoxDecoration(
              color: style.getcolor.white,
              borderRadius: BorderRadius.circular(10.r)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Text("Select Category"),
              isExpanded: true,
              isDense: true,
              value: selectcategory,
              style: style.gettexttheme.fs14_regular
                  .copyWith(color: style.getcolor.gray),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              items: category_type.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item.toString(),
                    style: style.gettexttheme.fs14_regular
                        .copyWith(color: style.getcolor.gray),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectcategory = newValue!;
                });
              },
            ),
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
        AppServices.addHeight(15),
        PrimaryContainer(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Prepare Box"),
                TransprntBtn(
                    icon: Icon(
                      Icons.add_circle_outline_outlined,
                      color: style.getcolor.primaryColor,
                    ),
                    text: "Add More",
                    style: style.gettexttheme.fs16_regular
                        .copyWith(color: style.getcolor.primaryColor),
                    onPressed: () {
                      /// meal popup **********///
                      Get.dialog(AddMealDialog(), barrierDismissible: false);
                    })
              ],
            ),
            GradientDivider(
              data: style,
              middleGradient: true,
            ),
            AppServices.addHeight(10),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.3, crossAxisCount: 3),
              itemBuilder: (context, index) => Column(
                children: [
                  Image.asset(
                    style.getimg.shahipaneer_img,
                    fit: BoxFit.cover,
                  ),
                  AppServices.addHeight(10),
                  Text(
                    "Shahi Paneer",
                    style: style.gettexttheme.fs16_regular,
                  )
                ],
              ),
            ),
          ],
        )),
        AppServices.addHeight(15),
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
                  onPressed: () async {
                    await Todaymealcontroller().addmealfun(mealdata());

                    /// Upload Meal Button ************** ///
                    // Get.to(TodayMealView());
                  }),
            ),
          ],
        )
      ])),
    );
  }

  Map<String, dynamic> mealdata() {
    return AddMealModal(date: DateTime.now().toIso8601String(), meals: [
      MealsModal(
          available: true,
          price: 30,
          mealId: Myfunctions.generateId(),
          meal_name: initial_value,
          meal_type: selectcategory.toString())
    ]).toJson();
  }

  // validate_function(Todaymealcontroller controller) async {
  //   controller
  //       .setmeal(AddMealModal(date: DateTime.now().toIso8601String(), meals: [
  // MealsModal(
  //     available: true,
  //     price: 30,
  //     mealId: Myfunctions.generateId(),
  //     meal_name: initial_value,
  //     meal_type: selectcategory.toString())
  //   ]));
  //   print(AddMealModal().toJson());
  //   final ref = await FirebaseFirestore.instance.collection("TodayMeal");
  //   await ref.add(AddMealModal().toJson());
  // }
}

class Meal_Tile extends StatelessWidget {
  const Meal_Tile({
    super.key,
    required this.style,
  });
  final AllDataManager style;
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "BREAKFAST", style: style.gettexttheme.fs16_regular),
              TextSpan(text: "(Veg)", style: style.gettexttheme.fs16_regular)
            ])),
            PopupMenuButton<String>(
                icon: Icon(Icons.more_vert),
                color: style.getcolor.white,
                surfaceTintColor: style.getcolor.white,
                offset: Offset(-15, 8),
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                onSelected: (value) {
                  if (value == 'edit') {
                    // Handle edit action
                  } else if (value == 'delete') {}
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        padding: EdgeInsets.all(5),
                        height: 25.h,
                        value: 'edit',
                        child: Center(
                            child: Text('Edit', textAlign: TextAlign.center)),
                      ),
                    ]),
          ],
        ),
        AppServices.addHeight(10),
        GradientDivider(
          data: style,
          middleGradient: true,
        ),
        AppServices.addHeight(10),
        Text(
          "Shahi Paneer",
          style: style.gettexttheme.fs16_regular,
        )
      ],
    ));
  }
}
