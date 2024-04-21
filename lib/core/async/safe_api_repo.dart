import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

/// The `SafeApiCall` class is an abstract class that provides a method for making safe API calls and
/// returning either a `Failure` or a successful result.

abstract class SafeApiCall {
  Future<Either<Failure, T>> call<T>(Future<T> Function() handler);
  Stream<Either<Failure, T>> callStream<T>(Stream<T> Function() handler);
}
