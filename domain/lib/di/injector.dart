import 'package:domain/features/documents/usecases/get_unsorted_usecase.dart';
import 'package:get_it/get_it.dart';

void init(GetIt locator) {
  ///Use cases
  locator
    ..registerFactory<GetUnsortedUseCase>(
      () => GetUnsortedUseCase(repository: locator()),
    );
}
