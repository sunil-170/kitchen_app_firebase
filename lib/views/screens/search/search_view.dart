import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/screens/search/widget/TransprntBtn.dart';
import 'package:kitchen_app/views/screens/search/widget/common_txtfilled.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            AppServices.addHeight(15),

            /// *******  Search Dishes Text Filled *********** ///
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back(canPop: true);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                AppServices.addWidth(10.w),
                Expanded(
                    child: CommonTextformfilled(
                        text: LanguageConsts.searchFD.tr, icon: Icons.search))
              ],
            ),
            AppServices.addHeight(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    LanguageConsts.recentS.tr,
                    style: data.gettexttheme.fs16_regular,
                  ),
                ),
                TransprntBtn(
                  onPressed: () {},
                  text: LanguageConsts.clearA.tr,
                  style: data.gettexttheme.fs14_regular
                      .copyWith(color: data.getcolor.primaryColor),
                )
              ],
            ),

            /// *******  Resent Search History  *********** ///
            AppServices.addHeight(20),
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: data.getcolor.white),
              child: Column(
                children: [
                  ...List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Egg with Avacado",
                            style: data.gettexttheme.fs16_regular
                                .copyWith(color: data.getcolor.gray),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              data.geticons.close_icon,
                              scale: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
