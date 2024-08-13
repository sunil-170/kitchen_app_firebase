import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class AboutDiscountWidget extends StatelessWidget {
  const AboutDiscountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        child: Column(
      children: [
        PrimaryTextField(
            hintText: LanguageConsts.EnterCH.tr,
            title: LanguageConsts.CouponC.tr),
        PrimaryTextField(
            hintText: LanguageConsts.EnterYD.tr,
            maxLines: 4,
            title: LanguageConsts.description.tr),
      ],
    ));
  }
}
