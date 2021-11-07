class BalanceReading {
  late String Id,
      resId,
      BMI,
      Weight,
      Protein,
      TotalBodyWater,
      visceralFat,
      Calories,
      muscleWeight;

  BalanceReading(this.Id, this.resId, this.BMI, this.Weight, this.Protein,
      this.TotalBodyWater, this.visceralFat, this.Calories, this.muscleWeight);

  BalanceReading.fromJson(Map<String, dynamic> map) {
    Id = map['Id'];
    resId = map['resId'];
    BMI = map['BMI'];
    Weight = map['Weight'];
    Protein = map['Protein'];
    TotalBodyWater = map['TotalBodyWater'];
    visceralFat = map['visceralFat'];
    Calories = map['Calories'];
    muscleWeight = map['muscleWeight'];
  }
}
