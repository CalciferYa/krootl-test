import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:data/features/documents/datasources/documets_remote_data_source.dart';
import 'package:data/features/documents/models/documents_mappers.dart';
import 'package:data/repository/base_repository.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/features/documents/entities/unsorted.dart';
import 'package:domain/features/documents/repositories/documents_repository.dart';

class DocumentsRepositoryImpl extends BaseRepository
    implements DocumentsRepository {
  DocumentsRepositoryImpl({
    required this.remoteDataSource,
  });

  final DocumentsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Unsorted>>> getUnsorted() {
    return invoke<List<Unsorted>>(() => remoteDataSource
        .getUnsorted()
        .asStream()
        .asyncMap((event) => event.map((e) => e.toEntity()).toList()));
  }
}
