import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/widgets/bottom_sheet.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/profile/Text_field.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    ///-----------Helpers--------------------
    var data = alldataManager;

    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.editP.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrimaryContainer(
                verticalPadding: 10,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Stack(alignment: Alignment.bottomRight, children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: imageFile == null
                            ? Image.asset(
                                data.geticons.profile,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                imageFile!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(blurRadius: 7, color: data.getcolor.black20)
                        ], shape: BoxShape.circle, color: data.getcolor.white),
                        child: PopupMenuButton(
                          position: PopupMenuPosition.under,
                          color: data.getcolor.white,
                          iconColor: data.getcolor.primaryColor,
                          icon: Icon(
                            Icons.edit,
                            color: data.getcolor.primaryColor,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                height: 20,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                onTap: () {
                                  // Get.dialog(
                                  //   DownloadReport(),
                                  // );
                                },
                                child: Text(
                                  "Remove Photo",
                                  style: data.gettexttheme.fs14_regular,
                                )),
                            PopupMenuItem(
                                height: 20,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                onTap: () async {
                                  final result = await showModalBottomSheet(
                                      context: context,
                                      builder: (context) => Image_picker());
                                  setState(() {
                                    imageFile = result;
                                  });
                                  print(result);
                                },
                                child: Text(
                                  "Edit",
                                  style: data.gettexttheme.fs14_regular,
                                )),
                          ],
                        ))
                  ]),
                ]),
              ),
              AppServices.addHeight(20),
              PrimaryContainer(
                  shadow: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryTextFieil_sufixtext(
                        fieldtxt: "Name",
                        hintText: "Enter Your Name",
                      ),
                      AppServices.addHeight(10),
                      PrimaryTextFieil_sufixtext(
                        fieldtxt: "Mobile",
                        hintText: "Enter Your Number",
                        sufixtxt: "UPDATE",
                      ),
                      AppServices.addHeight(10),
                      PrimaryTextFieil_sufixtext(
                        fieldtxt: "Email",
                        sufixtxt: "UPDATE",
                        hintText: "xyz11@gmail.com",
                      ),
                      AppServices.addHeight(5),
                    ],
                  )),
              AppServices.addHeight(15),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                        title: LanguageConsts.updateP.tr,
                        onPressed: () {
                          // Get.toNamed(Routesname.OTPVerificationScreen);
                        }),
                  ),
                ],
              ),
              AppServices.addHeight(15),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                        title: "Setup Business Profile",
                        onPressed: () {
                          Get.toNamed(Routesname.BusinessProfileView);
                        }),
                  ),
                ],
              ),
              PrimaryButton(
                  title: "Offers",
                  onPressed: () {
                    Get.toNamed(Routesname.AddOffersView);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
