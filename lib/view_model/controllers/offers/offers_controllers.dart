import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/offers_model.dart';

class OfferController extends GetxController {
  var offers = <Offer>[].obs;

  ///Helpers
  var data = alldataManager;

  @override
  void onInit() {
    super.onInit();
    fetchOffers();
  }

  void fetchOffers() {
    offers.addAll([
      Offer(
          image: data.getimg.offersimg,
          id: 1,
          title: "Festival Offer",
          discount: 14,
          validUntil: "20 July 2024"),
      Offer(
          image: data.getimg.offersimg,
          id: 1,
          title: "Festival Offer",
          discount: 14,
          validUntil: "20 July 2024"),
      Offer(
          image: data.getimg.offersimg,
          id: 1,
          title: "Festival Offer",
          discount: 14,
          validUntil: "20 July 2024"),
      Offer(
          image: data.getimg.offersimg,
          id: 1,
          title: "Festival Offer",
          discount: 14,
          validUntil: "20 July 2024"),
    ]);
  }
}
