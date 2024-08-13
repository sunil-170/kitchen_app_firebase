import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/singleton/Alldatamanager.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';

class CancelDailog extends StatelessWidget {
  const CancelDailog({
    super.key,
    required this.font,
  });

  final AllDataManager font;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: font.getcolor.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LanguageConsts.decline.tr,
              style: font.gettexttheme.fs20_medium
                  .copyWith(color: font.getcolor.primaryColor),
            ),
            AppServices.addHeight(10),
            GradientDivider(
              data: font,
              middleGradient: true,
            ),
            AppServices.addHeight(10),
            Text(LanguageConsts.areYSYWTD.tr,
                style: font.gettexttheme.fs14_regular),
            AppServices.addHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: font.getcolor.lightred,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        LanguageConsts.cancel.tr,
                        style: font.gettexttheme.fs14_medium
                            .copyWith(color: font.getcolor.primaryColor),
                      )),
                ),
                AppServices.addWidth(15),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: font.getcolor.primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      onPressed: () {},
                      child: Text(
                        LanguageConsts.yesD.tr,
                        style: font.gettexttheme.fs14_medium
                            .copyWith(color: font.getcolor.white),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
