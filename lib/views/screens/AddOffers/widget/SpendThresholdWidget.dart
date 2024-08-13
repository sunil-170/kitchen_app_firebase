import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Spendthresholdwidget extends StatelessWidget {
  const Spendthresholdwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        children: [
          PrimaryTextField(
            title: LanguageConsts.SpendV.tr,
            hintText: LanguageConsts.MinimumSV.tr,
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
                      hintText: "Percentage",
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
