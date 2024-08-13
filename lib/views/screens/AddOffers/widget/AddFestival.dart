import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class FestivalWidget extends StatelessWidget {
  const FestivalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryTextField(
                      title: LanguageConsts.festivalT.tr,
                      hintText: "Diwali",
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
                      title: LanguageConsts.applyO.tr,
                      hintText: "Above\u{20B9}150",
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              PrimaryTextField(
                title: LanguageConsts.discount.tr,
                hintText: "30%",
                isExpanded: true,
                keyboardType: TextInputType.number,
              ),
              Expanded(child: SizedBox())
            ],
          ),
        ],
      ),
    );
  }
}
