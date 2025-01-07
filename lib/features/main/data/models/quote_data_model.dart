// import '../../domain/entities/quote_data.dart';

// class QuoteDataModel extends QuoteData {
//   const QuoteDataModel(
//       {required super.id,
//       required super.content,
//       required super.author,
//       required super.authorSlug,
//       required super.tags,
//       required super.length,
//       required super.dateAdded,
//       required super.dateModified});

//   factory QuoteDataModel.fromJson(Map<String, dynamic> json) => QuoteDataModel(
//         id: json["_id"],
//         content: json["content"],
//         author: json["author"],
//         tags: List<String>.from(json["tags"]).map((x) => x).toList(),
//         authorSlug: json["authorSlug"],
//         length: json["length"],
//         dateAdded: DateTime.parse(json["dateAdded"]),
//         dateModified: DateTime.parse(json["dateModified"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "content": content,
//         "author": author,
//         "tags": List.from(tags.map((x) => x)),
//         "authorSlug": authorSlug,
//         "length": length,
//         "dateAdded": dateAdded.toString(),
//         "dateModified": dateModified.toString(),
//       };
// }

import '../../domain/entities/quote_data.dart';

class QuoteDataModel extends QuoteData {
  const QuoteDataModel({
    required super.id,
    required super.userID,
    required super.title,
    required super.body,
  });

  factory QuoteDataModel.fromJson(Map<String, dynamic> json) => QuoteDataModel(
        id: json["id"],
        userID: json["userId"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userID,
        "title": title,
        "body": body,
      };
}
