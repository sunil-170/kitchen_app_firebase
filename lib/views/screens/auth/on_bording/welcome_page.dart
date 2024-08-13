import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/controllers/Authcontrollers/auth_controllers.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/screens/auth/auth.dart';
class Welcome_Page extends StatefulWidget {
  const Welcome_Page({super.key});

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  void initState() {
    initalState();
    super.initState();
  }

  initalState() async {
    Future.delayed(Duration(milliseconds: 300), () async {
      await Get.find<AuthControllers>().Reloginaccount();
    });

    // await Future.delayed(
    //     Duration(seconds: 2), () => Get.toNamed(Routesname.Login_page));
  }

  ///Helpers
  var data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: AppServices.getScreenWidth,
      height: AppServices.getScreenHeight,
      padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 60.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              data.getcolor.primaryColorLight,
              data.getcolor.primaryColorLight,
              data.getcolor.primaryColorLight,
              data.getcolor.primaryColorLight.withOpacity(0.3),
            ],
          ),
          image: DecorationImage(
              image: AssetImage(data.getimg.onboardingImage),
              alignment: Alignment.topCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            LanguageConsts.foodlh.tr,
            style: data.gettexttheme.fs40_medium,
          ),
          AppServices.addHeight(10),
          Text(
            LanguageConsts.enjoyymt.tr,
            style: data.gettexttheme.fs16_regular
                .copyWith(color: data.getcolor.gray),
          ),
          AppServices.addHeight(10),
          Row(
            children: [
              PrimaryButton(
                  title: LanguageConsts.gets.tr,
                  isExpanded: true,
                  onPressed: () {
                    // Get.toNamed(Routesname.Login_page);
                  }),
            ],
          ),
          AppServices.addHeight(10),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: LanguageConsts.alreadyhaali.tr,
                style: data.gettexttheme.fs16_regular),
            TextSpan(
                text: LanguageConsts.login.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // print("dfghjkl;==============================");
                    Get.to(LoginPage());
                  },
                style: data.gettexttheme.fs16_regular
                    .copyWith(color: data.getcolor.primaryColor))
          ]))
        ],
      ),
    ));
  }
}
