import '../entities/subject.dart';

class GetCurrentClasses {
  final classes = [
    Subject(
      name: 'Eletrônica Geral 2',
      days: [0, 2],
      enumTimes: [
        [3, 5],
        [9, 11]
      ],
      rooms: ['E-204', 'B-101'],
      initials: 'CSD-20 - S73',
      absenceLimit: 15,
      currentAbsences: 7,
      attendance: 87.5,
      average: 7.2,
    ),
    Subject(
      name: 'Física 3',
      days: [1, 4],
      enumTimes: [
        [3, 5],
        [9, 11]
      ],
      rooms: ['E-104', 'B-101'],
      initials: 'CSD-20 - S71',
      absenceLimit: 18,
      currentAbsences: 2,
      attendance: 86.5,
      average: 2.2,
    ),
    Subject(
      name: 'Matemática Discreta',
      days: [1, 2],
      enumTimes: [
        [9, 13],
        [0, 3]
      ],
      rooms: ['C-104', 'B-301'],
      initials: 'LSD-42 - S41',
      absenceLimit: 15,
      currentAbsences: 5,
      attendance: 91.3,
      average: 8.9,
    ),
  ];

  List<Subject> call() {
    return classes;
  }
}
