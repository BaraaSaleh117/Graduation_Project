class DoctorLogin {
  late String id, DoctorId, UserName, Email, Password;

  DoctorLogin(this.id, this.DoctorId, this.UserName, this.Email, this.Password);

  DoctorLogin.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    DoctorId = map['patientId'];
    UserName = map['UserName'];
    Email = map['Email'];
    Password = map['Password'];
  }
}
