import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/silent_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'app/app.dart';
import 'app/app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyBoYz6JogeCNBJ6w_FPDhKy5admOUjuIt4",
  //     appId: "1:497275743777:web:83176a3cc3054e5a143d60",
  //     messagingSenderId: "497275743777",
  //     projectId: "gruchangthai",
  //   ),
  // );

  AppConfig.dev();
  Logger.level = Level.verbose;

  CatcherOptions catcherOptions = CatcherOptions(
    SilentReportMode(),
    [ConsoleHandler()],
  );

  Catcher(
    rootWidget: const MainAppLocalization(),
    debugConfig: catcherOptions,
    releaseConfig: catcherOptions,
    profileConfig: catcherOptions,
  );
}
