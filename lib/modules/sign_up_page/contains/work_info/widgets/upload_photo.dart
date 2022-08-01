import 'package:flutter/material.dart';
import 'package:flutter_task/modules/sign_up_page/contains/work_info/const/work_info_text_key.dart';
import 'package:get/get.dart';

import '../../../../../common/const/text_style_manager.dart';
import '../../../../../common/const/values_manager.dart';

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.tr,
            style: TextStyleManager.lightGreenStyle,
          ),
          const SizedBox(
            width: AppSize.s12,
          ),
          GestureDetector(
            onTap: () => onTap(),
            child: Row(
              children: [
                const Icon(Icons.file_upload_outlined),
                Text(
                  WorkInfoTextKey.uploadPhoto.tr,
                  style: TextStyleManager.lightGreenStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
