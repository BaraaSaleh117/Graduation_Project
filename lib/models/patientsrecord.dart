class PatientsRecord {
  late String Id, resolutionId;
  late String PatientId;
  late String DoctorId;
  late String FullName, HealthStatus, SugerLevelInBlood;

  PatientsRecord(this.Id, this.resolutionId, this.PatientId, this.DoctorId,
      this.FullName, this.HealthStatus, this.SugerLevelInBlood);

  PatientsRecord.fromJson(Map<String, dynamic> map) {
    Id = map['Id'];
    PatientId = map['PatientId'];
    DoctorId = map['DoctorId'];
    resolutionId = map['resolutionId'];
    FullName = map['FullName'];
    HealthStatus = map['HealthStatus'];
    SugerLevelInBlood = map['SugerLevelInBlood'];
  }
}
