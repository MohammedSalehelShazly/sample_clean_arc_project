// import 'package:equatable/equatable.dart';

// class QuoteData extends Equatable {
//   final String id, content, author, authorSlug;
//   final List<String> tags;
//   final int length;
//   final DateTime dateAdded, dateModified;

//   const QuoteData(
//       {required this.id,
//       required this.content,
//       required this.author,
//       required this.authorSlug,
//       required this.tags,
//       required this.length,
//       required this.dateAdded,
//       required this.dateModified});

//   @override
//   List<Object?> get props =>
//       [id, content, author, authorSlug, tags, length, dateAdded, dateModified];
// }

import 'package:equatable/equatable.dart';

class QuoteData extends Equatable {
  final int userID, id;
  final String title, body;

  const QuoteData(
      {required this.id,
      required this.userID,
      required this.title,
      required this.body});

  @override
  List<Object?> get props => [id, userID, title, body];
}
