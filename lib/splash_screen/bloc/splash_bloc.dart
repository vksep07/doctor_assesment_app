import 'package:doctor_app_assessment/common/routes/routes.dart';
import 'package:doctor_app_assessment/common/services/navigation_service.dart';

class SplashBloc {
  redirectToHomeScreen() {
    Future.delayed(const Duration(seconds: 3), () async {
      appNavigationService.pushReplacementNamed(Routes.root_screen);
    });
  }
}

final splashBloc = SplashBloc();
