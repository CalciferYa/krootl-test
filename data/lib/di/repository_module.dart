import 'package:data/features/documents/repositories/documents_repository_impl.dart';
import 'package:domain/features/documents/repositories/documents_repository.dart';
import 'package:get_it/get_it.dart';

void init(GetIt locator) {
  locator
    ..registerFactory<DocumentsRepository>(
      () => DocumentsRepositoryImpl(
        remoteDataSource: locator(),
      ),
    );
}
