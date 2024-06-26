import 'package:flutter_clean_arc_base/index.dart';

class AuthRemoteDatasourceImpl implements AuthenticationRemoteDatasource {
  final Box hiveBox;
  final SharedPreferences sharedPreferences;

  AuthRemoteDatasourceImpl({
    required this.hiveBox,
    required this.sharedPreferences,
  });
  @override
  Future<UserModel> getUser(String username) {
    return Future.delayed(const Duration(seconds: 1), () {
      return UserModel(
        name: "Khursheed",
        surname: "Gaddi",
        username: username,
        email: "khursheed@gmail.com",
      );
    });
  }

  @override
  Future<void> createUser(UserEntity userEntity) async {
    return;
  }

  @override
  Future<String> signIn({
    required String username,
    required String password,
  }) async {
    const String token = "ljfaljsd93i034343";
    await sharedPreferences.setString(AppKeys.authToken, token);
    currentToken = token;
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return token;
      },
    );
  }

  @override
  Future<void> signOut() async {
    await sharedPreferences.remove(AppKeys.authToken);
    currentToken = null;
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(AppKeys.authToken);
  }
}
