import 'package:flutter_clean_arc_base/index.dart';



class AuthViewModel extends BaseModel {
  final CreateUserUsecase createUserUsecase;
  final GetTokenUsecase getTokenUsecase;
  final GetUserUsecase getUserUsecase;
  final SignOutUsecase signOutUsecase;
  final SignInUsecase signInUsecase;
  String? _token;

  AuthViewModel({
    required this.createUserUsecase,
    required this.getTokenUsecase,
    required this.signOutUsecase,
    required this.getUserUsecase,
    required this.signInUsecase,
  });

  String? get token => _token;

  setToken(String? newToken) {
    _token = newToken;
    notifyListeners();
  }

  Future<String?> isTokenExists() async {
    final response = await getTokenUsecase.call(NoParams());
    if (response.isRight()) {
      final token = FunctionalResponse.success<String?>(response);
      setToken(token);
    }
    return null;
  }

  final _userController = StreamController<String?>.broadcast();
  Stream<String?> get userStream => _userController.stream;

  Future<void> login() async {
    // Save the auth token to shared preferences
    final singInParam = SignInParams(
      username: "khursheed33",
      password: "12345",
    );

    final response = await signInUsecase.call(singInParam);

    if (response.isRight()) {
      final token = FunctionalResponse.success<String?>(response);
      setToken(token);
      _userController.sink.add(token);
    }
  }

  Future<void> logout() async {
    final response = await signOutUsecase.call(NoParams());
    if (response.isRight()) {
      // Emit null to indicate user is logged out
      _userController.sink.add(null);
    }
  }

  @override
  void disposeModel() {
    _userController.close();
  }
}
