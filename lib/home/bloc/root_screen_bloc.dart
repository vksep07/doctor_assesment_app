import 'package:doctor_app_assessment/home/network/model/bottom_bar_model.dart';
import 'package:doctor_app_assessment/home/view/tabs/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RootScreenBloc {
  BehaviorSubject<int> _bottomNavIndexController =
      BehaviorSubject<int>.seeded(0);

  BehaviorSubject<int> get bottomNavIndexController =>
      _bottomNavIndexController;

  List<BottomBarModel> navigationBarItems = [
    new BottomBarModel(
        index: 0,
        selectedIcondata: Icons.home_filled,
        unSelectedIcon: Icons.home_outlined),
    new BottomBarModel(
        index: 1,
        selectedIcondata: Icons.note_alt_rounded,
        unSelectedIcon: Icons.note_alt_outlined),
    new BottomBarModel(
        index: 2,
        selectedIcondata: Icons.add_circle_outlined,
        unSelectedIcon: Icons.add),
    new BottomBarModel(
        index: 3,
        selectedIcondata: Icons.chat_bubble,
        unSelectedIcon: Icons.chat_bubble_outline),
    new BottomBarModel(
        index: 4,
        selectedIcondata: Icons.settings,
        unSelectedIcon: Icons.settings_outlined),
  ];

  void setBottomNavIndex({int? botNavIndex}) {
    bottomNavIndexController.add(botNavIndex!);
  }
}

final rootScreenBloc = RootScreenBloc();
