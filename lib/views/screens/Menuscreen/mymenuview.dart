import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/extensions/string_extensions.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/view_model/enums/enums.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

import '../../components/divider/gradient_divider.dart';

/// *******   My Menu Widget   *********** ///
class MymenuView extends StatefulWidget {
  MymenuView({super.key});

  @override
  State<MymenuView> createState() => _MymenuViewState();
}

List<String> meal_btn = [
  LanguageConsts.all.tr,
  ...MealCategory.values.map((e) => e.name.toTitleCase())
];
var btnindex = "";
var colorindex = 0;

class _MymenuViewState extends State<MymenuView> {
  final data = alldataManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: LanguageConsts.myMenu.tr,
        autoImplyLeading: false,
      ),
      body: SafeArea(
          child: ListView(padding: EdgeInsets.all(16.sp), children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 1,
                child: GradientDivider(
                  data: data,
                )),
            AppServices.addWidth(10),

            /// *******   Add Meal Button Widget *********** ///
            TextButton.icon(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  Get.toNamed(Routesname.AddMealView);
                  // Get.to(AddMenuView());
                },
                label: Text(LanguageConsts.addM.tr)),
          ],
        ),
        AppServices.addHeight(5),

        /// *******  Meal Category    *********** ///
        Row(
          children: [
            ...List.generate(meal_btn.length, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          btnindex = meal_btn[index];
                          colorindex = index;
                        });
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(6.sp),
                          minimumSize: Size(75, 10),
                          backgroundColor: colorindex == index
                              ? data.getcolor.primaryColor
                              : data.getcolor.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              side: BorderSide(
                                  color: data.getcolor.primaryColor
                                      .withOpacity(0.5)))),
                      child: Text(
                        meal_btn[index],
                        style: data.gettexttheme.fs14_medium.copyWith(
                            color: colorindex == index
                                ? data.getcolor.white
                                : data.getcolor.black),
                      )),
                ),
              );
            }),
          ],
        ),
        // AppServices.addHeight(15),

        // /// ******* Meal Common Widget    *********** ///
        // ///
        // GestureDetector(
        //     onTap: () {
        //       Get.toNamed(Routesname.View_itemDetailsView);
        //     },
        //     child: Mealcommonwidget(data: data)),
        // Mealcommonwidget(data: data),
        // AppServices.addHeight(15),
        // GradientDivider(
        //   data: data,
        //   middleGradient: true,
        // ),
        AppServices.addHeight(15),
        GridView.builder(
          itemCount: 5,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Stack(children: [
              PrimaryContainer(
                  horizontalPadding: 0,
                  verticalPadding: 5,
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          data.getimg.menu_img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      AppServices.addHeight(10.h),
                      Text(
                        "Dal Makhani",
                        style: data.gettexttheme.fs16_regular,
                      ),
                      AppServices.addHeight(5.h),
                      Text(
                        "\u20B9${80}",
                        style: data.gettexttheme.fs20_medium,
                      )
                    ],
                  )),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 44.h,
                    width: 34.w,
                    decoration: BoxDecoration(
                        color: Color(0xffFED9CC),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.r),
                            topRight: Radius.circular(10.r))),
                    child: PopupMenuButton<String>(
                        iconColor: data.getcolor.primaryColor,
                        icon: Icon(Icons.more_vert),
                        color: data.getcolor.white,
                        surfaceTintColor: data.getcolor.white,
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
                                height: 30.h,
                                value: 'edit',
                                child: Center(
                                    child: Text('Edit',
                                        textAlign: TextAlign.center)),
                              ),
                            ]),
                  )),
            ]);
          },
        ),

        // PrimaryContainer(
        //     child: Stack(
        //   children: [
        //     Column(
        //       children: [
        //         Image.asset(
        //           data.getimg.offersimg,
        //           fit: BoxFit.cover,
        //           scale: 2,
        //         ),
        //         Text("Dal Makhani"),
        //         Text("80 Rs.")
        //       ],
        //     ),
        //     Positioned(
        //         right: 0,
        //         child: PopupMenuButton<String>(
        //             icon: Container(
        //                 decoration: BoxDecoration(color: Colors.blue),
        //                 child: Icon(Icons.more_vert)),
        //             color: data.getcolor.white,
        //             surfaceTintColor: data.getcolor.white,
        //             offset: Offset(-15, 8),
        //             position: PopupMenuPosition.under,
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10.r)),
        //             onSelected: (value) {
        //               if (value == 'edit') {
        //                 // Handle edit action
        //               } else if (value == 'delete') {}
        //             },
        //             itemBuilder: (context) => [
        //                   PopupMenuItem(
        //                     padding: EdgeInsets.all(5),
        //                     height: 30.h,
        //                     value: 'edit',
        //                     child: Center(
        //                         child:
        //                             Text('Edit', textAlign: TextAlign.center)),
        //                   ),
        //                 ]))
        //   ],
        // )),
      ])),
    );
  }
}
