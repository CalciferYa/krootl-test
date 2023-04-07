import 'package:data/features/documents/datasources/documets_remote_data_source.dart';
import 'package:get_it/get_it.dart';

void init(GetIt locator) {
  locator
    ..registerFactory<DocumentsRemoteDataSource>(
      () => DocumentsRemoteDataSourceImpl(client: locator()),
    );
}
