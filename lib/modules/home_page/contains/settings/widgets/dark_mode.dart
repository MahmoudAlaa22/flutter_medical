import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/const/color_manager.dart';
import '../../../../../common/const/text_style_manager.dart';
import '../const/settings_page_text_key.dart';
import '../state_management/settings_controller_getx.dart';

class DarkMode extends StatelessWidget {
  DarkMode({Key? key}) : super(key: key);
  final settingsControllerGetx = Get.find<SettingsControllerGetx>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        SettingsPageTextKey.darkMode.tr,
        style: TextStyleManager.defaultStyle(context).copyWith(
          fontSize: 20
        ),
      ),
      trailing: Obx(() {
        return CupertinoSwitch(
            activeColor: ColorManager.lightGreen,
            value: settingsControllerGetx.isDark.value,
            onChanged: (v)=>settingsControllerGetx.changeDarkMode(v));
      }),
    );
  }
}
