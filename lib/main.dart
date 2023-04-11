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

  await Firebase.initializeApp(
    name: 'gruchang_thai_gold_smith',
    options: const FirebaseOptions(
      apiKey: "AIzaSyBohdCY8al1wtU6-0fKmJ-KjNxZAMPxApw",
      authDomain: "gruchangthai2.firebaseapp.com",
      projectId: "gruchangthai2",
      storageBucket: "gruchangthai2.appspot.com",
      messagingSenderId: "292247113542",
      appId: "1:292247113542:web:9bb003262312d73c769f47",
      measurementId: "G-KRG3ZNR6QQ",
    ),
  );

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
