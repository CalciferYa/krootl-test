import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/features/documents/entities/unsorted.dart';

abstract class DocumentsRepository {
  Future<Either<Failure, List<Unsorted>>> getUnsorted();
}
