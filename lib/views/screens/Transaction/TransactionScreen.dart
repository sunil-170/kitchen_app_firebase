import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/transaction.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/Dailog/download_report.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/transaction.dart';

class Transactionscreen extends StatefulWidget {
  const Transactionscreen({super.key});

  @override
  State<Transactionscreen> createState() => _TransactionscreenState();
}

class _TransactionscreenState extends State<Transactionscreen> {
  int btnindex = 0;
  bool cashvalue = false;
  @override
  Widget build(BuildContext context) {
    ///-----------Helpers--------------------
    var data = alldataManager;

    ///-------------------------------------Filter_button-----------------------
    List<String> Filter_button = [
      LanguageConsts.today.tr,
      LanguageConsts.ThisWeek.tr,
      LanguageConsts.ThisMonth.tr
    ];

    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.transactions.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: Alignment.topRight, children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: data.getcolor.primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConsts.AvailableB.tr,
                        style: data.gettexttheme.fs16_regular
                            .copyWith(color: data.getcolor.white),
                      ),
                      AppServices.addHeight(7),
                      Text(
                        "₹9500.00",
                        style: data.gettexttheme.fs22_bold
                            .copyWith(color: data.getcolor.white),
                      ),
                      AppServices.addHeight(7),

                      ///--------------------------------DVAIDERS--------------------------------
                      GradientDivider(
                        data: data,
                        middleGradient: true,
                      ),
                      AppServices.addHeight(7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(LanguageConsts.Received.tr,
                                  style: data.gettexttheme.fs12_regular
                                      .copyWith(color: data.getcolor.white)),
                              Text(
                                "1200",
                                style: data.gettexttheme.fs16_bold
                                    .copyWith(color: data.getcolor.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(LanguageConsts.Receivable.tr,
                                  style: data.gettexttheme.fs12_regular
                                      .copyWith(color: data.getcolor.white)),
                              Text(
                                "1200",
                                style: data.gettexttheme.fs16_bold
                                    .copyWith(color: data.getcolor.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(LanguageConsts.Sent.tr,
                                  style: data.gettexttheme.fs12_regular
                                      .copyWith(color: data.getcolor.white)),
                              Text(
                                "1200",
                                style: data.gettexttheme.fs16_bold
                                    .copyWith(color: data.getcolor.white),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //---------------------------------------POPUPMENUBUTTON--------------------------------------------------
                PopupMenuButton(
                  color: data.getcolor.white,
                  iconColor: data.getcolor.white,
                  enabled: true,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        height: 20,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        onTap: () {
                          Get.dialog(
                            Sale_Report_dailog(),
                          );
                        },
                        child: Text(
                          LanguageConsts.DownloadReport.tr,
                          style: data.gettexttheme.fs14_regular,
                        )),
                  ],
                )
              ]),
              AppServices.addHeight(20),
              Row(
                children: [
                  ///-----------------------------------------------FILTER BUTTON DATA --------------------------------------------------
                  ...List.generate(
                      Filter_button.length,
                      (index) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5, left: 0),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(0, 10),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: data.getcolor.primaryColor,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: btnindex == index
                                        ? data.getcolor.primaryColor
                                        : data.getcolor.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      // Navigator.pushNamed(
                                      //     context, Routsname.Food_screen);
                                      btnindex = index;
                                    });
                                  },
                                  child: Text(
                                    Filter_button[index],
                                    style: data.gettexttheme.fs16_regular
                                        .copyWith(
                                            color: btnindex == index
                                                ? data.getcolor.white
                                                : data.getcolor.black),
                                  )),
                            ),
                          )),
                ],
              ),
              // --------------------------------------TRANSACTION DATA ----------------------------------------------------------
              AppServices.addHeight(20),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                shrinkWrap: true,
                itemCount: TransactionHelpers.list.length,
                itemBuilder: (context, index) => Transaction_widget(
                    modeldata: TransactionHelpers.list[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
