class PatientResolution {
  late String id, ExistingDiseases;
  late String Drugs;
  late String ChronicDiseases;
  late String PatientRID;

  PatientResolution(this.id, this.ExistingDiseases, this.Drugs,
      this.ChronicDiseases, this.PatientRID);

  PatientResolution.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    ExistingDiseases = map['ExistingDiseases'];
    Drugs = map['Drugs'];
    ChronicDiseases = map['ChronicDiseases'];
    PatientRID = map['PatientRID'];
  }
}
