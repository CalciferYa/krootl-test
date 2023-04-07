import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/routing/app_router.dart';

void init(GetIt locator) {
  locator
    ..registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>(),
    )
    ..registerSingleton<GlobalKey<ScaffoldMessengerState>>(
      GlobalKey<ScaffoldMessengerState>(),
    )
    ..registerSingleton(
      AppRouter(locator()),
    );
}
