import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get inbox => 'Inbox';

  @override
  String get linkedFiles => 'Linked Files';

  @override
  String get other => 'Other';

  @override
  String get reports => 'Reports';

  @override
  String get deleted => 'Deleted';

  @override
  String get search => 'Search';

  @override
  String get hide => 'Hide';

  @override
  String categoryStatus(Object files, Object hours) {
    return '$files files・$hours hour ago';
  }

  @override
  String pinnedFolders(Object folders) {
    return 'PINNED FOLDERS・$folders';
  }

  @override
  String unsorted(Object date) {
    return 'UNSORTED・$date';
  }
}
