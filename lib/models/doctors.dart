class Doctor {
  late String Id,
      FirstName,
      LastName,
      ClinicAddress,
      Notes,
      PhoneNumber,
      Email,
      Password,
      AppointmentID,
      PatientId;

  Doctor(
      this.Id,
      this.FirstName,
      this.LastName,
      this.ClinicAddress,
      this.Notes,
      this.Password,
      this.PhoneNumber,
      this.Email,
      this.AppointmentID,
      this.PatientId);

  Doctor.fromJson(Map<String, dynamic> map) {
    Id = map['Id'];
    FirstName = map['FirstName'];
    LastName = map['LastName'];
    ClinicAddress = map['ClinicAddress'];
    Notes = map['Notes'];
    PhoneNumber = map['PhoneNumber'];
    Email = map['Email'];
    Password = map['Password'];
    AppointmentID = map['AppointmentID'];
    PatientId = map['PatientId'];
  }
}
