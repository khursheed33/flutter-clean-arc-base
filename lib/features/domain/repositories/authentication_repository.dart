import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

abstract class AuthenticationRepository {
  /// Get current user token from the local storage.
  Future<Either<Failure, String?>> getToken();

  /// `Login` - Logs in already existing users.
  /// Takes `username` and `password` as required parameters.
  Future<Either<Failure, String>> signIn({
    required String username,
    required String password,
  });

  /// `Signout` - Removes Token from the local strage.
  Future<Either<Failure, void>> signOut();

  /// Gives user by username.
  /// Takes `username` as an argument.
  Future<Either<Failure, UserEntity>> getUser(String username);

  /// Create User expects `UserEntity` as an argument, It creates a new user in the database.
  Future<Either<Failure, void>> createUser(UserEntity userEntity);
}
