// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddMealModal {
  String? date;
  List<MealsModal>? meals;
  AddMealModal({
    this.date,
    this.meals,
  });
  AddMealModal.fromJson(Map<String, dynamic> json)
      : date = json["date"] ?? "",
        meals = (json["meals"] as List)
            .map((e) => MealsModal.fromJson(e as Map<String, dynamic>))
            .toList();
  Map<String, dynamic> toJson() => {
        "date": date,
        "meals": meals == null
            ? MealsModal().toJson()
            : meals!.map((e) => e.toJson()).toList(),
      };
}

class MealsModal {
  String? mealId;
  String? meal_name;
  String? meal_type;
  int? price;
  String? meal_category;
  bool? available;

  MealsModal(
      {this.mealId,
      this.meal_name,
      this.price,
      this.meal_type,
      this.available});

  MealsModal.fromJson(Map<String, dynamic> json)
      : mealId = json['meal_id'] ?? "",
        meal_name = json['meal_name'] ?? "",
        price = json['price'] ?? "",
        meal_type = json['meal_type'] ?? "",
        available = json['available'] ?? "";

  Map<String, dynamic> toJson() => {
        'meal_id': mealId,
        'meal_name': meal_name,
        'price': price,
        'meal_type': meal_type,
        'available': available,
      };
}
