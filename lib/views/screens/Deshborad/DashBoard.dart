import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/popular_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/clipers/deshborad_clipers.dart';
import 'package:kitchen_app/singleton/Alldatamanager.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/dotted_divider.dart';
import 'package:kitchen_app/views/components/widgets/polularitems.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/screens.dart';
import 'package:kitchen_app/views/screens/search/search_view.dart';
import 'package:kitchen_app/views/screens/search/widget/common_txtfilled.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../components/divider/gradient_divider.dart';

part 'widgets/Tittle_bar.dart';
part 'widgets/on_going_offers_tile.dart';
part 'widgets/recent_orders_tile.dart';
part 'widgets/report_widgets.dart';
part 'widgets/weeklyreporkwidget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ///-------Helpers--------------------
  var data = alldataManager;
  // ---------- WEEKLY REPORT BUTOON INDEX----------------
  int btnindex = 0;
  @override
  Widget build(BuildContext context) {
    ///---WeeklyReport LIST ------
    List<String> WeeklyReport_button = [
      LanguageConsts.daily.tr,
      LanguageConsts.Last7Days.tr,
      LanguageConsts.Last30Days.tr,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
//--------------------------------------Clipers------------------------------------------------------
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        data.getcolor.primaryColor.withOpacity(0.8),
                        data.getcolor.darkprimary.withOpacity(0.9),
                        data.getcolor.darkprimary,
                      ],
                    ),
                    image: DecorationImage(
                        scale: 4.2,
                        alignment: Alignment.centerRight,
                        image: AssetImage(
                          data.getimg.deshborad,
                        )),
                    color: data.getcolor.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            data.geticons.logo,
                            color: data.getcolor.white,
                            width: 168,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: data.getcolor.white.withOpacity(0.3)),
                            child: IconButton(
                                onPressed: () {
                                  Get.to(NotificationView());
                                },
                                icon: Image.asset(
                                  data.geticons.notification,
                                  width: 27,
                                  color: data.getcolor.white,
                                )),
                          )
                        ],
                      ),
                      AppServices.addHeight(10),
                      Text(
                        LanguageConsts.freshFCCJMYDK.tr,
                        style: data.gettexttheme.fs16_bold
                            .copyWith(color: data.getcolor.white),
                      ),
                      AppServices.addHeight(10),
                      //--------------------------------- SERACH FIELDS ----------------------------------------------------
                      CommonTextformfilled(
                          readOnly: true,
                          onpressed: () {
                            Get.to(SearchView());
                          },
                          text: LanguageConsts.searchFD.tr,
                          icon: Icons.search)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryContainer(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(data.geticons.profile, width: 90.w),
                          AppServices.addWidth(10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tiffin wala",
                                    style: data.gettexttheme.fs16_regular),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "Your profile is",
                                    style: data.gettexttheme.fs12_regular,
                                  ),
                                  TextSpan(
                                    text: " 82% ",
                                    style: data.gettexttheme.fs14_medium
                                        .copyWith(color: data.getcolor.green),
                                  ),
                                  TextSpan(
                                    text:
                                        "completed. Take some time to make it 100%. Click below to get started now.",
                                    style: data.gettexttheme.fs12_regular,
                                  ),
                                ])),
                                AppServices.addHeight(10),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: new LinearPercentIndicator(
                                        padding: EdgeInsets.zero,
                                        barRadius: Radius.circular(10),
                                        animation: true,
                                        lineHeight: 10.0,
                                        animationDuration: 2500,
                                        percent: 0.8,

                                        // ignore: deprecated_member_use
                                        linearStrokeCap:
                                            // ignore: deprecated_member_use
                                            LinearStrokeCap.round,
                                        progressColor: data.getcolor.green,
                                      ),
                                    ),
                                    AppServices.addWidth(10),
                                    Text("82% ",
                                        style: data.gettexttheme.fs12_regular
                                            .copyWith(
                                                color: data.getcolor.green)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      AppServices.addHeight(10),
                      // GradientDivider(data: data, middleGradient: true),
                      DottedDivider(),
                      AppServices.addHeight(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Remind me later",
                            style: data.gettexttheme.fs16_regular,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: data.getcolor.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Update Now",
                                style: data.gettexttheme.fs16_regular
                                    .copyWith(color: data.getcolor.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                  AppServices.addHeight(15),
                  _TitleBar(data: data, title: LanguageConsts.weeklyR.tr),
                  AppServices.addHeight(15),
                  Row(
                    children: [
                      ///  ---------- Weekly Report Button---------------
                      ...List.generate(
                          WeeklyReport_button.length,
                          (index) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size(0, 10),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color:
                                                    data.getcolor.primaryColor,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: btnindex == index
                                            ? data.getcolor.primaryColor
                                            : data.getcolor.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          btnindex = index;
                                        });
                                      },
                                      child: Text(
                                        WeeklyReport_button[index],
                                        style: data.gettexttheme.fs14_regular
                                            .copyWith(
                                                color: btnindex == index
                                                    ? data.getcolor.white
                                                    : data.getcolor.black),
                                      )),
                                ),
                              )),
                    ],
                  ),
                ],
              ),
            ),
            AppServices.addHeight(10),
//--------------------------------- Weekly Report widgets ----------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: PrimaryContainer(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _Weeklyreporkwidget(
                          bgcolor: data.getcolor.lightyallow,
                          tittle: LanguageConsts.sales.tr,
                          icons: data.geticons.sales,
                          persent: "84%",
                          plusgrade: "+14%",
                        ),
                        AppServices.addHeight(10),
                        _Weeklyreporkwidget(
                          bgcolor: data.getcolor.lightblue,
                          tittle: LanguageConsts.customers.tr,
                          icons: data.geticons.customers,
                          persent: "84%",
                          plusgrade: "+14%",
                        ),
                        AppServices.addHeight(10),
                        _Weeklyreporkwidget(
                          bgcolor: data.getcolor.lightgreen,
                          tittle: LanguageConsts.profit.tr,
                          icons: data.geticons.profit,
                          persent: "84%",
                          plusgrade: "+14%",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _ReportWidgets(
                          lightcolor: data.getcolor.lightyallow,
                          darkcolor: data.getcolor.yallow,
                          icons: data.geticons.sales,
                          textcolor: data.getcolor.yallow,
                          text: "80%",
                        ),
                        AppServices.addWidth(5),
                        _ReportWidgets(
                          lightcolor: data.getcolor.lightblue,
                          darkcolor: data.getcolor.blue,
                          icons: data.geticons.sales,
                          textcolor: data.getcolor.blue,
                          text: "80%",
                        ),
                        AppServices.addWidth(5),
                        _ReportWidgets(
                          lightcolor: data.getcolor.lightgreen,
                          darkcolor: data.getcolor.green,
                          icons: data.geticons.profit,
                          textcolor: data.getcolor.green,
                          text: "80%",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //--------------------------------------------- ONGOING OFFERS ----------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  AppServices.addHeight(15),
                  _TitleBar(data: data, title: LanguageConsts.ongoingO.tr),
                  AppServices.addHeight(15),
                  _OnGoingOffersTile(data: data),
                  AppServices.addHeight(15),
//--------------------------------- RESENT ORDERS ----------------------------------------------------
                  _TitleBar(data: data, title: LanguageConsts.recentO.tr),
                  AppServices.addHeight(15),
                  _RecentOrdersTile(data: data),

//--------------------------------- POPULAR ITEMS ----------------------------------------------------
                  AppServices.addHeight(15),
                  _TitleBar(data: data, title: LanguageConsts.popularI.tr),
                  AppServices.addHeight(15),
                  ListView.builder(
                    itemCount: Popularmodelhelpers.modellist.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Polularitems(
                      datamodel: Popularmodelhelpers.modellist[index],
                    ),
                  ),
                  AppServices.addHeight(10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
