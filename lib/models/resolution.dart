class PatientResolution {
  late String id, height, age;
  late String Drugs;
  late String ChronicDiseases;
  late String PatientRID;

  PatientResolution(
      {required this.id,
      required this.height,
      required this.age,
      required this.Drugs,
      required this.ChronicDiseases,
      required this.PatientRID});

  PatientResolution.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    age = map['age'];
    height = map['height'];
    Drugs = map['Drugs'];
    ChronicDiseases = map['ChronicDiseases'];
    PatientRID = map['PatientRID'];
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "height": height,
      "age": age,
      "Drugs": Drugs,
      "ChronicDiseases": ChronicDiseases,
      "PatientRID": PatientRID,
    };
  }
}
