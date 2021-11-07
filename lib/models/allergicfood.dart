class AllergicFood {
  late String Id, resId, foodID;

  AllergicFood(this.Id, this.resId, this.foodID);

  AllergicFood.fromJson(Map<String, dynamic> map) {
    Id = map['Id'];
    resId = map['resId'];
    foodID = map['foodID'];
  }
}
