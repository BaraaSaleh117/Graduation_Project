class Food {
  late String id,
      Foodname,
      Calories,
      Fats,
      SaturatedFat,
      carbohydrates,
      fiber,
      Proteins,
      cholesterol,
      Quantity;

  Food(
      this.id,
      this.Foodname,
      this.Calories,
      this.Fats,
      this.SaturatedFat,
      this.carbohydrates,
      this.fiber,
      this.Proteins,
      this.cholesterol,
      this.Quantity);

  Food.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    Foodname = map['Foodname'];
    Calories = map['Calories'];
    Fats = map['Fats'];
    SaturatedFat = map['SaturatedFat'];
    carbohydrates = map['carbohydrates'];
    fiber = map['fiber'];
    Proteins = map['Proteins'];
    cholesterol = map['cholesterol'];
    Quantity = map['Quantity'];
  }
}
