import 'package:get/get.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/views/screens/AddOffers/OffersView.dart';
import 'package:kitchen_app/views/screens/Address/ManageAddress.dart';
import 'package:kitchen_app/views/screens/Address/add_address.dart';
import 'package:kitchen_app/views/screens/ApplicationSetting/ChangeNotification.dart';
import 'package:kitchen_app/views/screens/ApplicationSetting/Changetheme.dart';
import 'package:kitchen_app/views/screens/ApplicationSetting/application_setting.dart';
import 'package:kitchen_app/views/screens/ApplicationSetting/language.dart';
import 'package:kitchen_app/views/screens/Menuscreen/AddmealView.dart';
import 'package:kitchen_app/views/screens/Menuscreen/ViewItemdetailsView.dart';
import 'package:kitchen_app/views/screens/PricvacyPolicy/privacypolicy.dart';
import 'package:kitchen_app/views/screens/Transaction/TransactionScreen.dart';
import 'package:kitchen_app/views/screens/auth/on_bording/splash_%20screen.dart';
import 'package:kitchen_app/views/screens/chat/chat.dart';
import 'package:kitchen_app/views/screens/chat/chat_list.dart';
import 'package:kitchen_app/views/screens/customers_page/CustomerDetailScreen.dart';
import 'package:kitchen_app/views/screens/customers_page/customerslist.dart';
import 'package:kitchen_app/views/screens/profile/Edit_profile.dart';
import 'package:kitchen_app/views/screens/profile/KitchenProfile.dart';
import 'package:kitchen_app/views/screens/profile/BusinessProfile/business_profile.dart';

import '../../../views/screens/screens.dart';

class Routes {
  static List<GetPage> zgenerateRoutes() {
    return [
      GetPage(
        name: Routesname.Splashscreen,
        page: () => Splashscreen(),
      ),
      GetPage(
        name: Routesname.Welcomepage,
        page: () => Welcome_Page(),
      ),
      GetPage(
        name: Routesname.Login_page,
        page: () => LoginPage(),
      ),
      GetPage(
        name: Routesname.OTPVerificationScreen,
        page: () => OTPVerificationScreen(),
      ),
      GetPage(
        name: Routesname.DeshBorad,
        page: () => Dashboard(),
      ),
      GetPage(
        name: Routesname.MyMenu,
        page: () => MymenuView(),
      ),
      GetPage(
        name: Routesname.Notification,
        page: () => NotificationView(),
      ),
      GetPage(
        name: Routesname.KitchenProfile,
        page: () => KitchenProfile(),
      ),
      GetPage(
        name: Routesname.Customerdetailscreen,
        page: () => Customerdetailscreen(),
      ),
      GetPage(
        name: Routesname.CustomersList,
        page: () => CustomersList(),
      ),
      GetPage(
        name: Routesname.Transactionscreen,
        page: () => Transactionscreen(),
      ),
      GetPage(
        name: Routesname.Edit_Profile,
        page: () => Edit_Profile(),
      ),
      GetPage(
        name: Routesname.View_itemDetailsView,
        page: () => View_itemDetailsView(),
      ),
      GetPage(
        name: Routesname.AddMealView,
        page: () => AddMenuView(),
      ),
      GetPage(
        name: Routesname.AddOffersView,
        page: () => AddOffersView(),
      ),
      GetPage(
        name: Routesname.Applicationsetting,
        page: () => Applicationsetting(),
      ),
      GetPage(
        name: Routesname.Changelanguage,
        page: () => Changelanguage(),
      ),
      GetPage(
        name: Routesname.Changetheme,
        page: () => Changetheme(),
      ),
      GetPage(
        name: Routesname.Changenotification,
        page: () => Changenotification(),
      ),
      GetPage(
        name: Routesname.Manageaddress,
        page: () => Manageaddress(),
      ),
      GetPage(
        name: Routesname.AddAddress,
        page: () => AddAddress(),
      ),
      GetPage(
        name: Routesname.PrivacyPolicyView,
        page: () => PrivacyPolicyView(),
      ),
      GetPage(
        name: Routesname.Chat_List,
        page: () => Chat_List(),
      ),
      GetPage(
        name: Routesname.view_chat,
        page: () => view_chat(),
      ),
      GetPage(
        name: Routesname.BusinessProfileView,
        page: () => BusinessProfileView(),
      ),
    ];
  }
}
