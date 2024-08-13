import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/controllers/add_meal_controller.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/AddOffers/widget/Aboutdiscountwidget.dart';
import 'package:kitchen_app/views/screens/AddOffers/widget/AddFestival.dart';
import 'package:kitchen_app/views/screens/AddOffers/widget/Benifitwidget.dart';
import 'package:kitchen_app/views/screens/AddOffers/widget/SpendThresholdWidget.dart';
import 'package:kitchen_app/views/screens/AddOffers/widget/UsageDetails.dart';
import 'package:kitchen_app/views/screens/AddOffers/widget/photo_upload.dart';
import 'package:kitchen_app/views/screens/search/widget/TransprntBtn.dart';

class AddOffersView extends StatefulWidget {
  AddOffersView({super.key});
  @override
  State<AddOffersView> createState() => _AddOffersViewState();
}

class _AddOffersViewState extends State<AddOffersView> {
  final style = alldataManager;
  String selectedOffer = "";
  bool isbanner = false;
  List<String> offerTypes = [
    'General Discount',
    'First-Time Customer Discount',
    'Tiered Discount',
    'Bundle Discount'
  ];
  final addspendcontroller = Get.put(AddSpendController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.AddOffers.tr),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 16.w),
                decoration: BoxDecoration(
                    color: style.getcolor.white,
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text(LanguageConsts.SelectOT.tr),
                    isExpanded: true,
                    isDense: true,
                    value: selectedOffer.isEmpty ? null : selectedOffer,
                    style: style.gettexttheme.fs14_regular
                        .copyWith(color: style.getcolor.black),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    items: offerTypes.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: style.gettexttheme.fs14_regular
                              .copyWith(color: style.getcolor.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedOffer = newValue!;
                      });
                    },
                  ),
                ),
              ),
              AppServices.addHeight(10),
              selectedOffer.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LanguageConsts.ShowWB.tr,
                              style: style.gettexttheme.fs14_regular,
                            ),
                            Checkbox(
                              activeColor: style.getcolor.primaryColor,
                              value: isbanner,
                              onChanged: (value) {
                                setState(() {
                                  isbanner = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        AppServices.addHeight(15),

                        /// *******     Add Offers Photo     *********** ///
                        isbanner
                            ? Photo_upload().paddingOnly(bottom: 15)
                            : SizedBox(),

                        /// About Discount Section  ************************************///
                        Text(
                          LanguageConsts.AboutD.tr,
                          style: style.gettexttheme.fs14_regular,
                        ),
                        AppServices.addHeight(15),
                        AboutDiscountWidget(),
                        AppServices.addHeight(15),

                        /// Benifits  Section  ************************************///
                        Text(
                          LanguageConsts.Benefits.tr,
                          style: style.gettexttheme.fs14_regular,
                        ),
                        AppServices.addHeight(15),

                        BenifitWidget(),
                        AppServices.addHeight(15),

                        /// Usage Details  Section  ************************************///
                        Text(
                          LanguageConsts.UsageD.tr,
                          style: style.gettexttheme.fs14_regular,
                        ),
                        AppServices.addHeight(15),
                        UsageDetailsWidget(),
                        AppServices.addHeight(15),

                        /// Add Festival   Section  ************************************///
                        TransprntBtn(
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              color: style.getcolor.primaryColor,
                            ),
                            text: LanguageConsts.addFD.tr,
                            style: style.gettexttheme.fs14_regular
                                .copyWith(color: style.getcolor.primaryColor),
                            onPressed: () {}),
                        AppServices.addHeight(15),
                        FestivalWidget(),
                        AppServices.addHeight(15),

                        /// Spend Threshold   Section  ************************************///
                        Obx(
                          () => addspendcontroller.isspendadd.isNotEmpty
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Spend Threshold"),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color:
                                                  style.getcolor.primaryColor,
                                            )),
                                      ],
                                    ),
                                    ...List.generate(
                                      addspendcontroller.isspendadd.length,
                                      (index) {
                                        return Spendthresholdwidget();
                                      },
                                    ),
                                    AppServices.addHeight(10),
                                  ],
                                )
                              : SizedBox(),
                        ),
                        Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.topRight,
                            children: [
                              PrimaryContainer(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Minimum Spend",
                                        style: style.gettexttheme.fs12_regular,
                                      ),
                                      Text(
                                        "₹400",
                                        style: style.gettexttheme.fs16_regular,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Discount",
                                          style:
                                              style.gettexttheme.fs12_regular),
                                      Text("10%",
                                          style:
                                              style.gettexttheme.fs16_regular),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("10-03-2024",
                                          style:
                                              style.gettexttheme.fs16_regular),
                                      Text("To",
                                          style:
                                              style.gettexttheme.fs16_regular),
                                      Text("10-03-2024",
                                          style:
                                              style.gettexttheme.fs16_regular),
                                    ],
                                  ),
                                ],
                              )),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: style.getcolor.lightred),
                                  child: Icon(
                                    Icons.close,
                                  ),
                                ),
                              ),
                            ]),
                        AppServices.addHeight(10),
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
                    )
                  : SizedBox(),
            ],
          ),
        ),
      )),
    );
  }
}
