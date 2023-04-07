import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> invoke<T>(Stream<T> Function() job) async {
    try {
      return Right(await job().single);
    } catch (e) {
      log(e.toString());
      return Left(GeneralFailure(e));
    }
  }
}
