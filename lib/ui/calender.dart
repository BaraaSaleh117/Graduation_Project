import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 6,
        // initialDisplayDate: DateTime(2021, 12, 09, 08, 30),
        // initialSelectedDate: DateTime(2021, 12, 09, 08, 30),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meeting = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime starTime =
      DateTime(today.year, today.month, today.day, 3, 0, 0);
  final DateTime endtime = starTime.add(const Duration(hours: 3));

  meeting.add(Appointment(
      startTime: starTime,
      endTime: endtime,
      subject: "Confernce",
      color: Colors.red.withOpacity(0.4),
      recurrenceRule: 'FREQ=DAILY;COUNT=10'));

  return meeting;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
