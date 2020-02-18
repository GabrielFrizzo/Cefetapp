import 'package:flutter/material.dart';

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

  Subject(
      this.name,
      this.times,
      this.days,
      this.enumTimes,
      this.rooms,
      this.initials,
      this.absenceLimit,
      this.currentAbsences,
      this.attendance,
      this.average);

  Color get color {
    return Colors.primaries[this.hashCode.toInt() % Colors.primaries.length];
  }
}
