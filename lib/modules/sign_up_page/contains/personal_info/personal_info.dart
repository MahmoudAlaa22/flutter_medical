import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/modules/sign_up_page/contains/personal_info/const/personal_info_text_key.dart';
import 'package:get/get.dart';
import 'state_management/personal_info_controller_getx.dart';
import 'widgets/data_of_birth.dart';
import 'widgets/gender_widget.dart';
import '../../../../widgets/title_with_text_form_field.dart';
import 'widgets/mobile_widget.dart';
import 'widgets/select_state_widget.dart';
import 'widgets/your_id_widget.dart';

class PersonalInfo extends GetWidget {
  PersonalInfo({Key? key}) : super(key: key);
  final personalInfoControllerGetx = Get.put(PersonalInfoControllerGetx());


  @override
  Widget build(BuildContext context) {
    return Form(
      key: personalInfoControllerGetx.personalInfoFormKey,
      child: Column(
        children: [
          TitleWithTextFormField(
              labelText: PersonalInfoTextKey.fullName,
              onSaved: (v) => personalInfoControllerGetx.changeFullName(v)),
          YourIdWidget(),
          const GenderWidget(),
          DataOfBirth(),
          TitleWithTextFormField(
              labelText: PersonalInfoTextKey.personalAddress,
              onSaved: (v) =>
                  personalInfoControllerGetx.changePersonalAddress(v)),
          SelectStateWidget(),
          MobileWidget(),
          TitleWithTextFormField(
            labelText: PersonalInfoTextKey.email,
            onSaved: (v) => personalInfoControllerGetx.changeEmail(v),
            textInputType: TextInputType.emailAddress,
          ),
          GetBuilder<PersonalInfoControllerGetx>(builder: (controller) {
            final bool isVisible = controller.passwordVisibility;
            return TitleWithTextFormField(
              labelText: PersonalInfoTextKey.password,
              onSaved: (v) => controller.changePassword(v),
              obscureText: !controller.passwordVisibility,
              textInputType: TextInputType.visiblePassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.changeStateOfPasswordVisibility(!isVisible);
                },
                child: Icon(
                  isVisible
                      ? Icons.visibility_sharp
                      : Icons.visibility_off_sharp,
                  color: ColorManager.lightGreen,
                ),
              ),
            );
          }),
          GetBuilder<PersonalInfoControllerGetx>(
              init: PersonalInfoControllerGetx(),
              builder: (controller) {
                final bool isVisible = controller.passwordVisibility;
                return TitleWithTextFormField(
                  labelText: PersonalInfoTextKey.confirmPassword,
                  onSaved: (v) => controller.changeConfirmPassword(v),
                  obscureText: !controller.passwordVisibility,
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.changeStateOfPasswordVisibility(!isVisible);
                    },
                    child: Icon(
                      isVisible
                          ? Icons.visibility_sharp
                          : Icons.visibility_off_sharp,
                      color: ColorManager.lightGreen,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
