import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/extensions/string_extensions.dart';

enum TransactionStatus {
  DEBIT(color: Colors.red),
  CREDIT(color: Colors.green);

  final Color color;

  const TransactionStatus({required this.color});

  getTitle() {
    return this.name.toTitleCase();
  }

  getColor() {
    switch (this) {
      case DEBIT:
        alldataManager.getcolor.lightred;
      default:
        alldataManager.getcolor.green;
    }
  }
}

enum MealCategory {
  BREAKFAST,
  LUNCH,
  DINNER;

  @override
  String toString() => this.name;
}

enum CustomersStatus {
  SUBSCRIPTION_ACTIVE(color: Colors.green),
  SUBSCRIPTION_EXPIRED(color: Colors.red);

  final Color color;

  const CustomersStatus({required this.color});

  getTitle() {
    return this.name.split("_").join(" ").toTitleCase();
  }

  getColor() {
    switch (this) {
      case SUBSCRIPTION_ACTIVE:
        alldataManager.getcolor.green;
      default:
        alldataManager.getcolor.lightred;
    }
  }
}
