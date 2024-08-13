import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/Validator/validator.dart';
import 'package:kitchen_app/res/utils/primary_decorations.dart';
import 'package:kitchen_app/view_model/controllers/Authcontrollers/auth_controllers.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/Dailog/download_report.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/screens/auth/login/sign_up.dart';

import '../../../../res/config/App_services/app_services.dart';
import '../../../../res/config/routes/routs_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _passwordVisible = false;
  TextEditingController phn_controllers = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool isValidNumber = false;

  ///Helpers
  var data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 25),
            children: [
              AppServices.addHeight(AppServices.getScreenHeight * 0.08),
              Column(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(
                  data.getimg.dabbawala,
                  width: 260.w,
                ),
                Image.asset(
                  data.geticons.logo,
                  scale: 3,
                  width: 300,
                ),
              ]),
              AppServices.addHeight(20),
              Row(
                children: [
                  Expanded(child: GradientDivider(data: data)),
                  AppServices.addWidth(10),
                  Text(
                    LanguageConsts.logIOSU.tr,
                    style: data.gettexttheme.fs16_regular,
                  ),
                  AppServices.addWidth(10),
                  Expanded(
                      child: Transform.rotate(
                          angle: pi, child: GradientDivider(data: data))),
                ],
              ),
              AppServices.addHeight(20),
              Customtextformfilled(
                  validator: (value) =>
                      TextValidatioinController.isEmail(value),
                  prifixicon: Icons.person_2_outlined,
                  controller: _emailController,
                  hintText: "Username",
                  style: data.gettexttheme.fs14_regular
                      .copyWith(color: data.getcolor.gray),
                  fillcolor: data.getcolor.tranceparent),
              AppServices.addHeight(20),
              Customtextformfilled(
                  validator: (value) =>
                      TextValidatioinController.isPassword(value),
                  obsecure: _passwordVisible,
                  prifixicon: Icons.lock_outlined,
                  controller: _passwordController,
                  onSufixPressed: () =>
                      setState(() => _passwordVisible = !_passwordVisible),
                  icon: _passwordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  hintText: "***********",
                  style: data.gettexttheme.fs14_regular
                      .copyWith(color: data.getcolor.gray),
                  fillcolor: data.getcolor.tranceparent),

              // IntlPhoneField(
              //   controller: phn_controllers,
              //   dropdownIconPosition: IconPosition.trailing,
              //   dropdownIcon: Icon(Icons.arrow_drop_down_outlined,
              //       color: data.getcolor.black),
              //   flagsButtonPadding: EdgeInsets.only(left: 20),
              //   dropdownTextStyle: data.gettexttheme.fs16_regular,
              //   decoration: PrimaryDecorations.primaryTextFieldDecoration
              //       .copyWith(hintText: LanguageConsts.enterMN.tr),
              //   showCountryFlag: false,
              //   style: data.gettexttheme.fs16_regular
              //       .copyWith(color: data.getcolor.black60),
              //   initialCountryCode: 'IN',
              //   onChanged: (phone) {},
              // ),
              AppServices.addHeight(25),
              PrimaryButton(
                  title: "Login",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await AuthControllers().loginuser(
                          _emailController.text, _passwordController.text);
                    }
                  }),

              AppServices.addHeight(10),
              Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: LanguageConsts.alreadyhaali.tr,
                      style: data.gettexttheme.fs16_regular),
                  TextSpan(
                      text: "Sign up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(Sign_up_page());
                        },
                      style: data.gettexttheme.fs16_regular
                          .copyWith(color: data.getcolor.primaryColor))
                ])),
              ),
              AppServices.addHeight(20),
              Text(
                LanguageConsts.orCW.tr,
                textAlign: TextAlign.center,
                style: data.gettexttheme.fs16_regular,
              ),
              AppServices.addHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: data.getcolor.white, shape: BoxShape.circle),
                      child: Image.asset(
                        data.geticons.facebook,
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ),
                  AppServices.addWidth(10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: data.getcolor.white, shape: BoxShape.circle),
                      child: Image.asset(
                        data.geticons.goggle,
                        height: 32,
                        width: 32,
                      ),
                    ),
                  )
                ],
              ),
              AppServices.addHeight(20),
              Text(
                LanguageConsts.byCYATO.tr,
                style: data.gettexttheme.fs12_regular
                    .copyWith(color: data.getcolor.black60),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConsts.termsOS.tr,
                    style: data.gettexttheme.fs12_regular
                        .copyWith(color: data.getcolor.black60),
                  ),
                  AppServices.addWidth(10),
                  Text(
                    LanguageConsts.privacyP.tr,
                    style: data.gettexttheme.fs12_regular
                        .copyWith(color: data.getcolor.black60),
                  ),
                  AppServices.addWidth(10),
                  Text(
                    LanguageConsts.contentP.tr,
                    style: data.gettexttheme.fs12_regular
                        .copyWith(color: data.getcolor.black60),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
