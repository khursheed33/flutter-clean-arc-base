import 'package:flutter_clean_arc_base/features/data/models/user/user_model.dart';
import 'package:flutter_clean_arc_base/features/data/sources/remote/auth/auth_remote_ds.dart';
import 'package:flutter_clean_arc_base/features/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';

class AuthRemoteDatasourceImpl implements AuthenticationRemoteDatasource {
  final Box hiveBox;

  AuthRemoteDatasourceImpl({required this.hiveBox});
  @override
  Future<UserEntity> getUser(String username) {
    return Future.delayed(const Duration(seconds: 1), () {
      return UserModel(
        name: "Khursheed",
        surname: "Gaddi",
        username: username,
        email: "khursheed@gmail.com",
      );
    });
  }
}
