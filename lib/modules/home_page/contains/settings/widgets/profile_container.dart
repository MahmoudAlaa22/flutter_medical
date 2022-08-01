import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:flutter_task/modules/home_page/contains/settings/const/settings_page_text_key.dart';
import 'package:get/get.dart';

import '../../../../../common/const/text_style_manager.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p50),
      child: GestureDetector(
        onTap: (){

        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.darkGreen,
            borderRadius:BorderRadius.circular(AppSize.s12)
          ),
          child: ListTile(
            leading: const Icon(Icons.person,color: Colors.white,),
            trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
            title: Text(SettingsPageTextKey.profile.tr,
            style: TextStyleManager.defaultStyle(context).copyWith(fontSize: 20,
              color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  }
}
