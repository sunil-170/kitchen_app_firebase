import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/pdf/widget/bill_breakout.dart';

class MyBillView extends StatefulWidget {
  MyBillView({super.key});

  @override
  State<MyBillView> createState() => _MyBillViewState();
}

class _MyBillViewState extends State<MyBillView> {
  final data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.myB.tr),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryContainer(
                  child: Column(
                children: [
                  Text(
                    "${LanguageConsts.BillNo.tr} 875648",
                    style: data.gettexttheme.fs16_regular,
                  ),
                  AppServices.addHeight(10),
                  GradientDivider(
                    data: data,
                    middleGradient: true,
                  ),
                  AppServices.addHeight(10),
                  Text(
                    "Tiffin Wala shared a Bill with you\nat 04:30 PM",
                    textAlign: TextAlign.center,
                    style: data.gettexttheme.fs16_regular,
                  ),
                  AppServices.addHeight(10),
                  Text(
                    "₹600.00",
                    style: data.gettexttheme.fs28_bold
                        .copyWith(color: data.getcolor.primaryColor),
                  ),
                ],
              )),
              AppServices.addHeight(15),
              PrimaryContainer(
                  child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        data.getimg.bill_img,
                        fit: BoxFit.cover,
                        width: 60,
                      ),
                      AppServices.addWidth(10),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Tiffin Wala",
                                    style: data.gettexttheme.fs16_bold,
                                  ),
                                ),
                                Text(
                                  "24-06-2024",
                                  style: data.gettexttheme.fs16_regular,
                                ),
                              ],
                            ),
                            Text(
                              "House No.511 Khokha Hisar",
                              style: data.gettexttheme.fs14_regular,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  AppServices.addHeight(10),
                  GradientDivider(
                    data: data,
                    middleGradient: true,
                  ),
                  AppServices.addHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageConsts.BillD.tr,
                        style: data.gettexttheme.fs16_regular,
                      ),
                      Text(
                        "Weekly",
                        style: data.gettexttheme.fs16_bold,
                      ),
                    ],
                  ),
                ],
              )),
              AppServices.addHeight(15),
              PrimaryContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "15 days Meal Plan",
                        style: data.gettexttheme.fs16_bold,
                      ),
                      Text("Ongoing", style: data.gettexttheme.fs16_bold),
                    ],
                  ),
                  AppServices.addHeight(10),
                  Text("₹80/Meal", style: data.gettexttheme.fs16_regular),
                  AppServices.addHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("07 Meals", style: data.gettexttheme.fs16_regular),
                      Text("Completed", style: data.gettexttheme.fs16_bold),
                    ],
                  ),
                ],
              )),
              AppServices.addHeight(15),
              Text(LanguageConsts.Details.tr,
                  style: data.gettexttheme.fs16_regular),
              AppServices.addHeight(10),

              /// Bill Breakout widget ************************///
              Bill_breakout(data: data),
              AppServices.addHeight(15),

              /// Sub Total Section ************************///
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LanguageConsts.SubT.tr,
                          style: data.gettexttheme.fs16_regular),
                      Text(LanguageConsts.Tax.tr,
                          style: data.gettexttheme.fs16_regular),
                    ],
                  ),
                  AppServices.addWidth(10),
                  Column(
                    children: [
                      Text(
                        ":",
                        style: data.gettexttheme.fs16_regular,
                      ),
                      Text(
                        ":",
                        style: data.gettexttheme.fs16_regular,
                      ),
                    ],
                  ),
                  AppServices.addWidth(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sub Total", style: data.gettexttheme.fs16_regular),
                      Text("Tax", style: data.gettexttheme.fs16_regular),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
