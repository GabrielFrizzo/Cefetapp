import 'package:cefetapp/features/library/domain/entities/book.dart';

class GetRentedBooks {
  final books = [
    Book('Orgulho e Preconceito', 'Jane Austen', 2, 5),
    Book('Orgulho e Preconceito', 'Jane Austen', 2, -3),
    Book('Orgulho e Preconceito', 'Jane Austen', 3, 3),
  ];

  List<Book> call() => books;
}
