import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:get/get.dart';

import '../../../../../common/const/values_manager.dart';

class DescribeConditionByVoiceAndVideo extends StatelessWidget {
  const DescribeConditionByVoiceAndVideo(
      {Key? key, required this.title, required this.iconData})
      : super(key: key);
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
      children: [
        Text(
          title.tr,
          style: TextStyleManager.defaultStyle(context),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.file_upload_outlined,
              size: AppSize.s40,
            ),
            Icon(
              iconData,
              color: ColorManager.lightGreen,
              size: AppSize.s40,
            )
          ],
        )
      ],
    );
  }
}
