import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:flutter_task/modules/home_page/const/home_page_text_key.dart';
import 'package:flutter_task/modules/home_page/contains/settings/const/settings_page_text_key.dart';
import 'package:get/get.dart';

import '../../../../../common/const/color_manager.dart';
import '../../../../../common/const/values_manager.dart';
import '../../../state_management/home_page_controller_getx.dart';

class AppBarOfSettings extends StatelessWidget {
  AppBarOfSettings({Key? key}) : super(key: key);
  final homePageControllerGetx = Get.find<HomePageControllerGetx>();

  @override
  Widget build(BuildContext context) {
    var heightOfBarStatus = MediaQuery.of(context).viewPadding.top;
    return Container(
      height: AppSize.s100 + heightOfBarStatus,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: ColorManager.darkGreen,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppSize.s40),
          bottomLeft: Radius.circular(AppSize.s40),
        ),
      ),
      child: SafeArea(
          child: ListTile(
              leading: SizedBox(
                width: AppSize.s130,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () =>
                            homePageControllerGetx.changeCurrentButtonSheet(1),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 40,
                          color: Colors.white,
                        )),
                    Text(SettingsPageTextKey.back.tr,
                        style: TextStyleManager.defaultStyle(context)
                            .copyWith(color: Colors.white, fontSize: 25))
                  ],
                ),
              ),
              title: Text(
                HomePageTextKey.settings.tr,
                style: TextStyleManager.defaultStyle(context)
                    .copyWith(color: Colors.white, fontSize: 25),
              ))),
    );
  }
}
