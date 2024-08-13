import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMealController {
  RxString _isMealaddons = "".obs;
  String get isMealaddons => _isMealaddons.value;
  setisMealaddons(String value) {
    _isMealaddons.value = value;
  }

  Rx<List<MealAddonsFormModel>> _addmealList =
      Rx<List<MealAddonsFormModel>>([MealAddonsFormModel()]);
  List<MealAddonsFormModel> get meallist => _addmealList.value;

  setMeallist(MealAddonsFormModel value) {
    _addmealList.update((v) => v!.add(value));
  }

  removemeallist(MealAddonsFormModel value) {
    final bool length = _addmealList.value.length != 1;
    if (length) {
      _addmealList.update((v) => v!.removeWhere((e) => e.id == value.id));
    }
  }
}

class MealAddonsFormModel {
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String id = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  bool operator ==(Object other) {
    return this.id == (other as MealAddonsFormModel).id;
  }

  @override
  int get hashCode => this.id.hashCode;
}

class SpendAddModel {
  TextEditingController spendvalue = TextEditingController();
  TextEditingController discountvalue = TextEditingController();
  TextEditingController discountunit = TextEditingController();
  TextEditingController validfrom = TextEditingController();
  TextEditingController validtill = TextEditingController();

  String id = DateTime.now().millisecondsSinceEpoch.toString();
  @override
  bool operator ==(Object other) {
    return this.id == (other as SpendAddModel).id;
  }

  @override
  int get hashCode => super.hashCode;
}

class AddSpendController {
  Rx<String> _isSpendAdd = "".obs;
  String get isspendadd => _isSpendAdd.value;

  setisspendadd(String value) {
    _isSpendAdd.value = value;
  }

  Rx<List<SpendAddModel>> _spendlist =
      Rx<List<SpendAddModel>>([SpendAddModel()]);
  List<SpendAddModel> get spendlist => _spendlist.value;

  setspentlist(SpendAddModel model) {
    _spendlist.update((v) => v!.add(model));
  }
}
