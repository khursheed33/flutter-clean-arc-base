import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/core/async/safe_api_repo.dart';

import '../errors/failure.dart';

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
