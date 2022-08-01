import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/common/assets/images.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:flutter_task/modules/home_page/contains/settings/state_management/settings_controller_getx.dart';
import 'package:flutter_task/modules/sign_up_page/const/sign_up_text_key.dart';

import '../../../common/const/color_manager.dart';
import 'package:get/get.dart';

import '../../../common/controller/upload_image_and_video_controller.dart';
import '../state_management/sign_up_controller_getx.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);
  final signUpControllerGetx = Get.find<SignUpControllerGetx>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PopupMenuButton(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.settings),
              Text(SignUpTextKey.language.tr)
            ],
          ),
          itemBuilder: (context) => Language.values.map((e) {
            final lang = e == Language.english ? 'English' : 'العربية';
            log('e is ${e.index}');
            return PopupMenuItem(
              value: e.index,
              child: Text(
                lang,
                style: TextStyleManager.defaultStyle(context),
              ),
            );
          }).toList(),
          onSelected: (int? v) {
            final settingsControllerGetx = Get.find<SettingsControllerGetx>();
            settingsControllerGetx
                .changeLanguage(v == 0 ? Language.english : Language.arabic);
          },
        ),
        Expanded(
          child: Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border:
                        Border.all(color: ColorManager.lightGreen, width: 1),
                  ),
                  child: Obx(() {
                    return ClipOval(
                      child: signUpControllerGetx.filePathImage.isEmpty
                          ? Center(child: Text(SignUpTextKey.addImage.tr))
                          : Image.file(
                              File(signUpControllerGetx.filePathImage.value),
                              fit: BoxFit.cover,
                            ),
                    );
                  }),
                ),
                IconButton(
                    onPressed: () async {
                      await signUpControllerGetx.addImageFromGallery();
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      color: ColorManager.lightGreen,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
