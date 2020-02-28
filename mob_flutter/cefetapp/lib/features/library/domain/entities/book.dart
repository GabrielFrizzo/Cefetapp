class Book {
  final String name;
  final String author;
  final int renewals;
  final int daysLeft;

  const Book(this.name, this.author, this.renewals, this.daysLeft);

  bool canRenew() => renewals < 3;

  bool isLate() => daysLeft < 0;
}
