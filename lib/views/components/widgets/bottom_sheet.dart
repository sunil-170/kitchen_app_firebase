import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';

class Image_picker extends StatefulWidget {
  const Image_picker({super.key});

  @override
  State<Image_picker> createState() => _Image_pickerState();
}

class _Image_pickerState extends State<Image_picker> {
  ///Helpers
  var data = alldataManager;

  /// save image
  File? imageFile;

  /// Selected container
  int selectedIndex = -1;

  /// gallery image select function
  getImageFormGallery(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Get.back(result: imageFile);
    }
  }

  /// camera image select function
  getImageFormCamra(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Get.back(result: imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        color: Colors.white,
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back(result: imageFile);
                    },
                    child: Icon(
                      Icons.close,
                      color: data.getcolor.primaryColor,
                    ),
                  )
                ],
              ),
              Text(
                "Choose Options",
                style: data.gettexttheme.fs20_bold
                    .copyWith(color: data.getcolor.primaryColor),
              ),
              AppServices.addHeight(15),
              GradientDivider(
                data: data,
                middleGradient: true,
              ),
              AppServices.addHeight(15),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                        getImageFormGallery(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedIndex == 0
                                ? data.getcolor.primaryColor
                                : data.getcolor.black40,
                          ),
                        ),
                        child: Column(children: [
                          Icon(Icons.image_outlined, size: 21),
                          AppServices.addHeight(10),
                          Text("Choose from library",
                              style: data.gettexttheme.fs14_regular),
                        ]),
                      ),
                    ),
                  ),
                  AppServices.addWidth(10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                        getImageFormCamra(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedIndex == 1
                                ? data.getcolor.primaryColor
                                : data.getcolor.black40,
                          ),
                        ),
                        child: Column(children: [
                          Icon(Icons.linked_camera_outlined, size: 21),
                          AppServices.addHeight(10),
                          Text("Take Photo",
                              style: data.gettexttheme.fs14_regular),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
