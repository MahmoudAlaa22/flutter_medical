import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/modules/sign_up_page/contains/personal_info/const/personal_info_text_key.dart';
import 'package:get/get.dart';

import '../../../../../common/const/text_style_manager.dart';
import '../../../../../common/const/values_manager.dart';
import '../state_management/personal_info_controller_getx.dart';

class DataOfBirth extends StatelessWidget {
  DataOfBirth({Key? key}) : super(key: key);
  final personalInfoControllerGetx = Get.put(PersonalInfoControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          PersonalInfoTextKey.dateOfBirth.tr,
          style: TextStyleManager.lightGreenStyle,
        ),
        const SizedBox(
          width: AppSize.s12,
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(AppSize.s14),
                border: Border.all(color: ColorManager.lightGreen)),
            child: ListTile(
              onTap: () async {
                DateTime? dataOfBirth = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1930),
                  lastDate: DateTime(2300),
                );
                personalInfoControllerGetx.addDataOfBirth(dataOfBirth);
              },
              leading: const Icon(Icons.calendar_month),
              title: GetBuilder<PersonalInfoControllerGetx>(builder: (logic) {
                final date = logic.dateOfBirth ?? '';
                return Text(
                  date,
                  style: TextStyleManager.defaultStyle(context),
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}
