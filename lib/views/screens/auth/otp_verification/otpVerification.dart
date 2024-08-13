import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/bottombar/bottom_bar.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../res/config/App_services/app_services.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    ///Helpers
    var data = alldataManager;
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.otpV.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppServices.addHeight(AppServices.getScreenHeight * 0.08),
              Text(
                "${LanguageConsts.weHSAVCT.tr}  \n+91  8708540952",
                style: data.gettexttheme.fs16_regular,
                textAlign: TextAlign.center,
              ),
              AppServices.addHeight(25),
              Image.asset(
                data.getimg.otp,
                scale: 2.5,
              ),
              AppServices.addHeight(30),
              OTPTextField(
                length: 6,
                width: AppServices.getScreenWidth,
                fieldWidth: 50.w,
                style: data.gettexttheme.fs16_regular
                    .copyWith(color: data.getcolor.primaryColor),
                fieldStyle: FieldStyle.box,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: data.getcolor.black20,
                  focusBorderColor: data.getcolor.primaryColor,
                  enabledBorderColor: data.getcolor.black20,
                ),
                onChanged: (v) {},
                onCompleted: (v) {
                  Get.to(MyBottomNavi());
                },
              ),
              AppServices.addHeight(30),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: LanguageConsts.didtGTO.tr,
                    style: data.gettexttheme.fs16_regular),
                TextSpan(
                    text: LanguageConsts.ResendSMS.tr,
                    style: data.gettexttheme.fs16_regular
                        .copyWith(color: data.getcolor.primaryColor))
              ])),
              AppServices.addHeight(5),
              Text(LanguageConsts.tryMO.tr,
                  style: data.gettexttheme.fs16_regular
                      .copyWith(color: data.getcolor.primaryColor))
            ],
          ),
        ),
      ),
    );
  }
}
