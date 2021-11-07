class UnFavoriteFood {
  late String id, resId, FoodId;

  UnFavoriteFood(this.id, this.resId, this.FoodId);

  UnFavoriteFood.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    resId = map['resId'];
    FoodId = map['FoodId'];
  }
}
