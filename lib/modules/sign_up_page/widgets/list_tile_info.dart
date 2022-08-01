import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:get/get.dart';

import '../../../common/const/values_manager.dart';
import '../contains/medical_info/medical_info.dart';
import '../contains/personal_info/personal_info.dart';
import '../contains/work_info/work_info.dart';

class ListTileInfo extends StatefulWidget {
  const ListTileInfo({Key? key, required this.title, required this.id})
      : super(key: key);
  final String title;
  final int id;

  @override
  State<ListTileInfo> createState() => _ListTileInfoState();
}

class _ListTileInfoState extends State<ListTileInfo> {
  bool isCardOpening = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.lightGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              onTap: () {
                setState(() {
                  isCardOpening = !isCardOpening;
                });
              },
              title: Text(
                widget.title.tr,
                style: TextStyleManager.defaultStyle(context).copyWith(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                isCardOpening
                    ? Icons.keyboard_arrow_up_sharp
                    : Icons.keyboard_arrow_down_sharp,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (isCardOpening)
          if (widget.id == 1)
            PersonalInfo()
          else if (widget.id == 2)
            WorkInfo()
          else if (widget.id == 3)
            MedicalInfo()
      ],
    );
  }
}
