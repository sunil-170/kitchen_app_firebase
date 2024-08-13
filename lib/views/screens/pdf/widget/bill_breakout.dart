import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/singleton/Alldatamanager.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Bill_breakout extends StatelessWidget {
  const Bill_breakout({
    super.key,
    required this.data,
  });

  final AllDataManager data;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LanguageConsts.BillB.tr,
            style: data.gettexttheme.fs16_regular
                .copyWith(color: data.getcolor.primaryColor)),
        AppServices.addHeight(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LanguageConsts.mealT.tr,
                    style: data.gettexttheme.fs16_regular),
                AppServices.addHeight(10),
                Text("Breakfast", style: data.gettexttheme.fs16_regular),
                AppServices.addHeight(10),
                Text("Dinner", style: data.gettexttheme.fs16_regular)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(LanguageConsts.QTY.tr,
                    style: data.gettexttheme.fs16_regular),
                AppServices.addHeight(10),
                Text("07x80", style: data.gettexttheme.fs16_regular),
                AppServices.addHeight(10),
                Text("07x80", style: data.gettexttheme.fs16_regular)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(LanguageConsts.Total.tr,
                    style: data.gettexttheme.fs16_regular),
                AppServices.addHeight(10),
                Text("₹80", style: data.gettexttheme.fs16_regular),
                AppServices.addHeight(10),
                Text("₹80", style: data.gettexttheme.fs16_regular),
              ],
            ),
          ],
        ),
        AppServices.addHeight(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LanguageConsts.GrandT.tr,
                style: data.gettexttheme.fs16_regular
                    .copyWith(color: data.getcolor.primaryColor)),
            AppServices.addWidth(10),
            Expanded(
              child: GradientDivider(data: data),
            ),
            AppServices.addWidth(10),
            Text("₹300",
                style: data.gettexttheme.fs16_regular
                    .copyWith(color: data.getcolor.primaryColor)),
          ],
        ),
      ],
    ));
  }
}
