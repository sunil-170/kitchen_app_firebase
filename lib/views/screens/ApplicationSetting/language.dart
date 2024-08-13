import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:kitchen_app/model/customerslist_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/controllers/language/language_controller.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/ApplicationSetting/widget/tile.dart';

class Changelanguage extends StatelessWidget {
  const Changelanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LanguageController>();
    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: LanguageConsts.language.tr,
      ),
      body: ListView(
        children: [
          AppServices.addHeight(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: PrimaryContainer(
              shadow: true,
              child: Column(children: [
                ListView.separated(
                    itemBuilder: (context, i) {
                      final language = Languages.languages[i];
                      print(controller.selectedLanguage == language);
                      return Obx(() => SwitchAdaptivetile(
                            title: language.languagename,
                            value: controller.selectedLanguage == language,
                            onChanged: (value) =>
                                controller.setLanguage(language),
                          ));
                    },
                    separatorBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: GradientDivider(
                          data: data,
                          middleGradient: true,
                        ),
                      );
                    },
                    itemCount: Languages.languages.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics())
              ]),
            ),
          )
        ],
      ),
    );
  }
}
