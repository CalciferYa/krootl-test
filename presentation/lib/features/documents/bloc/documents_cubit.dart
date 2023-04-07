import 'package:core/assets/assets.dart';
import 'package:domain/features/documents/entities/category.dart';
import 'package:presentation/bloc/base_bloc.dart';
import 'package:presentation/bloc/base_state.dart';
import 'package:presentation/l10n/localization.dart';

part 'documents_state.dart';

class DocumentsCubit extends BaseCubit<DocumentsState> {
  DocumentsCubit({
    required super.router,
  }) : super(DocumentsInitialState());
}
