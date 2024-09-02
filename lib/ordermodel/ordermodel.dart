import 'package:kitchen_app/firebase_class/firebase_response_model.dart';
import 'package:kitchen_app/firebase_class/models.dart';

class OrderModal {
  String? uid;
  String? orderid;
  String? orderprice;
  String? discount;
  String? service_charge;
  List<ProductModel>? products;

  OrderModal(this.orderid, this.orderprice, this.discount, this.service_charge,
      this.products, this.uid);
  OrderModal.fromorder(FirebaseResponseModel json)
      : orderid = json.data["orderid"] ?? "",
        uid = json.data["uid"] ?? "",
        orderprice = json.data["orderprice"] ?? "",
        discount = json.data["discount"] ?? "",
        service_charge = json.data["service_charge"] ?? "",
        products = (json.data["products"] as List)
            .map((e) => ProductModel.fromOrders(FirebaseResponseModel(e, "")))
            .toList();

  Map<String, dynamic> toorder() => {
        "orderid": orderid,
        "uid": uid,
        "orderprice": orderprice,
        "discount": discount,
        "service_charge": service_charge,
        "products": products == null
            ? ProductModel().toOrderJson()
            : products!.map((e) => e.toProduct()).toList(),
      };
}
