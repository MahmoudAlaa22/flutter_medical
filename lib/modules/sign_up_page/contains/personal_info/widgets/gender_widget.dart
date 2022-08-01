import 'package:flutter/material.dart';
import 'package:flutter_task/modules/sign_up_page/contains/personal_info/const/personal_info_text_key.dart';
import 'package:flutter_task/modules/sign_up_page/contains/personal_info/state_management/personal_info_controller_getx.dart';
import 'package:get/get.dart';

import '../../../../../common/const/text_style_manager.dart';
import '../../../../../common/const/values_manager.dart';
import 'radio_list_tile.dart';

class GenderWidget extends StatelessWidget {
   const GenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          PersonalInfoTextKey.gender.tr,
          style: TextStyleManager.lightGreenStyle,
        ),
        const SizedBox(width: AppSize.s12,),
        Expanded(
          child: GetBuilder<PersonalInfoControllerGetx>(
            init: PersonalInfoControllerGetx(),
            builder: (controller) {
              return Row(
                children: [
                  RadioListTileWidget(
                    title: PersonalInfoTextKey.female,
                    value: 1,
                    groupValue: controller.genderRadioValue,
                  ),
                  RadioListTileWidget(
                    title: PersonalInfoTextKey.male,
                    value: 2,
                    groupValue: controller.genderRadioValue,
                  ),
                ],
              );
            }
          ),
        )
      ],
    );
  }
}
