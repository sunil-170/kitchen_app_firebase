import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:kitchen_app/firebase_class/firebase_response_handler.dart';
import 'package:kitchen_app/model/user_model.dart';
import 'package:kitchen_app/ordermodel/ordermodel.dart';

/// Order controller handler **********************///

class OrderConntroller extends ChangeNotifier {
  // Instances
// Firebase Instances
  final _db = FirebaseFirestore.instance;
  final _functions = FirebaseResponseHandler();

  // Data
  List<OrderModal> _orders = [];
  List<OrderModal> get getOrders => _orders;

  // Methods
  void setOrderList(List<OrderModal> data) {
    _orders = data;
    notifyListeners();
  }

  addneworder(OrderModal model) async {
    try {
      final res = await _functions.postData(
          _db.collection("Orderdata"), model.toorder());
      print(res!.data);
      _orders.add(OrderModal.fromorder(res));
    } catch (e) {
      print("Order not Created chek function again..");
      print(e);
    } finally {
      notifyListeners();
    }
  }
 
}
