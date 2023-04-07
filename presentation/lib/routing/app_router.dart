import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/features/documents/pages/documents_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: DocumentsPage, path: '/start', initial: true),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(
    GlobalKey<NavigatorState> navigatorKey,
  ) : super(navigatorKey);
}
