class MealFoodRecord {
  late String id, mealID, foodID;

  MealFoodRecord(this.id, this.mealID, this.foodID);

  MealFoodRecord.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    mealID = map['mealID'];
    foodID = map['foodID'];
  }
}
