import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class SafeApiCall {
  Future<Either<Failure, T>> call<T>(Future<T> Function() handler);
}
