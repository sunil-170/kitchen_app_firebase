// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kitchen_app/model/customerslist_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Customerslist extends StatelessWidget {
  CustomerslistModel modeldata;
  Customerslist({super.key, required this.modeldata});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routesname.Customerdetailscreen, arguments: modeldata);
        },
        child: PrimaryContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    modeldata.profileimg,
                    width: 60,
                  ),
                  AppServices.addWidth(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modeldata.name,
                            style: data.gettexttheme.fs18_medium),
                        AppServices.addWidth(10),
                        Container(
                            margin: EdgeInsets.only(top: 6),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: modeldata.Supscriptionstatus.color
                                    .withOpacity(0.3)),
                            child: Text(modeldata.Supscriptionstatus.getTitle(),
                                style: data.gettexttheme.fs10_regular.copyWith(
                                    color:
                                        modeldata.Supscriptionstatus.color))),
                        AppServices.addHeight(5),
                        Text(" Member since :${modeldata.membersince}",
                            style: data.gettexttheme.fs12_regular),
                        AppServices.addHeight(5),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Expanded(
                                child: Text(
                                    " Hotel The Icon, Talaki Gate, Rishi Nagar, Near bus stand, Hisar",
                                    style: data.gettexttheme.fs12_regular))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
