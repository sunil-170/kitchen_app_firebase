import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kitchen_app/model/customerslist_model.dart';
import 'package:kitchen_app/model/user_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/Validator/validator.dart';
import 'package:kitchen_app/view_model/controllers/Authcontrollers/auth_controllers.dart';
import 'package:kitchen_app/views/components/Dailog/download_report.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/screens/auth/auth.dart';

class Sign_up_page extends StatefulWidget {
  const Sign_up_page({super.key});

  @override
  State<Sign_up_page> createState() => _Sign_up_pageState();
}

class _Sign_up_pageState extends State<Sign_up_page> {
  bool colorchange = false;
  String Selectform = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ganderControllers = TextEditingController();

  TextEditingController _CityControllers = TextEditingController();
  TextEditingController _StateControllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppServices.addHeight(10),
                  Text(
                    "Registration",
                    style: data.gettexttheme.fs24_regular,
                  ),

                  Text('Personal Information',
                      style: data.gettexttheme.fs14_regular),
                  AppServices.addHeight(15),
                  Customtextformfilled(
                    validator: (value) =>
                        TextValidatioinController.isTextValid(value),
                    prifixicon: Icons.person_2_outlined,
                    controller: _fullnameController,
                    hintText: "Username",
                    style: data.gettexttheme.fs14_regular,
                    fillcolor: data.getcolor.tranceparent,
                  ),
                  AppServices.addHeight(15),
                  Customtextformfilled(
                    Keyboradtype: TextInputType.number,
                    maxlength: 10,
                    validator: (value) =>
                        TextValidatioinController.isTextValid(value),
                    prifixicon: Icons.phone_android,
                    controller: _phoneController,
                    hintText: "Phone",
                    style: data.gettexttheme.fs14_regular,
                    fillcolor: data.getcolor.tranceparent,
                  ),
                  AppServices.addHeight(15),
                  Customtextformfilled(
                    validator: (value) =>
                        TextValidatioinController.isEmail(value),
                    prifixicon: Icons.email_outlined,
                    controller: _emailController,
                    hintText: "Email (optional)",
                    style: data.gettexttheme.fs14_regular,
                    fillcolor: data.getcolor.tranceparent,
                  ),
                  AppServices.addHeight(15),
                  Customtextformfilled(
                    validator: (value) =>
                        TextValidatioinController.isTextValid(value),
                    controller: _ganderControllers,
                    hintText: "Gander",
                    prifixicon: Icons.person,
                    style: data.gettexttheme.fs14_regular,
                    fillcolor: data.getcolor.tranceparent,
                  ),
                  AppServices.addHeight(15),
                  Customtextformfilled(
                    validator: (value) =>
                        TextValidatioinController.isPassword(value),
                    controller: _passwordController,
                    hintText: "Password",
                    prifixicon: Icons.password,
                    style: data.gettexttheme.fs14_regular,
                    fillcolor: data.getcolor.tranceparent,
                  ),

                  AppServices.addHeight(15),
                  Row(
                    children: [
                      Customtextformfilled(
                        validator: (value) =>
                            TextValidatioinController.isTextValid(value),
                        isExpanded: true,
                        prifixicon: Icons.location_city,
                        controller: _CityControllers,
                        hintText: "City",
                        style: data.gettexttheme.fs14_regular,
                        fillcolor: data.getcolor.tranceparent,
                      ),
                      AppServices.addHeight(10),
                      Customtextformfilled(
                        validator: (value) =>
                            TextValidatioinController.isTextValid(value),
                        isExpanded: true,
                        prifixicon: Icons.sports_basketball_outlined,
                        controller: _StateControllers,
                        hintText: "State",
                        style: data.gettexttheme.fs14_regular,
                        fillcolor: data.getcolor.tranceparent,
                      ),
                    ],
                  ),
                  AppServices.addHeight(25),
                  Row(
                    children: [
                      PrimaryButton(
                          isExpanded: true,
                          title: "Register",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await AuthControllers().createAccount(
                                  creataccount(), _passwordController.text);
                            } else {}
                          }),
                    ],
                  ),
                  // CustomElevatedButton(
                  //     peddingv: 16,
                  //     foreground_clr: AppColors.whiteColor,
                  //     btnName: "Register",
                  //     onTap: () async {
                  //       if (colorchange == true) {
                  //         if (_formKey.currentState!.validate()) {
                  //           await AllFuntion(controller, context)
                  //               .createAccount(context, creataccount(),
                  //                   _passwordController.text);
                  //           AuthController().resetuser();

                  //           showDialog(
                  //               barrierDismissible: false,
                  //               context: context,
                  //               builder: (context) =>
                  //                   Registration_successful_dailog());
                  //         }
                  //       }
                  //     }),
                  AppServices.addHeight(10),
                  Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Already have an account?",
                          style: data.gettexttheme.fs14_regular),
                      TextSpan(
                          text: " Login Here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(LoginPage());
                            },
                          style: data.gettexttheme.fs14_regular
                              .copyWith(color: data.getcolor.primaryColor))
                    ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> creataccount() {
    return user_model(
      fullname: _fullnameController.text.trim(),
      phone_number: _phoneController.text.trim(),
      email: _emailController.text.trim(),
      gender: _ganderControllers.text.trim(),
      city: _CityControllers.text.trim(),
      state: _StateControllers.text.trim(),
    ).tojson();
  }
}
