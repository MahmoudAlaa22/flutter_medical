import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:flutter_task/modules/home_page/contains/settings/const/settings_page_text_key.dart';
import 'package:get/get.dart';

import 'state_management/settings_controller_getx.dart';
import 'widgets/app_bar_Of_settings.dart';
import 'widgets/dark_mode.dart';
import 'widgets/language_widget.dart';
import 'widgets/profile_container.dart';

class SettingsPage extends GetWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarOfSettings(),
        const SizedBox(
          height: AppSize.s12,
        ),
         DarkMode(),
         LanguageWidget(),
        const ProfileContainer()
      ],
    );
  }
}
