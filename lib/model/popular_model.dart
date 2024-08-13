import 'package:kitchen_app/main.dart';

///Helpers
var data = alldataManager;

class PopularModel {
  String image, contry, rating, likes, price, ingredients;
  PopularModel(
      {required this.image,
      required this.contry,
      required this.likes,
      required this.ingredients,
      required this.rating,
      required this.price});
}

class Popularmodelhelpers {
  static var modellist = [
    PopularModel(
        image: data.getimg.chapti3,
        contry: "North Indian Meal",
        likes: "90%",
        ingredients: "Soy,  Rice, Bell paper, Penuts",
        rating: "8.9",
        price: "₹70 /-"),
  ];
}
