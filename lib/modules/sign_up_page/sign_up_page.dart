import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:flutter_task/modules/sign_up_page/const/sign_up_text_key.dart';
import 'package:flutter_task/modules/sign_up_page/widgets/list_tile_info.dart';
import 'package:flutter_task/widgets/animated_button_widget/animated_button_widget.dart';
import 'package:get/get.dart';

import 'state_management/sign_up_controller_getx.dart';
import 'widgets/profile_image.dart';

class SignUpPage extends GetWidget {
  SignUpPage({Key? key}) : super(key: key);
  static const String routeName = "/SignUpPage";
  final signUpControllerGetx = Get.put(SignUpControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s28,
                ),
                ProfileImage(),
                const SizedBox(
                  height: AppSize.s28,
                ),
                const ListTileInfo(title: SignUpTextKey.personalInfo, id: 1),
                const ListTileInfo(title: SignUpTextKey.workInfo, id: 2),
                const ListTileInfo(title: SignUpTextKey.medicalInfo, id: 3),
                const SizedBox(
                  height: AppSize.s40,
                ),
                AnimatedButtonWidget(
                    color: ColorManager.lightGreen,
                    borderRadius: BorderRadius.circular(30),
                    onPressed: () => signUpControllerGetx.signUp(),
                    child: Text(
                      SignUpTextKey.signUp.tr,
                      style: TextStyleManager.defaultStyle(context).copyWith(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: AppSize.s40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
