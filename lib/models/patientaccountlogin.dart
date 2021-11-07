class PatientLogin {
  late String Id, patientId, UserName, Email, Password;

  PatientLogin(
      this.Id, this.patientId, this.UserName, this.Email, this.Password);

  PatientLogin.fromJson(Map<String, dynamic> map) {
    Id = map['Id'];
    patientId = map['patientId'];
    UserName = map['UserName'];
    Email = map['Email'];
    Password = map['Password'];
  }
}
