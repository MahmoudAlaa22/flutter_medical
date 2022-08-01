import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:get/get.dart';

import '../state_management/home_page_controller_getx.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  final homePageControllerGetx = Get.find<HomePageControllerGetx>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * 0.2,
      right: 20,
      child: Obx(() {
        return Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: ColorManager.darkGreen,
                shape: BoxShape.circle,
                border: Border.all(color: ColorManager.darkGreen, width: 3),
              ),
              child: ClipOval(
                child: Image.file(
                  File(homePageControllerGetx.image!.value),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              homePageControllerGetx.name!.value,
              style: TextStyleManager.defaultStyle(context),
            )
          ],
        );
      }),
    );
  }
}
