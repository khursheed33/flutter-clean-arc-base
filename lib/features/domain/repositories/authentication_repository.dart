import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthenticationRepository {
  /// Gives user by username.
  /// Takes `username` as an argument.

  Future<Either<Failure, UserEntity>> getUser(String username);
}
