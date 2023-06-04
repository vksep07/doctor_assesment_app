import 'package:doctor_app_assessment/splash_screen/bloc/splash_bloc.dart';
import 'package:doctor_app_assessment/util/app_logger.dart';
import 'package:doctor_app_assessment/util/app_util.dart';
import 'package:doctor_app_assessment/util/assets.dart';
import 'package:doctor_app_assessment/util/colors.dart';
import 'package:doctor_app_assessment/util/common_widgets/app_text_widget.dart';
import 'package:doctor_app_assessment/util/common_widgets/extensions.dart';
import 'package:doctor_app_assessment/util/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    AppUtil.setStatusBarColor(statusBarColor: AppColors.primary);
    AppLogger.printLog("open splash screen");
    super.initState();
    splashBloc.redirectToHomeScreen();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

   // splashBloc.changeIntoJson();
    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn));
    animationController.forward();

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FadeTransition(
                opacity: animationController
                    .drive(CurveTween(curve: Curves.easeOut)),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(Assets.appLogo, fit: BoxFit.cover,),
                ),
              ),
            ),
            Center(
              child: FadeTransition(
                opacity: animationController
                    .drive(CurveTween(curve: Curves.easeOut)),
                child: AppTextWidget(
                text: stringConstant.appName,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 26,
                ),
              ),
            ),
            10.heightBox,
            Center(
              child: FadeTransition(
                opacity: animationController
                    .drive(CurveTween(curve: Curves.easeOut)),
                child:AppTextWidget(
                  text: stringConstant.consultYourDoctor,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  size: 12,
                ),
              ),
            ),
          ],
        ));
  }
}
