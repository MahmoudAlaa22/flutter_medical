import 'package:flutter/material.dart';
import 'package:flutter_task/modules/sign_up_page/contains/personal_info/const/personal_info_text_key.dart';
import 'package:flutter_task/modules/sign_up_page/contains/personal_info/state_management/personal_info_controller_getx.dart';
import 'package:flutter_task/widgets/text_form_field_widget.dart';
import 'package:get/get.dart';

import '../../../widgets/title_with_dropdown_button.dart';

class YourIdWidget extends StatelessWidget {
  YourIdWidget({Key? key}) : super(key: key);
  final personalInfoControllerGetx = Get.find<PersonalInfoControllerGetx>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Obx(() {
            return TitleWithDropdownButton(
              title: PersonalInfoTextKey.yourId,
              value: personalInfoControllerGetx.yourId.value,
              items: personalInfoControllerGetx.listYourId,
              onChanged: (v) => personalInfoControllerGetx.changeYourId(v),
            );
          }),
        ),
        TextFormFieldWidget(
            textInputType: TextInputType.number,
            onSaved: (v) => personalInfoControllerGetx.changeNumberOfYourId(v),
            )
      ],
    );
  }
}
