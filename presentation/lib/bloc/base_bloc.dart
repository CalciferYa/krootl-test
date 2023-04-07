import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/base_state.dart';
import 'package:presentation/routing/app_router.dart';

abstract class BaseBloc<E, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState);
}

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(
    S initialState, {
    required this.router,
  }) : super(initialState);

  final AppRouter router;

  Future<Either<Failure, T>> invoke<T>(
    Future<Either<Failure, T>> job,
  ) async {
    return (await job).fold(
      (failure) async {
        return Left(failure);
      },
      Right.new,
    );
  }
}
