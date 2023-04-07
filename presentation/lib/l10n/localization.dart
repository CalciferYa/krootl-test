import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:presentation/l10n/generated/app_localizations.dart';

class Localization {
  static AppLocalizations get texts => _current!;
  static AppLocalizations? _current;

  static Future<void> ensureInitialized() async {
    if (_current == null) {
      final parts = Intl.getCurrentLocale().split('_');
      final locale = Locale(parts.first, parts.last);
      if (AppLocalizations.delegate.isSupported(locale)) {
        _current = await AppLocalizations.delegate.load(locale);
      } else {
        _current = await AppLocalizations.delegate.load(
          AppLocalizations.supportedLocales.first,
        );
      }
    }
  }

  void invalidate() => _current = null;
}
