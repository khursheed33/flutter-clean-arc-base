import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/core/errors/failure.dart';
import 'package:flutter_clean_arc_base/features/data/models/user/user_model.dart';
import 'package:flutter_clean_arc_base/features/data/sources/remote/auth/auth_remote_ds.dart';
import 'package:flutter_clean_arc_base/features/domain/entities/user_entity.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';

import '../../../core/async/safe_api_repo.dart';

class AuthRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource datasource;
  final SafeApiCall safeApiCall;

  AuthRepositoryImpl({
    required this.datasource,
    required this.safeApiCall,
  });
  @override
  Future<Either<Failure, UserModel>> getUser(String username) async {
    return await safeApiCall.call<UserModel>(
      () => datasource.getUser(username),
    );
  }

  @override
  Future<Either<Failure, void>> createUser(UserEntity userEntity) async {
    return await safeApiCall.call<void>(
      () => datasource.createUser(userEntity),
    );
  }

  @override
  Future<Either<Failure, String>> signIn({
    required String username,
    required String password,
  }) async {
    return await safeApiCall.call<String>(
      () => datasource.signIn(
        username: username,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    return await safeApiCall.call<void>(
      () => datasource.signOut(),
    );
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    return await safeApiCall.call<String?>(
      () => datasource.getToken(),
    );
  }
}
