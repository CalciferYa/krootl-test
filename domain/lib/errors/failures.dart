import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.exception);

  final Object exception;
}

class GeneralFailure extends Failure {
  const GeneralFailure(Object exception) : super(exception);

  @override
  List<Object?> get props => [exception];
}
