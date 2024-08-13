import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/customerslist_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/dviders.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Customerdetailscreen extends StatelessWidget {
  // CustomerslistModel modeldata;
  Customerdetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// ------------------CUSTOMERS MODEL DATA GET ------------------------------------
    CustomerslistModel modeldata = Get.arguments;

    ///--------------------------Helpers-----------------------------
    var data = alldataManager;
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.Customersd.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryContainer(
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsetsDirectional.zero,
                      leading: Image.asset(data.geticons.profile),
                      title: Text(
                        modeldata.name,
                        style: data.gettexttheme.fs18_medium,
                      ),
                      subtitle: Text(
                        "+91 9999922222",
                        style: data.gettexttheme.fs14_regular
                            .copyWith(color: data.getcolor.black40),
                      ),
                      trailing: Icon(Icons.phone),
                    ),
                    AppServices.addHeight(10),
                    Dviders(),
                    AppServices.addHeight(10),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        AppServices.addWidth(10),
                        Expanded(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text:
                                    " Hotel The Icon, Talaki Gate, Rishi Nagar, Near bus stand, Hisar",
                                style: data.gettexttheme.fs16_regular
                                    .copyWith(color: data.getcolor.black40)),
                            TextSpan(
                                text: " - 4 KM away",
                                style: data.gettexttheme.fs16_regular.copyWith(
                                    color: data.getcolor.primaryColor))
                          ])),
                        )
                      ],
                    )
                  ],
                ),
              ),
              AppServices.addHeight(20),
              PrimaryContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LanguageConsts.SubscriptionD.tr,
                        style: data.gettexttheme.fs16_regular
                            .copyWith(color: data.getcolor.primaryColor)),
                    AppServices.addHeight(10),
                    Dviders(),
                    AppServices.addHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Started Date",
                            style: data.gettexttheme.fs16_regular),
                        Text("15-06-24", style: data.gettexttheme.fs16_bold)
                      ],
                    ),
                    AppServices.addHeight(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Expiry Date",
                            style: data.gettexttheme.fs16_regular),
                        Text("15-06-24", style: data.gettexttheme.fs16_bold)
                      ],
                    )
                  ],
                ),
              ),
              AppServices.addHeight(20),
              PrimaryContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LanguageConsts.PlanD.tr,
                            style: data.gettexttheme.fs16_regular
                                .copyWith(color: data.getcolor.primaryColor)),
                        Text("Weekly",
                            style: data.gettexttheme.fs16_bold
                                .copyWith(color: data.getcolor.primaryColor)),
                      ],
                    ),
                    AppServices.addHeight(10),
                    Dviders(),
                    AppServices.addHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("15 days Meal Plan",
                            style: data.gettexttheme.fs16_bold),
                        Text("Ongoing", style: data.gettexttheme.fs16_regular)
                      ],
                    ),
                    AppServices.addHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("07 Meals", style: data.gettexttheme.fs16_regular),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: data.getcolor.lightgreen),
                            child: Text("Completed",
                                style: data.gettexttheme.fs10_regular
                                    .copyWith(color: data.getcolor.green)))
                      ],
                    ),
                    AppServices.addHeight(5),
                    Text("₹80/Meal", style: data.gettexttheme.fs16_regular),
                  ],
                ),
              ),
              PrimaryContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: data.getcolor.lightred),
                          child: Text("Due in payment",
                              style: data.gettexttheme.fs10_regular
                                  .copyWith(color: data.getcolor.primaryColor)))
                    ],
                  ),
                  AppServices.addHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Meal Tittle",
                          style: data.gettexttheme.fs16_regular),
                      Text("Qty", style: data.gettexttheme.fs16_regular),
                      Text("Total", style: data.gettexttheme.fs16_regular),
                    ],
                  ),
                  AppServices.addHeight(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Breakfast", style: data.gettexttheme.fs16_regular),
                      Text("07x80", style: data.gettexttheme.fs16_regular),
                      Text("₹80", style: data.gettexttheme.fs16_regular),
                    ],
                  ),
                  AppServices.addHeight(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Meal Tittle",
                          style: data.gettexttheme.fs16_regular),
                      Text("07x80", style: data.gettexttheme.fs16_regular),
                      Text("₹80", style: data.gettexttheme.fs16_regular),
                    ],
                  ),
                  AppServices.addHeight(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(LanguageConsts.GrandT.tr,
                          style: data.gettexttheme.fs16_regular
                              .copyWith(color: data.getcolor.primaryColor)),
                      AppServices.addWidth(7),
                      Expanded(child: GradientDivider(data: data)),
                      Text("₹300",
                          style: data.gettexttheme.fs16_regular
                              .copyWith(color: data.getcolor.primaryColor)),
                    ],
                  ),
                ],
              )),
              AppServices.addHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: data.getcolor.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        LanguageConsts.GenerateI.tr,
                        style: data.gettexttheme.fs14_regular
                            .copyWith(color: data.getcolor.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
