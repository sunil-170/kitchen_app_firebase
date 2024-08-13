import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/view_model/enums/enums.dart';

///Helpers
var data = alldataManager;

class CustomerslistModel {
  String name, profileimg, supscription, membersince, loction;
  CustomersStatus Supscriptionstatus;
  CustomerslistModel(
      {required this.supscription,
      required this.name,
      required this.Supscriptionstatus,
      required this.profileimg,
      required this.membersince,
      required this.loction});
}

class Customerslisthelpers {
  static var list = [
    CustomerslistModel(
        Supscriptionstatus: CustomersStatus.SUBSCRIPTION_ACTIVE,
        name: "Aman Chhimpa",
        supscription: "Subscription Active",
        profileimg: data.geticons.profile,
        membersince: " 01-01-2024",
        loction:
            " Hotel The Icon, Talaki Gate, Rishi Nagar, Near bus stand, Hisar"),
    CustomerslistModel(
        Supscriptionstatus: CustomersStatus.SUBSCRIPTION_ACTIVE,
        name: "Sunil singh",
        supscription: "Subscription Active",
        profileimg: data.geticons.profile,
        membersince: " 01-01-2024",
        loction:
            " Hotel The Icon, Talaki Gate, Rishi Nagar, Near bus stand, Hisar"),
    CustomerslistModel(
        Supscriptionstatus: CustomersStatus.SUBSCRIPTION_EXPIRED,
        name: "joginder saini ",
        supscription: "Subscription Active",
        profileimg: data.geticons.profile,
        membersince: " 01-01-2024",
        loction:
            " Hotel The Icon, Talaki Gate, Rishi Nagar, Near bus stand, Hisar"),
    CustomerslistModel(
        Supscriptionstatus: CustomersStatus.SUBSCRIPTION_ACTIVE,
        name: "Mandeep Saini",
        supscription: "Subscription Active",
        profileimg: data.geticons.profile,
        membersince: " 01-01-2024",
        loction:
            " Hotel The Icon, Talaki Gate, Rishi Nagar, Near bus stand, Hisar"),
  ];
}
