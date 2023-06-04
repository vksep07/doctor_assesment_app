import 'package:doctor_app_assessment/home/bloc/root_screen_bloc.dart';
import 'package:doctor_app_assessment/home/network/model/bottom_bar_model.dart';
import 'package:doctor_app_assessment/home/view/tabs/home_screen.dart';
import 'package:doctor_app_assessment/home/view/tabs/ScheduleTab.dart';
import 'package:doctor_app_assessment/util/assets.dart';
import 'package:doctor_app_assessment/util/colors.dart';
import 'package:doctor_app_assessment/util/common_widgets/app_text_widget.dart';
import 'package:doctor_app_assessment/util/common_widgets/extensions.dart';
import 'package:doctor_app_assessment/util/constants.dart';
import 'package:doctor_app_assessment/util/string_constant.dart';
import 'package:doctor_app_assessment/util/styles/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(MyColors.primary),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: StreamBuilder<int>(
          stream: rootScreenBloc.bottomNavIndexController,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              if (snapshot.data == bottomNavigationBarHome) {
                return HomeScreen(
                  onPressedScheduleCard: () {},
                );
              } else if (snapshot.data == bottomNavigationBarChat) {
                return ScheduleTab();
              } else {
                return HomeScreen(
                  onPressedScheduleCard: () {},
                );
              }
            } else {
              return HomeScreen(
                onPressedScheduleCard: () {},
              );
            }
          },
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: BottomAppBar(
          child: StreamBuilder<int>(
              stream: rootScreenBloc.bottomNavIndexController,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int? navIndex = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            getBottomBarItemLayout(
                                icon: Icons.home_outlined,
                                isSelected: navIndex == bottomNavigationBarHome
                                    ? true
                                    : false,
                                navigationBarIndex: bottomNavigationBarHome),
                            getBottomBarItemLayout(
                                icon: Icons.category_outlined,
                                isSelected: (() {
                                  if (navIndex == bottomNavigationBarNotes) {
                                    return true;
                                  }
                                  return false;
                                }()),
                                navigationBarIndex: bottomNavigationBarNotes),
                            getBottomBarItemLayout(
                                icon: Icons.add_circle_outlined,
                                isSelected: navIndex == bottomNavigationBarAdd
                                    ? true
                                    : false,
                                navigationBarIndex: bottomNavigationBarAdd),
                            getBottomBarItemLayout(
                                icon: Icons.chat_bubble_outline,
                                isSelected: navIndex == bottomNavigationBarChat
                                    ? true
                                    : false,
                                navigationBarIndex: bottomNavigationBarChat),
                            getBottomBarItemLayout(
                                icon: Icons.settings_outlined,
                                isSelected:
                                    navIndex == bottomNavigationBarSettings
                                        ? true
                                        : false,
                                navigationBarIndex: bottomNavigationBarSettings)
                          ]),
                    ],
                  );
                }
                return SizedBox();
              }),
        ),
      ),
    );
  }

  getBottomBarItemLayout(
      {String? title,
      IconData? icon,
      bool? isSelected,
      String? imagePath,
      int? navigationBarIndex}) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          rootScreenBloc.setBottomNavIndex(botNavIndex: navigationBarIndex);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            12.heightBox,
            (() {
              if (navigationBarIndex == bottomNavigationBarAdd) {
                return FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 29,
                  ),
                  backgroundColor: AppColors.primary,
                  tooltip: 'Capture Picture',
                  elevation: 5,
                  splashColor: Colors.grey,
                );
              }
              return Icon(
                  (() {
                    if (isSelected ?? false) {
                      return rootScreenBloc
                          .navigationBarItems[navigationBarIndex ?? 0]
                          .selectedIcondata;
                    } else {
                      return rootScreenBloc
                          .navigationBarItems[navigationBarIndex ?? 0]
                          .unSelectedIcon;
                    }
                  }()),
                  color: isSelected!
                      ? AppColors.primary
                      : AppColors.getColorFromHex("#414E5A"),
                  size: 24);
            }()),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
