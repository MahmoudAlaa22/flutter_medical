import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:get/get.dart';

import '../state_management/home_page_controller_getx.dart';

class ContainerIconWidget extends StatelessWidget {
  ContainerIconWidget(
      {Key? key, required this.iconData, required this.title, required this.id})
      : super(key: key);
  final IconData iconData;
  final String title;
  final int id;

  final homePageControllerGetx = Get.find<HomePageControllerGetx>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => homePageControllerGetx.changeCurrentButtonSheet(id),
      child: Obx(() {
        return Container(
          width: 120,
          height: 100,
          padding: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
              color: homePageControllerGetx.currentButtonSheet.value == id
                  ? Colors.white30
                  : ColorManager.darkGreen,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Icon(
                iconData,
                size: 30,
                color: Colors.white,
              ),
              AutoSizeText(
                  title.tr,
                style: TextStyleManager.defaultStyle(context).copyWith(
                  color: Colors.white,
                ),
                maxFontSize: 20,
              ),
            ],
          ),
        );
      }),
    );
  }
}
