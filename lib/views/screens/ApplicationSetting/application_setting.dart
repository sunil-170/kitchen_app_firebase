import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/components/widgets/settinglisttile.dart';

class Applicationsetting extends StatelessWidget {
  const Applicationsetting({super.key});

  @override
  Widget build(BuildContext context) {
    ///Helpers
    var data = alldataManager;
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.applicationS.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            AppServices.addHeight(10),
            PrimaryContainer(
                shadow: true,
                verticalPadding: 10,
                child: Column(
                  children: [
                    Profiletile(
                        image: data.geticons.changetheme,
                        name: LanguageConsts.changeT.tr,
                        onPressed: () {
                          Get.toNamed(Routesname.Changetheme);
                        }),
                    AppServices.addHeight(5),
                    GradientDivider(
                      data: data,
                      middleGradient: true,
                    ),
                    AppServices.addHeight(5),
                    Profiletile(
                        image: data.geticons.language,
                        name: LanguageConsts.language.tr,
                        onPressed: () {
                          Get.toNamed(Routesname.Changelanguage);
                        }),
                    AppServices.addHeight(5),
                    GradientDivider(
                      data: data,
                      middleGradient: true,
                    ),
                    AppServices.addHeight(5),
                    Profiletile(
                        image: data.geticons.notification,
                        name: LanguageConsts.notification.tr,
                        onPressed: () {
                          Get.toNamed(Routesname.Changenotification);
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
