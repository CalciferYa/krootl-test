import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krootl_test/di/injector.dart' as di;
import 'package:presentation/application.dart';
import 'package:presentation/l10n/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await Localization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          const Application(),
        ),
      );
    },
    (error, stack) {
      log(error.toString(), stackTrace: stack);
    },
  );
}
