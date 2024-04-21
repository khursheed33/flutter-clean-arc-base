import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

/// The `SafeApiCallImpl` class is an implementation of the `SafeApiCall` interface that handles API
/// calls with error handling and checks for internet connectivity.

class SafeApiCallImpl extends SafeApiCall {
  final IsConnectedUsecase isConnectedUsecase;
  SafeApiCallImpl({required this.isConnectedUsecase});

  @override
  Future<Either<Failure, T>> call<T>(Future<T> Function() handler) async {
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
      } catch (err) {
        return Left(Failure(err.toString()));
      }
    } else {
      return Left(Failure("No internet connection!"));
    }
  }

  @override
  Stream<Either<Failure, T>> callStream<T>(
      Stream<T> Function() handler) async* {
    final result = await isConnectedUsecase.call(NoParams());
    final isConnected = FunctionalResponse.success<bool>(result)!;
    if (isConnected) {
      try {
        final response = handler();
        await for (final data in response) {
          yield Right(data);
        }
      } on HttpException catch (err) {
        yield Left(Failure(err.message));
      } on SocketException catch (err) {
        yield Left(Failure(err.message));
      } on FormatException catch (err) {
        yield Left(Failure(err.message));
      } catch (err) {
        yield Left(Failure(err.toString()));
      }
    } else {
      yield Left(Failure("No internet connection!"));
    }
  }
}
