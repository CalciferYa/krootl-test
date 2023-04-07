part of 'documents_cubit.dart';

abstract class DocumentsState extends BaseState {
  final List<Category> categories = [
    Category(Localization.texts.inbox, Assets.inboxSVG, 12, 1),
    Category(Localization.texts.linkedFiles, Assets.linkedSVG, 12, 1),
    Category(Localization.texts.other, Assets.otherSVG, 12, 1),
    Category(Localization.texts.reports, Assets.reportsSVG, 12, 1),
    Category(Localization.texts.deleted, Assets.deletedSVG, 12, 1)
  ];
}

class DocumentsInitialState extends DocumentsState {
  @override
  List<Object> get props => [];
}
