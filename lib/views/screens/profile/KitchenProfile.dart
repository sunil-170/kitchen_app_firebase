import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/profile_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';
import 'package:kitchen_app/views/components/widgets/settinglisttile.dart';

class KitchenProfile extends StatefulWidget {
  const KitchenProfile({super.key});

  @override
  State<KitchenProfile> createState() => _KitchenProfileState();
}

class _KitchenProfileState extends State<KitchenProfile> {
  ///-----------------Helpers-------------------------------
  var data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PrimaryAppBar(
          titleText: LanguageConsts.kitchenP.tr,
          autoImplyLeading: false,
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  Get.toNamed(Routesname.Applicationsetting);
                },
                child: Icon(Icons.settings_outlined)),
            AppServices.addWidth(10)
          ]),
      body: Stack(
        children: [
          Image.asset(data.getimg.profile_bg),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppServices.addHeight(30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Image.asset(
                          data.getimg.tiffenwala,
                          width: 170,
                        ),
                        AppServices.addHeight(10),
                        Text(
                          LanguageConsts.tiffinW.tr,
                          style: data.gettexttheme.fs16_regular,
                        ),
                        AppServices.addHeight(2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined),
                            AppServices.addWidth(5),
                            Text(
                              "B-677, Sector 14, Hisar",
                              style: data.gettexttheme.fs14_regular,
                            )
                          ],
                        ),
                        AppServices.addHeight(15),
                        Row(
                          children: [
                            PrimaryButton(
                              isExpanded: true,
                              title: LanguageConsts.editP.tr,
                              borderColor:
                                  data.getcolor.primaryColor.withOpacity(0.3),
                              foregroundColor: data.getcolor.primaryColor,
                              onPressed: () {
                                Get.toNamed(Routesname.Edit_Profile);
                              },
                              backgroundColor: Colors.transparent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppServices.addHeight(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w)
                        .copyWith(bottom: 10.w),
                    child: PrimaryContainer(
                        shadow: true,
                        // margin: EdgeInsets.all(2),
                        // padding: EdgeInsets.all(10),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         blurRadius: 6,
                        //         color: data.getcolor.black20,
                        //       )
                        //     ],
                        //     color: data.getcolor.white),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: ProfileItem_Helpers.profileItems.length,
                          itemBuilder: (context, index) {
                            final item =
                                ProfileItem_Helpers.profileItems[index];
                            return Column(
                              children: [
                                Profiletile(
                                  image: item.image,
                                  name: item.name.tr,
                                  onPressed: item.onPressed,
                                ),
                                if (index <
                                    ProfileItem_Helpers.profileItems.length - 1)
                                  GradientDivider(
                                    data: data,
                                    middleGradient: true,
                                  ),
                              ],
                            );
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
