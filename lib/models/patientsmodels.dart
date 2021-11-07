class PatientsModel {
  late String firstName,
      lastName,
      email,
      password,
      phoneNumber,
      rPhoneNumber,
      Gender;

  PatientsModel(this.firstName, this.lastName, this.email, this.password,
      this.phoneNumber, this.rPhoneNumber, this.Gender);

  PatientsModel.fromJson(Map<String, dynamic> map) {
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
    password = map['password'];
    phoneNumber = map['phoneNumber'];
    rPhoneNumber = map['rPhoneNumber'];
    Gender = map['Gender'];
  }
}
