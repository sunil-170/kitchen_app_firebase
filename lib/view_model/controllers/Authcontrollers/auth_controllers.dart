import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/user_model.dart';
import 'package:kitchen_app/view_model/controllers/AppState/appState_controllers.dart';
import 'package:kitchen_app/views/components/bottombar/bottom_bar.dart';
import 'package:kitchen_app/views/screens/auth/auth.dart';

class AuthControllers extends GetxController {
  // FIREBASE INSTANCE HANDLER
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // USER DATA HANDLER
  dynamic _user_data;
  user_model get getuser_data => _user_data;
  set_user_data(user_model model) {
    _user_data = model;
    update();
  }

  // bool isLoggedIn() {
  //   final uid = prefs.getString("userID");
  //   return (uid ?? " ").isNotEmpty;
  // }

//  ------------------- CREATE ACCOUNT --------------------
  Future<void> createAccount(Map<String, dynamic> body, String password) async {
    final provider = Get.find<App_state_controllers>();
    provider.set_loader(true);
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: body['email'], password: password)
          .then((value) async {
        if (value.user != null) {
          print("IF case Run *****************  ");
          ;
          prefs.setString("userID", value.user!.uid.toString());

          prefs.setString("users", body.toString());
          prefs.setString("email", body['email']);
          await user_detials(value.user!.uid, body);
        } else {
          print("Else case Run *****************  ");
          ;
        }
      });
    } catch (e) {
      print(e);
    } finally {
      provider.set_loader(false);
    }
  }

  /// ---------------------------user Detials----------------------
  Future<void> user_detials(String uid, Map<String, dynamic> data) async {
    try {
      final model = user_model.fromuser_basic_model(data, uid);

      await firestore
          .collection("users")
          .doc(uid)
          .set(model.tojson())
          .then((value) async {
        set_user_data(model);
        Get.to(MyBottomNavi());
      });
    } catch (e) {
      print(e);
    }
  }

////       -------------------LOGIN FUNTION --------------------------------
  Future<void> loginuser(String email, password) async {
    final provider = Get.find<App_state_controllers>();
    provider.set_loader(true);
    try {
      final data = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (data.user != null) {
        final snapshot =
            await firestore.collection("users").doc(data.user!.uid).get();
        prefs.setString("userID", data.user!.uid);
        _user_data =
            user_model.fromuser_basic_model(snapshot.data()!, data.user!.uid);
        Get.to(MyBottomNavi());
      }
    } catch (e) {
    } finally {
      provider.set_loader(false);
    }
  }

  ///--------------------------RELOGIN FUNTION -------------------------------

  Future<bool> Reloginaccount() async {
    final provider = Get.find<App_state_controllers>();
    provider.set_loader(true);
    final uid = prefs.getString("userID");
    bool islogin = false;

    /// aager user(uid) hai to ya khali nhi h to data get kre
    try {
      if (uid != null && uid.isNotEmpty) {
        final localuser = await firestore.collection("users").doc(uid).get();

        if (localuser.exists) {
          print("=================================== if case error ");
          _user_data =
              user_model.fromuser_basic_model(localuser.data()!, localuser.id);
          islogin = true;
          Get.to(MyBottomNavi());
        } else {
          print("===================================login error ");
          Get.to(LoginPage());
          // userr(uid) nhi h to login page per bhaj de
          prefs.remove("userID");
        }
      } else {
        Get.to(LoginPage());
        // aager user(uid) nhi h ya khali h to bi user ko login bhaj pe bhajde
      }
    } catch (e) {
    } finally {
      provider.set_loader(false);
    }
    return islogin;
  }

  deletekey() async {
    try {
      // final users = _user_data;
      // List coll = await firestore.collection("users").doc(user.uid)
      await firestore
          .collection("users")
          .doc("r3nYGag5B3NjVcoe3HLmu8MMKfe2")
          .update({
        "fullname": FieldValue.arrayUnion(["ram", "Sunil"])
      });
      // _user_data = user;
      // update();
    } catch (e) {}
  }
}
