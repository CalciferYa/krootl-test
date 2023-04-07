import 'package:auto_route/auto_route.dart';
import 'package:core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:presentation/l10n/generated/app_localizations.dart';
import 'package:presentation/routing/app_router.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(
        locator<AppRouter>(),
      ),
      routeInformationParser: locator<AppRouter>().defaultRouteParser(),
      scaffoldMessengerKey: locator(),
    );
  }
}
