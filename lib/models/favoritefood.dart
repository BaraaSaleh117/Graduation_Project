class FavoriteFood {
  late String id, resid, foodID;

  FavoriteFood(this.id, this.resid, this.foodID);

  FavoriteFood.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    resid = map['resid'];
    foodID = map['foodID'];
  }
}
