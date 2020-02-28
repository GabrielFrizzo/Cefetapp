import 'package:flutter/material.dart';

final daysAbrev = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'];
final classTimes = [
  '07:30',
  '08:20',
  '09:10',
  '10:20',
  '11:10',
  '12:00',
  '13:00',
  '13:50',
  '14:40',
  '15:50',
  '16:40',
  '17:50',
  '18:40',
  '19:30',
  '20:20',
  '21:10',
  '22:00',
];

class Subject {
  final String name;
  final List<String> times;
  final List<int> days;
  final List<List<int>> enumTimes;
  final List<String> rooms;
  final String initials;
  final int absenceLimit;
  final int currentAbsences;
  final double attendance;
  final double average;
  final Color color;

  Subject({
    @required this.name,
    @required this.days,
    @required this.enumTimes,
    @required this.rooms,
    @required this.initials,
    @required this.absenceLimit,
    @required this.currentAbsences,
    @required this.attendance,
    @required this.average,
  })  : times = enumToTimes(days, enumTimes),
        color =
            Colors.primaries[name.hashCode.toInt() % Colors.primaries.length];

  static enumToTimes(days, enumTimes) {
    List<String> stringTimes = [];

    if (days.length != enumTimes.length) throw Exception();

    for (int i = 0; i < days.length; i++) {
      final day = days[i];
      final startTime = enumTimes[i][0];
      final endTime = enumTimes[i][1];

      stringTimes.add(
          '${daysAbrev[day]} ${classTimes[startTime]} - ${classTimes[endTime]}');
    }
    return stringTimes;
  }
}
