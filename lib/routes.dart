import 'package:flutter/material.dart';
import 'package:tamimg_portfolio/mobile/about_mobile.dart';
import 'package:tamimg_portfolio/mobile/contact_mobile.dart';
import 'package:tamimg_portfolio/web/about_web.dart';
import 'package:tamimg_portfolio/web/contact_web.dart';
import 'package:tamimg_portfolio/web/landing_page_web.dart';
import 'package:tamimg_portfolio/mobile/landing_page_mobile.dart';
import 'package:tamimg_portfolio/web/projet_web.dart';
import 'package:tamimg_portfolio/mobile/project_mobile.dart';
import 'package:tamimg_portfolio/web/works_web.dart';
import 'package:tamimg_portfolio/mobile/works_mobile.dart';

class Routes {
  static const String home = '/';
  static const String contact = '/contact';
  static const String about = '/about';
  static const String projet = '/projet';
  static const String works = '/works';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _responsiveRoute(LandingPageWeb(), LandingPageMobile());
      case contact:
        return _responsiveRoute(ContactWeb(), ContactMobile());
      case about:
        return _responsiveRoute(AboutWeb(), AboutMobile());
      case projet:
        return _responsiveRoute(ProjetWeb(), ProjetMobile());
      case works:
        return _responsiveRoute(WorksWeb(), WorksMobile());
      default:
        return _responsiveRoute(
            LandingPageWeb(), LandingPageMobile(), settings);
    }
  }

  static MaterialPageRoute _responsiveRoute(
      Widget webWidget, Widget mobileWidget,
      [RouteSettings? settings]) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth > 800 ? webWidget : mobileWidget;
      }),
    );
  }
}

/*class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          }),
        );
      case '/contact':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return ContactWeb();
                  } else
                    return ContactMobile();
                }),
            settings: settings);
      case '/about':
        return MaterialPageRoute(
            builder: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return AboutWeb();
              } else
                return AboutMobile();
            }),
            settings: settings);

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return LandingPageWeb();
                  } else {
                    return LandingPageMobile();
                  }
                }));
    }
  }
}
*/
