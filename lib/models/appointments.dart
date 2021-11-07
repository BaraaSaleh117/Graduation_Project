class Appointments {
  late String id, DoctorId, PatientId, Reservation;

  Appointments(this.id, this.DoctorId, this.PatientId, this.Reservation);

  Appointments.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    DoctorId = map['DoctorId'];
    PatientId = map['PatientId'];
    Reservation = map['Reservation'];
  }
}
