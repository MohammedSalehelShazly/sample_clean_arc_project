// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class BaseUrls {
  // static const _base = 'https://api.quotable.io';

  // static const random_quote = '$_base/random';

  static const _base = 'https://jsonplaceholder.typicode.com';

  static String random_quote(int id) => '$_base/posts/$id';
}
