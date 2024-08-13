import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/components/widgets/settinglisttile.dart';
import 'package:kitchen_app/views/screens/ApplicationSetting/widget/tile.dart';

class Changenotification extends StatefulWidget {
  const Changenotification({super.key});

  @override
  State<Changenotification> createState() => _ChangenotificationState();
}

class _ChangenotificationState extends State<Changenotification> {
  int? currentindex = 0;
  void _handleSwitchChanged(int index, bool value) {
    setState(() {
      if (value) {
        currentindex = index;
      } else if (currentindex == index) {
        currentindex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.notification.tr),
      body: ListView(
        children: [
          AppServices.addHeight(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: PrimaryContainer(
              shadow: true,
              child: Column(children: [
                SwitchAdaptivetile(
                    value: currentindex == 0,
                    onChanged: (value) => _handleSwitchChanged(0, value),
                    title: LanguageConsts.sound.tr),
                GradientDivider(
                  data: data,
                  middleGradient: true,
                ),
                AppServices.addHeight(10),
                SwitchAdaptivetile(
                    value: currentindex == 1,
                    onChanged: (value) => _handleSwitchChanged(1, value),
                    title: LanguageConsts.vibrate.tr),
                GradientDivider(
                  data: data,
                  middleGradient: true,
                ),
                AppServices.addHeight(10),
                SwitchAdaptivetile(
                    value: currentindex == 2,
                    onChanged: (value) => _handleSwitchChanged(2, value),
                    title: LanguageConsts.mute.tr),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
