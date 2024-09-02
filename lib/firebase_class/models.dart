import 'package:flutter/foundation.dart';
import 'package:kitchen_app/firebase_class/firebase_response_model.dart';

class ProductModel {
  String? productId;
  String? title;
  double? price;
  List<String>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isAvailable;
  int? quantity;
  double? discount;
  String? discountCode;
  DateTime? addedAt;

  ProductModel(
      {this.productId,
      this.title,
      this.price,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.isAvailable,
      this.quantity,
      this.discount,
      this.discountCode,
      this.addedAt});

  ProductModel.fromProducts(FirebaseResponseModel map)
      : productId = map.docId,
        title = map.data['title'] ?? "",
        price = map.data['price']?.toDouble();

  Map<String, dynamic> toOrderJson() {
    return {
      "title": title ?? "",
      "price": price ?? 0.0,
      "isAvailable": isAvailable ?? true,
      "quantity": quantity ?? 1,
      "discount": discount ?? 0.0,
      "discountcode": discountCode ?? "",
    };
  }

  Map<String, dynamic> toCartJson() {
    return {
      "title": title ?? "",
      "price": price ?? 0.0,
      "quantity": quantity ?? 1,
      "discount": discount ?? 0.0,
      "discountcode": discountCode ?? "",
      "addedAt": addedAt ?? DateTime.now().millisecondsSinceEpoch
    };
  }

  Map<String, dynamic> toProduct() {
    return {
      "productId": productId,
      "title": title ?? "",
      "price": price ?? 0.0,
      "createdAt": createdAt ?? DateTime.now().millisecondsSinceEpoch,
      "updatedAt": updatedAt ?? DateTime.now().millisecondsSinceEpoch,
      "images": images ?? [],
      'isAvailable': isAvailable ?? true
    };
  }

  ProductModel.fromOrders(FirebaseResponseModel json)
      : productId = json.data['productId'],
        title = json.data['title'] ?? "",
        price = json.data['price']?.toDouble(),
        isAvailable = json.data['isAvailable'] ?? true,
        quantity = json.data['quantity'] ?? 0,
        discount = json.data['discount'] ?? 0.0,
        discountCode = json.data['discountcode'] ?? "";
}

// class OrderModel {
//   List<ProductModel>? products;

//   OrderModel({this.products});

//   OrderModel.fromOrders(FirebaseResponseModel json)
//       : products = (json.data['products'] as List)
//             .map((e) =>
//                 ProductModel.fromOrders(FirebaseResponseModel.fromResponse(e)))
//             .toList();
// }

class ProductController extends ChangeNotifier {
  // Product Handler

  List<ProductModel> _products = [];
  // Cart Handler
  List<ProductModel> _cartItems = [];
  // Orders Handler
  List<ProductModel> _Orders = [];
}
