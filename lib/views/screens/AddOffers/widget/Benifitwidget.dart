import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class BenifitWidget extends StatelessWidget {
  const BenifitWidget({
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
                      title: LanguageConsts.DiscountV.tr,
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
                      title: LanguageConsts.DiscountU.tr,
                      hintText: LanguageConsts.Percentage.tr,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppServices.addHeight(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryTextField(
                      title: LanguageConsts.ValidF.tr,
                      hintText: "DD/MM/YY",
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
                      title: LanguageConsts.ValidT.tr,
                      hintText: "DD/MM/YY",
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
