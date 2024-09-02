import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:kitchen_app/firebase_class/firebase_response_handler.dart';
import 'package:kitchen_app/firebase_class/models.dart';
import 'package:kitchen_app/ordermodel/order_controller.dart';
import 'package:kitchen_app/ordermodel/ordermodel.dart';

class FirebaseData extends ChangeNotifier {
// Firebase Instances
  final _db = FirebaseFirestore.instance;
  final _functions = FirebaseResponseHandler();

  List<ProductModel> _allProducts = [];
  List<ProductModel> get getAllProducts => _allProducts;


  getProducts() async {
    try {
      final response =
          await _functions.getDataFromFirebase(_db.collection("products"));
      if (response is List) {
        _allProducts =
            response.map((e) => ProductModel.fromProducts(e)).toList();
      }
    } catch (e) {}
  }

  addNewProduct(ProductModel model) async {
    try {
      final response = await _functions.postData(
          _db.collection("MyProducts"), model.toProduct());
      if (response != null) {
        _allProducts.add(ProductModel.fromProducts(response));
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
