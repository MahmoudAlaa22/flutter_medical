import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:get/get.dart';

class TextStyleManager {
  //roboto is default font in project.
  // static final defaultStyle =
  //     Get.textTheme.bodyText2!.copyWith(color: Colors.black);
  static final lightGreenStyle = Get.textTheme.bodyText2!.copyWith(
    color: ColorManager.lightGreen,
    fontSize: 15,
  );

  static TextStyle defaultStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!;
  }
}
