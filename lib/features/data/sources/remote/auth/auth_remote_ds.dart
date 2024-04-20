import 'package:flutter_clean_arc_base/index.dart';


abstract class AuthenticationRemoteDatasource {
  /// Get current user token from the local storage.
  Future<String?> getToken();

  /// `Login` - Logs in already existing users.
  /// Takes `username` and `password` as required parameters.
  Future<String> signIn({
    required String username,
    required String password,
  });

  /// `Signout` - Removes Token from the local strage.
  Future<void> signOut();

  /// Gives user by username.
  /// Takes `username` as an argument.
  Future<UserModel> getUser(String username);

  /// Creates new user in the database.
  /// Takes `UserEntity` as an argument.
  Future<void> createUser(UserEntity userEntity);
}
