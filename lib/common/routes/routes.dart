import 'package:doctor_app_assessment/chat/view/chat_detail_screen.dart';
import 'package:doctor_app_assessment/home/network/model/doctor_data_model.dart';
import 'package:doctor_app_assessment/home/view/root_screen.dart';
import 'package:doctor_app_assessment/home/view/tabs/doctor_detail_screen.dart';
import 'package:doctor_app_assessment/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String root_screen = 'root_Screen';
  static const String doctor_detail_screen = 'doctor_detail_screen';
  static const String splash = 'splash';
  static const String chat_detail_screen='chat_detail_page';

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
        final args =
        settings.arguments as DoctorDataModel;
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: doctor_detail_screen),
          builder: (_) => DoctorDetailScreen(doctorDataModel: args),
        );

      case chat_detail_screen:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: chat_detail_screen),
          builder: (_) => ChatDetailScreen(),
        );
      default:
        return null;
    }
  }
}
