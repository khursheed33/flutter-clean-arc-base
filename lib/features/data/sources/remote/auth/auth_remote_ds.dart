import '../../../../domain/entities/user_entity.dart';

abstract class AuthenticationRemoteDatasource {
  /// Gives user by username.
  /// Takes `username` as an argument.
  Future<UserEntity> getUser(String username);
}
