import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/images/240_F_97000769_R4zepLTgmf8G22W7G2o8JA1HeiVK2CkK.jpeg',
      selectedImagePath: 'assets/images/home-button.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/240_F_185437775_5tA4CxwGpAdUa0xpUXcQX6iqJOuofXTa.jpeg',
      selectedImagePath: 'assets/images/booking.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/tab_3.png',
      selectedImagePath: 'assets/fitness_app/tab_3s.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/tab_4.png',
      selectedImagePath: 'assets/fitness_app/tab_4s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
