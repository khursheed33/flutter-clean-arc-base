import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../base/base_model.dart';

class AuthViewModel extends BaseModel {
  String? _token;
  String? get token => _token;

  setToken(String? newToken) {
    _token = newToken;
    notifyListeners();
  }

  Future<String?> isTokenExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final gotToken = prefs.getString('authToken');
    setToken(gotToken);
    return gotToken;
  }

  final _userController = StreamController<User?>.broadcast();
  Stream<User?> get userStream => _userController.stream;

  Future<void> login() async {
    // Save the auth token to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', "12891kjsnfkdjslkj");

    // Emit the user object with the token
    _userController.sink.add(User("12891kjsnfkdjslkj"));
  }

  Future<void> logout() async {
    // Remove the auth token from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');

    // Emit null to indicate user is logged out
    _userController.sink.add(null);
  }

  @override
  void disposeModel() {
    _userController.close();
  }
}

class User {
  final String authToken;

  User(this.authToken);
}
