import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:flutter_task/modules/home_page/contains/settings/state_management/settings_controller_getx.dart';
import 'package:flutter_task/modules/sign_up_page/const/sign_up_text_key.dart';
import 'package:get/get.dart';

import '../../../../../common/const/text_style_manager.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final settingsControllerGetx = Get.find<SettingsControllerGetx>();

  @override
  Widget build(BuildContext context) {
    final style = TextStyleManager.defaultStyle(context).copyWith(fontSize: 20);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SignUpTextKey.language.tr,
            style: style,
          ),
          Obx(() {
            return Row(
              children: [
                Flexible(
                  child: RadioListTile(value: Language.english, groupValue: settingsControllerGetx.language.value,
                      title: Text('English', style: style,),
                      onChanged: (Language?v)=>settingsControllerGetx.changeLanguage(v!)),
                ),
                Flexible(
                  child: RadioListTile(value: Language.arabic, groupValue: settingsControllerGetx.language.value,
                      title: Text('العربية', style: style,),
                      onChanged: (Language?v) =>settingsControllerGetx.changeLanguage(v!)),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
