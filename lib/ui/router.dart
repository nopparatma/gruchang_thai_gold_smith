import 'package:flutter/material.dart';
import 'package:gruchang_thai_gold_smith/ui/views/web/about_us.dart';
import 'package:gruchang_thai_gold_smith/ui/views/web/catalog.dart';
import 'package:gruchang_thai_gold_smith/ui/views/web/contact_us.dart';
import 'package:gruchang_thai_gold_smith/ui/views/web/home.dart';

class RoutePaths {
  static const String index = '/';
  static const String homePage = '/home_page';
  static const String catalogPage = '/catalog_page';
  static const String aboutUsPage = '/about_us_page';
  static const String contactUsPage = '/contact_us_page';
}

class WebRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> arguments = Map<String, dynamic>.from(settings.arguments == null ? {} : settings.arguments as Map<String, dynamic>);

    switch (settings.name) {
      case RoutePaths.homePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomePage(),
        );
      case RoutePaths.catalogPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CatalogPage(),
        );
      case RoutePaths.aboutUsPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AboutUsPage(),
        );
      case RoutePaths.contactUsPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ContactUsPage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
