class OfflineException implements Exception {}

class ServerException implements Exception {
  final String? message;
  const ServerException([this.message]);
}

class EmptyCacheException implements Exception {}

class CacheException implements Exception {}

class UnHandledException implements Exception {}
