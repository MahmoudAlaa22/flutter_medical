
import 'package:flutter/material.dart';


import '../const/color_manager.dart';
import '../const/text_style_manager.dart';
import '../const/values_manager.dart';

class Themes {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    cardColor: ColorManager.white,
    shadowColor: ColorManager.lightGreen,
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 15
      ),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorManager.greyShade900,
    cardColor: ColorManager.black,
    shadowColor: ColorManager.lightGreen,
    textTheme: const TextTheme(
      bodyText2: TextStyle(
          color: Colors.white,
        fontSize: 15
      ),
    ),
  );
}
