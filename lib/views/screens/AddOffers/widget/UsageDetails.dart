import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class UsageDetailsWidget extends StatelessWidget {
  const UsageDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryTextField(
                  title: LanguageConsts.TotalU.tr,
                  hintText: "0.00",
                ),
              ],
            ),
          ),
          AppServices.addWidth(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryTextField(
                  title: LanguageConsts.UsesPC.tr,
                  hintText: "0.00",
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
