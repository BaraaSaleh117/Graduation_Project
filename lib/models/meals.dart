class Meals {
  late String Id, Mealname, Mealtype, Mealtime, Calories, Description;

  Meals(
    this.Id,
    this.Mealname,
    this.Mealtype,
    this.Mealtime,
    this.Calories,
    this.Description,
  );

  Meals.fromJson(Map<String, dynamic> map) {
    Id = map['Id'];
    Mealname = map['Mealname'];
    Mealtype = map['Mealtype'];
    Mealtime = map['Mealtime'];

    Calories = map['Calories'];

    Description = map['Description'];
  }
}
