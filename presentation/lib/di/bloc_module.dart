import 'package:get_it/get_it.dart';
import 'package:presentation/features/documents/bloc/documents_cubit.dart';

void init(GetIt locator) {
  locator
    ..registerFactory(
      () => DocumentsCubit(router: locator()),
    );
}
