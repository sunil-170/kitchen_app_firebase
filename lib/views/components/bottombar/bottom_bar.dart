import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/Dailog/eixt_app_dailog.dart';
import 'package:kitchen_app/views/screens/Deshborad/DashBoard.dart';
import 'package:kitchen_app/views/screens/Menuscreen/MymenuView.dart';
import 'package:kitchen_app/views/screens/chat/chat_list.dart';
import 'package:kitchen_app/views/screens/orders/OrdersListView.dart';
import 'package:kitchen_app/views/screens/profile/KitchenProfile.dart';

class MyBottomNavi extends StatefulWidget {
  const MyBottomNavi({super.key});

  @override
  State<MyBottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<MyBottomNavi> {
  var data = alldataManager;
  List<Widget> screens = [
    Dashboard(),
    MymenuView(),
    OrdersListView(),
    Chat_List(),
    KitchenProfile(),
  ];
  int currentIndex = 0;

  Future<bool> _onwillpop() async {
    if (currentIndex != 0) {
      setState(() {
        currentIndex = 0;
      });
      return false;
    } else {
      Get.dialog(EixtAppDailog(), barrierDismissible: false);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onwillpop,
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            selectedLabelStyle: data.gettexttheme.fs14_regular,
            currentIndex: currentIndex,
            unselectedItemColor: data.getcolor.black,
            selectedItemColor: data.getcolor.primaryColor,
            backgroundColor: data.getcolor.white,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: currentIndex == 0
                        ? data.getcolor.lightred
                        : Colors.transparent,
                  ),
                  child: Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                label: LanguageConsts.home.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: currentIndex == 1
                        ? data.getcolor.lightred
                        : Colors.transparent,
                  ),
                  child: Image.asset(
                    data.geticons.mymenu,
                    width: 25,
                  ),
                ),
                label: LanguageConsts.myMenu.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: currentIndex == 2
                        ? data.getcolor.lightred
                        : Colors.transparent,
                  ),
                  child: Image.asset(
                    data.geticons.mymenu,
                    width: 25,
                  ),
                ),
                label: LanguageConsts.orders.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: currentIndex == 3
                        ? data.getcolor.lightred
                        : Colors.transparent,
                  ),
                  child: Image.asset(
                    data.geticons.chat,
                    width: 25,
                  ),
                ),
                label: LanguageConsts.chat.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: currentIndex == 4
                        ? data.getcolor.lightred
                        : Colors.transparent,
                  ),
                  child: Icon(Icons.person),
                ),
                label: LanguageConsts.profile.tr,
              ),
            ],
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
