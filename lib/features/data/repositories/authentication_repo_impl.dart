import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/core/errors/failure.dart';
import 'package:flutter_clean_arc_base/core/utils/safe_api_call.dart';
import 'package:flutter_clean_arc_base/features/data/sources/remote/auth_remote_ds.dart';
import 'package:flutter_clean_arc_base/features/domain/entities/user_entity.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';

class AuthRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource datasource;
  final SafeApiCall safeApiCall;

  AuthRepositoryImpl({
    required this.datasource,
    required this.safeApiCall,
  });
  @override
  Future<Either<Failure, UserEntity>> getUser(String username) async {
    return await safeApiCall.callApi<UserEntity>(
      () => datasource.getUser(username),
    );
  }
}
