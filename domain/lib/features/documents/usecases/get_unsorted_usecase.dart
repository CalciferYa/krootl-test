import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/features/documents/entities/unsorted.dart';
import 'package:domain/features/documents/repositories/documents_repository.dart';

class GetUnsortedUseCase {
  GetUnsortedUseCase({required this.repository});

  final DocumentsRepository repository;

  Future<Either<Failure, List<Unsorted>>> call() async {
    final unsorted = await repository.getUnsorted();

    return unsorted.fold((error) {
      return Left(error);
    }, (user) async {
      return Right(user);
    });
  }
}
