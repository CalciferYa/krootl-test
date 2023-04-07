part of 'documents_cubit.dart';

abstract class DocumentsState extends BaseState {
  final List<Folder> mainFolders = [
    Folder(
        name: Localization.texts.inbox,
        image: Assets.inboxSVG,
        filesCount: 12,
        hoursCount: 1),
    Folder(
        name: Localization.texts.linkedFiles,
        image: Assets.linkedSVG,
        filesCount: 12,
        hoursCount: 1),
    Folder(
        name: Localization.texts.other,
        image: Assets.otherSVG,
        filesCount: 12,
        hoursCount: 1),
    Folder(
        name: Localization.texts.reports,
        image: Assets.reportsSVG,
        filesCount: 12,
        hoursCount: 1),
    Folder(
        name: Localization.texts.deleted,
        image: Assets.deletedSVG,
        filesCount: 12,
        hoursCount: 1)
  ];

  final List<Folder> pinnedFolders = [
    Folder(
        name: "Custom Folder 1",
        filesCount: 12,
        hoursCount: 1,
        isCustomFolder: true),
    Folder(
        name: "Custom Folder 2",
        filesCount: 12,
        hoursCount: 1,
        isCustomFolder: true),
    Folder(
        name: "Folder Name",
        filesCount: 12,
        hoursCount: 1,
        isCustomFolder: true),
  ];
}

class DocumentsInitialState extends DocumentsState {
  @override
  List<Object> get props => [];
}

class UnsortedDocumentsState extends DocumentsState {
  UnsortedDocumentsState(this.unsorted);

  final List<Unsorted> unsorted;

  @override
  List<Object> get props => [];
}
