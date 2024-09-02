import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_app/firebase_class/firebase_data.dart';
import 'package:kitchen_app/firebase_class/firebase_response_model.dart';
import 'package:kitchen_app/firebase_class/models.dart';
import 'package:kitchen_app/ordermodel/order_controller.dart';
import 'package:kitchen_app/ordermodel/ordermodel.dart';
import 'package:kitchen_app/view_model/controllers/Authcontrollers/auth_controllers.dart';
import 'package:provider/provider.dart';

class ProductFormView extends StatefulWidget {
  ProductFormView({super.key});

  @override
  State<ProductFormView> createState() => _ProductFormViewState();
}

class _ProductFormViewState extends State<ProductFormView> {
  final _title = TextEditingController();
  final _price = TextEditingController();
  final _discountCode = TextEditingController();
  final _quantity = TextEditingController();
  final _discount = TextEditingController();

  final Stream<QuerySnapshot> _orderstream = FirebaseFirestore.instance
      .collection("Orderdata")
      .where("isAvailable", isEqualTo: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<FirebaseData>(context);
    final order = Provider.of<OrderConntroller>(context);
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: _title,
            decoration: InputDecoration(hintText: "Enter Title"),
          ),
          TextFormField(
            controller: _price,
            decoration: InputDecoration(hintText: "Enter Price"),
          ),
          TextFormField(
            controller: _discountCode,
            decoration: InputDecoration(hintText: "Enter Discount code"),
          ),
          TextFormField(
            controller: _quantity,
            decoration: InputDecoration(hintText: "Enter Quantity"),
          ),
          TextFormField(
            controller: _discount,
            decoration: InputDecoration(hintText: "0.00"),
          ),
          SizedBox(height: 50),
          TextButton(onPressed: () {}, child: Text("Submit Form")),
          TextButton(
              onPressed: () {
                // order.addneworder(generateorder());
                // db.addNewProduct(generateData());
                AuthControllers().deletekey();
              },
              child: Text("Create Product")),
          SizedBox(
            height: 50,
          ),
          ...List.generate(db.getAllProducts.length, (i) {
            final product = db.getAllProducts[i];
            return ListTile(
              title: Text(product.title!),
              subtitle: Text(product.productId!),
            );
          }),
          ...List.generate(order.getOrders.length, (i) {
            final product = order.getOrders[i];
            return ListTile(
              title: Text(product.products!.map((e) => e.title).toString()),
              subtitle:
                  Text(product.products!.map((e) => e.productId).toString()),
            );
          }),
          StreamBuilder(
              stream: _orderstream,
              builder: (Context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Error>>>>>>>>>>>>>>>>>>>>>.");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  final order = snapshot.data!.docs
                      .map((e) => OrderModal.fromorder(FirebaseResponseModel(
                          e.data() as Map<String, dynamic>, e.id)))
                      .toList();
                }
                return Container(
                  child: ListTile(
                      title: Text(
                          order.getOrders.map((e) => e.orderprice).toString())),
                );
              })
        ],
      )),
    );
  }

  ProductModel generateData() {
    return ProductModel(
        title: _title.text, price: double.tryParse(_price.text) ?? 0.0);
  }

  // OrderModal generateorder() {
  //   return OrderModal(
  //       "orderid", _price.text, _discount.text, _discountCode.text, [
  //     ProductModel(
  //         title: _title.text, price: double.tryParse(_price.text) ?? 0.0)
  //   ]);
  // }
}
