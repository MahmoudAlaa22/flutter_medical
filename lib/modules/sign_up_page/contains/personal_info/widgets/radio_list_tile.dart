import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:get/get.dart';

import '../const/personal_info_text_key.dart';
import '../state_management/personal_info_controller_getx.dart';

class RadioListTileWidget extends StatelessWidget {
  const RadioListTileWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
  }) : super(key: key);
  final String title;
  final int value;
  final int groupValue;


  @override
  Widget build(BuildContext context) {
    final PersonalInfoControllerGetx personalInfoControllerGetx = Get.find();
    final isMale = title == PersonalInfoTextKey.male ? true : false;
    return Flexible(
      child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              Icon(
                isMale ? Icons.male_sharp : Icons.female_sharp,
                color: isMale ? Colors.blue : Colors.pinkAccent.shade200,
              ),
              Text(
                title.tr,
                style: TextStyleManager.defaultStyle(context),
              ),
            ],
          ),
          value: value,
          groupValue: groupValue,
          onChanged: (int?v) =>
              personalInfoControllerGetx.changeRadioValue(v!)
      ),
    );
  }
}
