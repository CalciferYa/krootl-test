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
  String categoryStatus(Object files, Object hours) {
    return '$files files・$hours hour ago';
  }
}
