import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:kitchen_app/model/customerslist_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/controllers/Authcontrollers/auth_controllers.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              AppServices.addHeight(50),
              CircularProgressIndicator()
            ]),
          ],
        ),
      ),
    );
  }
}
