import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/const/text_style_manager.dart';
import '../state_management/personal_info_controller_getx.dart';

class SelectStateWidget extends StatelessWidget {
   SelectStateWidget({Key? key}) : super(key: key);
  final personalInfoControllerGetx = Get.put(PersonalInfoControllerGetx());
  @override
  Widget build(BuildContext context) {
    return SelectState(
      style: TextStyleManager.lightGreenStyle,
      onCountryChanged: (value)=>personalInfoControllerGetx.changeCountry(value),
      onStateChanged: (value) =>personalInfoControllerGetx.changeState(value),
      onCityChanged: (value) =>personalInfoControllerGetx.changeCity(value),
    );
  }
}
