import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_arc_base/core/usecases/base_usecase.dart';
import 'package:flutter_clean_arc_base/core/utils/response_message.dart';
import 'package:flutter_clean_arc_base/features/domain/usecases/connectivity/is_connected_usecase.dart';

import '../errors/failure.dart';
import '../errors/invalid_exception.dart';

abstract class SafeApiCall {
  Future<Either<Failure, T>> callApi<T>(Future<T> Function() handler);
}

class SafeApiCallImpl extends SafeApiCall {
  final IsConnectedUsecase isConnectedUsecase;
  SafeApiCallImpl({required this.isConnectedUsecase});

  @override
  Future<Either<Failure, T>> callApi<T>(Future<T> Function() handler) async {
    final result = await isConnectedUsecase.call(NoParams());
    final isConnected = FunctionalResponse.success<bool>(result)!;
    if (isConnected) {
      try {
        final response = await handler();
        return Right(response);
      } on HttpException catch (err) {
        return Left(Failure(err.message));
      } on SocketException catch (err) {
        return Left(Failure(err.message));
      } on FormatException catch (err) {
        return Left(Failure(err.message));
      } on IOException catch (err) {
        return Left(Failure(err.toString()));
      } on InvalidException catch (err) {
        return Left(Failure(err.toString()));
      } on NetworkImageLoadException catch (err) {
        return Left(Failure(err.toString()));
      } on TimeoutException catch (err) {
        return Left(Failure(err.message.toString()));
      }
    } else {
      return Left(Failure("No internet connection!"));
    }
  }
}
