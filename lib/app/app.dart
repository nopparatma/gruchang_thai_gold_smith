import 'dart:io';

import 'package:catcher/core/catcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gruchang_thai_gold_smith/ui/views/web/home.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'app_config.dart';

class MainAppLocalization extends StatelessWidget {
  const MainAppLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayOpacity: 0.5,
      overlayColor: Colors.black,
      overlayWidget: buildOverlayLoader(),
      child: buildChild(),
    );
  }

  buildChild() {
    if (kIsWeb) {
      return const MainWeb();
    } else if (Platform.isAndroid || Platform.isIOS) {
      // return MainApp();
      // return DemoOneSignalApp();
    }
  }

  Widget buildOverlayLoader() {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.lightGreen,
        size: 100,
      ),
    );
  }
}

class MainWeb extends StatefulWidget {
  const MainWeb({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainWebState createState() => _MainWebState();
}

class _MainWebState extends State<MainWeb> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (detail) => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(1600, name: "HD"),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          backgroundColor: Colors.white,
        ),
        title: AppConfig.instance.applicationName,
        // theme: ThemeData(
        //   primarySwatch: colorPrimaryTheme,
        //   accentColor: colorAccent,
        //   fontFamily: appFontFamily,
        //   backgroundColor: Colors.white,
        //   textTheme: Theme.of(context).textTheme.apply(
        //     bodyColor: colorDark,
        //     displayColor: colorDark,
        //     fontFamily: appFontFamily,
        //   ),
        //   iconTheme: const IconThemeData(color: colorDark),
        //   tabBarTheme: TabBarTheme(
        //     labelStyle: TextStyle(
        //       fontFamily: appFontFamily,
        //       fontWeight: FontWeight.bold,
        //     ),
        //     unselectedLabelStyle: TextStyle(
        //       fontFamily: appFontFamily,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       textStyle: TextStyle(
        //         fontFamily: appFontFamily,
        //         fontWeight: FontWeight.normal,
        //       ),
        //     ),
        //   ),
        //   outlinedButtonTheme: OutlinedButtonThemeData(
        //     style: OutlinedButton.styleFrom(
        //       textStyle: TextStyle(
        //         fontFamily: appFontFamily,
        //         fontWeight: FontWeight.normal,
        //       ),
        //     ),
        //   ),
        // ),
        navigatorKey: Catcher.navigatorKey,
        // onGenerateRoute: WebRouter.generateRoute,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        // navigatorObservers: [middleware],
        home: const Home(),
      ),
    );
  }
}

class AppLogger extends Logger {
  static final AppLogger _instance = AppLogger._internal();

  factory AppLogger() {
    _instance;
    return _instance;
  }

  AppLogger._internal()
      : super(
          printer: PrettyPrinter(
            printEmojis: false,
            methodCount: 0,
          ),
        );

  static AppLogger get instance {
    return _instance;
  }
}
