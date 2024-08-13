import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/bottom_sheet.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/screens/AddOffers/widget/photo_upload.dart';
import 'package:kitchen_app/views/screens/profile/BusinessProfile/widget/OperatingHours.dart';
import 'package:kitchen_app/views/screens/profile/BusinessProfile/widget/addresswidget.dart';
import 'package:kitchen_app/views/screens/profile/BusinessProfile/widget/profilewidget.dart';
import 'package:kitchen_app/views/screens/search/widget/TransprntBtn.dart';

class BusinessProfileView extends StatefulWidget {
  BusinessProfileView({super.key});

  @override
  State<BusinessProfileView> createState() => _BusinessProfileViewState();
}

class _BusinessProfileViewState extends State<BusinessProfileView> {
  final style = alldataManager;

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: "Setup Business Profile"),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// *******     Add Photo  Section    *********** ///
              GestureDetector(
                  onTap: () async {
                    var re = await showModalBottomSheet(
                        context: context, builder: (context) => Image_picker());
                    setState(() {
                      imageFile = re;
                    });
                  },
                  child: imageFile == null
                      ? Photo_upload()
                      : Image.file(
                          fit: BoxFit.cover,
                          imageFile!,
                          height: 100,
                        )),
              AppServices.addHeight(15),
              ProfileWidget(),
              AppServices.addHeight(15),

              /// address Section **************///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Address"),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: style.getcolor.primaryColor,
                      )),
                ],
              ),
              AppServices.addHeight(15),

              /// Address Section**********************///
              Addresswidget(),
              AppServices.addHeight(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Social Media"),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: style.getcolor.primaryColor,
                      )),
                ],
              ),
              AppServices.addHeight(15),
              PrimaryContainer(
                child: Column(children: [
                  PrimaryTextField(
                      title: "Facebook", hintText: "Tiffin Service"),
                ]),
              ),
              TransprntBtn(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline_sharp,
                    color: style.getcolor.primaryColor,
                  ),
                  text: LanguageConsts.addmore.tr,
                  style: style.gettexttheme.fs14_regular
                      .copyWith(color: style.getcolor.primaryColor)),
              AppServices.addHeight(15),

              /// Operating Hours section  **************************///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Operating Hours"),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: style.getcolor.primaryColor,
                      )),
                ],
              ),
              AppServices.addHeight(15),
              OperatingHours(),
              TransprntBtn(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline_sharp,
                    color: style.getcolor.primaryColor,
                  ),
                  text: LanguageConsts.addmore.tr,
                  style: style.gettexttheme.fs14_regular
                      .copyWith(color: style.getcolor.primaryColor)),
            ],
          ),
        )),
      ),
    );
  }
}
