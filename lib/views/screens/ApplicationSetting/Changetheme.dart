import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/controllers/Theme/theme_controllers.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/components/widgets/settinglisttile.dart';
import 'package:kitchen_app/views/screens/ApplicationSetting/widget/tile.dart';

class Changetheme extends StatefulWidget {
  const Changetheme({super.key});

  @override
  State<Changetheme> createState() => _ChangethemeState();
}

class _ChangethemeState extends State<Changetheme> {
  int? currentindex = 0;
  final controller = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: LanguageConsts.changeT.tr,
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
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        final theme = controller.themes[i];
                        return Obx(() => SwitchAdaptivetile(
                            value: controller.currentTheme == theme,
                            onChanged: (value) =>
                                controller.setCurrentTheme(theme),
                            title: theme.title.tr));
                      },
                      separatorBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: GradientDivider(
                            data: data,
                            middleGradient: true,
                          ),
                        );
                      },
                      itemCount: controller.themes.length)
                ])),
          )
        ],
      ),
    );
  }
}
