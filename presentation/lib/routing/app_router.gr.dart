// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    DocumentsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const DocumentsPage()),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/start',
          fullMatch: true,
        ),
        RouteConfig(
          DocumentsRoute.name,
          path: '/start',
        ),
      ];
}

/// generated route for
/// [DocumentsPage]
class DocumentsRoute extends PageRouteInfo<void> {
  const DocumentsRoute()
      : super(
          DocumentsRoute.name,
          path: '/start',
        );

  static const String name = 'DocumentsRoute';
}
