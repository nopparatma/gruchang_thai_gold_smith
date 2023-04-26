import 'dart:io';

import 'package:catcher/core/catcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gruchang_thai_gold_smith/ui/views/web/about_us.dart';
import 'package:gruchang_thai_gold_smith/ui/views/web/contact_us.dart';
import 'package:gruchang_thai_gold_smith/ui/views/web/home.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import '../ui/router.dart';
import '../ui/shared/ui_config.dart';
import '../ui/views/web/catalog.dart';
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
          backgroundColor: Colors.black,
        ),
        title: AppConfig.instance.applicationName,
        theme: ThemeData(
          // primarySwatch: Color.fromRGBO(5, 5, 6, 1),
          // accentColor: colorAccent,
          fontFamily: appFontFamily,
          // backgroundColor: Colors.black,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                fontFamily: appFontFamily,
              ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Color.fromRGBO(5, 5, 6, 1),
          ),
          iconTheme: const IconThemeData(color: Colors.orange),
          cardColor: const Color.fromRGBO(29, 29, 41, 1),
          appBarTheme: const AppBarTheme(
            toolbarHeight: 55,
          ),
        ),
        navigatorKey: Catcher.navigatorKey,
        onGenerateRoute: WebRouter.generateRoute,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        // navigatorObservers: [middleware],
        home: const HomePage(),
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
