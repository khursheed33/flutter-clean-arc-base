import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_arc_base/core/errors/invalid_exception.dart';

import '../errors/failure.dart';
import '../network/connection.dart';

// ignore: constant_identifier_names
const String NO_INTERNET_CONNECTION = "No internet connection!";

abstract class SafeApiCall {
  Future<Either<Failure, T>> callApi<T>(Future<T> Function() handler);
}

class SafeApiCallImpl extends SafeApiCall {
  final NetworkInfo networkInfo;
  SafeApiCallImpl({required this.networkInfo});

  @override
  Future<Either<Failure, T>> callApi<T>(Future<T> Function() handler) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await handler();
        return Right(response);
      } on HttpException catch (err) {
        return Left(Failure(err.message));
      } on SocketException catch (err) {
        return Left(Failure(err.message));
      } on FormatException catch (err) {
        return Left(Failure(err.message));
      } on FirebaseAuthException catch (err) {
        return Left(Failure(err.message.toString()));
      } on FirebaseException catch (err) {
        return Left(Failure(err.message.toString()));
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
      return Left(Failure(NO_INTERNET_CONNECTION));
    }
  }
}




/// Safe API call that maps error/failure
// class FunctionalAPICall extends BaseModel {
//   Future<Either<Failure, T>> call<T>(Future<T> Function() hander,
//       {Function(Either<Failure, T> value)? extraAction}) async {
//     setViewState(ViewState.loading);
//     return await Task(() => hander())
//         .attempt()
//         .mapLeftToX<Failure>()
//         .run()
//         .then((value) async {
//       setViewState(ViewState.done);
//       if (extraAction != null) {
//         extraAction(value as Either<Failure, T>);
//       }
//       return value as Either<Failure, T>;
//     });
//   }
// }
