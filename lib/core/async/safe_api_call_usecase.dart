import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

/// The `SafeApiCallUsecase` class is a wrapper that handles safe API calls by using the `SafeApiCall`
/// class.
class SafeApiCallUsecase {
  final SafeApiCall safeApiCall;
  SafeApiCallUsecase({required this.safeApiCall});

  Future<Either<Failure, XType>> call<XType>(
      Future<XType> Function() highOrderFun) async {
    return await safeApiCall.call<XType>(
      () async => await highOrderFun(),
    );
  }
}
