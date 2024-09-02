import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kitchen_app/model/TodayMealModal.dart';

class Todaymealcontroller extends GetxController {
  // Rx<List<AddMealModal>> _addmealList =
  //     Rx<List<AddMealModal>>([AddMealModal()]);
  // List<AddMealModal> get meallist => _addmealList.value;

  // setmeal(AddMealModal meal) {
  //   _addmealList.update((v) => v!.add(meal));
  // }

  List<AddMealModal> _addmealdata = [];
  List<AddMealModal> get getmealdata => _addmealdata;
  addmeal(List<AddMealModal> model) {
    _addmealdata = model;
    update();
  }


  final firestore = FirebaseFirestore.instance;

  Future<void> addmealfun(Map<String, dynamic> dataaa) async {
    try {
      final data = await firestore.collection("meal").add(dataaa);
      final mealmodel = AddMealModal.fromJson(dataaa);
      _addmealdata.add(mealmodel);
      print("===== data upload===");
    } catch (e) {
      print("========{$e}========");
    }
  }
}
