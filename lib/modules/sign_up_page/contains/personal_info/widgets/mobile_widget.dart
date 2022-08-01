import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../../common/const/color_manager.dart';
import '../../../../../common/const/text_style_manager.dart';
import '../../../../../common/const/values_manager.dart';
import '../state_management/personal_info_controller_getx.dart';

class MobileWidget extends StatelessWidget {
   MobileWidget({Key? key}) : super(key: key);
  final personalInfoControllerGetx = Get.find<PersonalInfoControllerGetx>();
  InputBorder _inputBorder({Color color = ColorManager.lightGreen}) {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(AppSize.s14));
  }

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      hintText: 'Phone number',
      onInputChanged: (PhoneNumber number) {
        personalInfoControllerGetx.changePhoneNumber(number.phoneNumber!);
      },
      validator: (v){
        if(v!.isEmpty){
          return 'Invalid phone number';
        }
        return null;
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: Theme.of(context).textTheme.bodyText2,
      textStyle: Theme.of(context).textTheme.bodyText2,
      formatInput: false,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputBorder: const OutlineInputBorder(),
      onSaved: (PhoneNumber number) {},
      inputDecoration: InputDecoration(
          focusedBorder: _inputBorder(),
          enabledBorder: _inputBorder(),
          errorBorder: _inputBorder(color: ColorManager.error),
          focusedErrorBorder: _inputBorder(color: ColorManager.error)),
    );
  }
}
