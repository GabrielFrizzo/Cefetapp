class Subject {
  final String name;
  final List<String> times;
  final List<String> rooms;
  final String initials;
  final int absenceLimit;
  final int currentAbsences;
  final double attendance;
  final double average;

  Subject(this.name, this.times, this.rooms, this.initials, this.absenceLimit,
      this.currentAbsences, this.attendance, this.average);
}
