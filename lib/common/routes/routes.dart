import 'package:doctor_app_assessment/home/view/root_screen.dart';
import 'package:doctor_app_assessment/home/view/tabs/doctor_detail_screen.dart';
import 'package:doctor_app_assessment/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String root_screen = 'root_Screen';
  static const String doctor_detail_screen = 'doctor_detail_screen';
  static const String splash = 'splash';

  static Route<dynamic>? getGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: splash),
          builder: (_) => SplashScreen(),
        );

      case root_screen:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: root_screen),
          builder: (_) => RootScreen(),
        );

      case doctor_detail_screen:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: doctor_detail_screen),
          builder: (_) => DoctorDetailScreen(),
        );
      default:
        return null;
    }
  }
}
