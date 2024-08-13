import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/view_model/enums/enums.dart';

///Helpers
var data = alldataManager;

class TransactionModel {
  String img, name, date, ruppes;
  TransactionStatus status;
  TransactionModel(
      {required this.img,
      required this.name,
      required this.status,
      required this.date,
      required this.ruppes});
}

class TransactionHelpers {
  static var list = [
    TransactionModel(
        img: data.geticons.profile,
        name: "Aman Chhimpa ",
        status: TransactionStatus.CREDIT,
        date: "01-06-24",
        ruppes: "1700"),
    TransactionModel(
        img: data.geticons.profile,
        name: "Sunil ",
        status: TransactionStatus.CREDIT,
        date: "01-06-24",
        ruppes: "1600 "),
    TransactionModel(
        img: data.geticons.profile,
        name: "Aman",
        status: TransactionStatus.CREDIT,
        date: "01-06-24",
        ruppes: "1400"),
    TransactionModel(
        img: data.geticons.profile,
        name: "Sunil ",
        status: TransactionStatus.DEBIT,
        date: "01-06-24",
        ruppes: "1200"),
  ];
}
