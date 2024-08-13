import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class PrivacyPolicyView extends StatelessWidget {
  PrivacyPolicyView({super.key});
  final style = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.privacyP.tr),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: PrimaryContainer(
            isExpanded: true,
            isheight: true,
            shadow: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Privacy Policy of Company Name",
                    style: style.gettexttheme.fs16_bold,
                  ),
                  AppServices.addHeight(10),
                  Text(
                    "Company Name operates the Website Name website, which provides the SERVICE. This page is used to inform website visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service, the Website Name website. If you choose to use our Service, then you agree to the collection and use of information in relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy. The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Website URL, unless otherwise defined in this Privacy Policy.",
                    style: style.gettexttheme.fs12_regular,
                  ),
                  AppServices.addHeight(10),
                  Text(
                    "Information Collection and Use",
                    style: style.gettexttheme.fs16_bold,
                  ),
                  AppServices.addHeight(10),
                  Text(
                      "For a better experience while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.",
                      style: style.gettexttheme.fs12_regular),
                  AppServices.addHeight(10),
                  Text("Log Data", style: style.gettexttheme.fs16_bold),
                  AppServices.addHeight(10),
                  Text(
                      "We want to inform you that whenever you visit our Service, we collect information that your browser sends to us that is called Log Data. This Log Data may include information such as your computer's Internet Protocol (“IP”) address, browser version, pages of our Service that you visit, the time and date of your visit, the time spent on those pages, and other statistics.",
                      style: style.gettexttheme.fs12_regular),
                  AppServices.addHeight(10),
                  Text("Cookies", style: style.gettexttheme.fs16_bold),
                  AppServices.addHeight(10),
                  Text(
                      "Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computer's hard drive. Our website uses these “cookies” to collection information and to improve our Service. You have the option to either accept or refuse these cookies, and know when a cookie is being sent to your computer. If you choose to refuse our cookies, you may not be able to use some portions of our Service.",
                      style: style.gettexttheme.fs12_regular),
                ],
              ),
            )),
      )),
    );
  }
}
