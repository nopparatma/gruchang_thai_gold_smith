import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/silent_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'app/app.dart';
import 'app/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
