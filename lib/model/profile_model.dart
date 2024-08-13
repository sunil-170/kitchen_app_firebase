import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/Dailog/logout_dailog.dart';

import '../views/screens/AddOffers/offers.dart';

///Helpers
var data = alldataManager;

class ProfileItem {
  final String image;
  final String name;
  final Function onPressed;

  ProfileItem({
    required this.image,
    required this.name,
    required this.onPressed,
  });
}

class ProfileItem_Helpers {
  static var profileItems = [
    ProfileItem(
      image: data.geticons.manageaddress,
      name: LanguageConsts.manageA,
      onPressed: () {
        Get.toNamed(Routesname.Manageaddress);
      },
    ),
    ProfileItem(
      image: data.geticons.customers,
      name: LanguageConsts.myC,
      onPressed: () {
        Get.toNamed(Routesname.CustomersList);
      },
    ),
    ProfileItem(
      image: data.geticons.offers,
      name: LanguageConsts.offers,
      onPressed: () {
        Get.to(OfferListScreen());
        // Get.toNamed(Routesname.AddOffersView);
      },
    ),
    ProfileItem(
      image: data.geticons.transactions,
      name: LanguageConsts.transactions,
      onPressed: () {
        Get.toNamed(Routesname.Transactionscreen);
      },
    ),
    ProfileItem(
      image: data.geticons.privacypolicy,
      name: LanguageConsts.privacyP,
      onPressed: () {
        Get.toNamed(Routesname.PrivacyPolicyView);
      },
    ),
    ProfileItem(
      image: data.geticons.contact,
      name: LanguageConsts.Contactssupp,
      onPressed: () {},
    ),
    ProfileItem(
      image: data.geticons.logout,
      name: LanguageConsts.Logout,
      onPressed: () {
        Get.dialog(LogoutDailog(), barrierDismissible: false);
      },
    ),
  ];
}
