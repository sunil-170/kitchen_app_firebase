import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';

class EixtAppDailog extends StatelessWidget {
  const EixtAppDailog({super.key});

  @override
  Widget build(BuildContext context) {
    ///-----------------Helpers-------------------------------
    var data = alldataManager;
    return AlertDialog.adaptive(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: data.getcolor.white,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LanguageConsts.ConfirmEixt.tr,
            style: data.gettexttheme.fs20_medium
                .copyWith(color: data.getcolor.primaryColor),
          ),
          AppServices.addHeight(10),
          GradientDivider(
            data: data,
            middleGradient: true,
          ),
          AppServices.addHeight(10),
          Text(LanguageConsts.Areysywttea.tr,
              style: data.gettexttheme.fs14_regular),
          AppServices.addHeight(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: data.getcolor.lightred,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      LanguageConsts.cancel.tr,
                      style: data.gettexttheme.fs14_medium
                          .copyWith(color: data.getcolor.primaryColor),
                    )),
              ),
              AppServices.addWidth(15),
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: data.getcolor.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    onPressed: () {
                      // Get.offAll(LoginPage());
                    },
                    child: Text(
                      LanguageConsts.YesExit.tr,
                      style: data.gettexttheme.fs14_medium
                          .copyWith(color: data.getcolor.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
