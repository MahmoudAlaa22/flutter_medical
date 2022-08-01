import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/const/color_manager.dart';
import '../../../common/const/values_manager.dart';
import '../const/home_page_text_key.dart';
import 'container_icon_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20, vertical: AppPadding.p8),
      height: AppSize.s100,
      decoration: const BoxDecoration(
        color: ColorManager.darkGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s28),
          topRight: Radius.circular(AppSize.s28),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContainerIconWidget(
            title: HomePageTextKey.home,
            iconData: Icons.home,
            id: 1,
          ),
          ContainerIconWidget(
            title: HomePageTextKey.settings,
            iconData: Icons.settings,
            id: 2,
          ),
        ],
      ),
    );
  }
}
