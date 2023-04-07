import 'package:core/assets/assets.dart';
import 'package:domain/features/documents/entities/folder.dart';
import 'package:domain/features/documents/entities/unsorted.dart';
import 'package:domain/features/documents/usecases/get_unsorted_usecase.dart';
import 'package:presentation/bloc/base_bloc.dart';
import 'package:presentation/bloc/base_state.dart';
import 'package:presentation/l10n/localization.dart';

part 'documents_state.dart';

class DocumentsCubit extends BaseCubit<DocumentsState> {
  DocumentsCubit({
    required super.router,
    required this.getUnsortedUseCase,
  }) : super(DocumentsInitialState()) {
    getUnsorted();
  }

  final GetUnsortedUseCase getUnsortedUseCase;

  Future<void> getUnsorted() async {
    final result = await invoke(
      getUnsortedUseCase(),
    );
    result.fold(
      (failure) {},
      (success) {
        emit(UnsortedDocumentsState(success));
      },
    );
  }
}
