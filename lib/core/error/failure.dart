import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  const Failure([this.message]);

  @override
  List<Object?> get props => [message];
}

class OfflineFailure extends Failure {}

class ServerFailure extends Failure {
  const ServerFailure([super.message]);
}

class EmptyCacheFailure extends Failure {}

class CacheFailure extends Failure {}

class LocalPermissionFailure extends Failure {
  const LocalPermissionFailure(super.message);
}

class WrongInputFailure extends Failure {
  const WrongInputFailure(super.message);
}

class UnHandledFailure extends Failure {
  const UnHandledFailure([super.message]);
}
