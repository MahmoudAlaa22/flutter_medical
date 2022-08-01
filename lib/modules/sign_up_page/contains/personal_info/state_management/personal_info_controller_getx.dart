import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:get/get.dart';

class PersonalInfoControllerGetx extends GetxController {
  final personalInfoFormKey = GlobalKey<FormState>();
  RxString fullName = ''.obs;
  RxInt numberOfYourId = 0.obs;
  RxString yourId = 'National Id'.obs;
  RxList<String> listYourId = <String>['Passport', 'National Id'].obs;
  int genderRadioValue = 2;
  String? dateOfBirth;
  RxString personalAddress = ''.obs;
  RxString country = ''.obs;
  RxString state = ''.obs;
  RxString city = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString email = ''.obs;
  bool passwordVisibility = false;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;

  void changeFullName(String v) => fullName(v);

  void changeYourId(String v) => yourId(v);

  void changeNumberOfYourId(String v) => numberOfYourId(int.parse(v));

  void changeRadioValue(int v) {
    genderRadioValue = v;
    update();
  }

  void addDataOfBirth(DateTime? dateTime) {
    dateOfBirth = dateTime.toString().substring(0, 10);
    update();
  }

  void changePersonalAddress(String v) => personalAddress(v);

  void changeCountry(String v) => country(v);

  void changeCity(String v) => city(v);

  void changeState(String v) => state(v);

  void changePhoneNumber(String v) => phoneNumber(v);

  void changeEmail(String v) => email(v);

  void changePassword(String v) => password(v);

  void changeConfirmPassword(String v) => confirmPassword(v);

  void changeStateOfPasswordVisibility(bool p) {
    passwordVisibility = p;
    update();
  }

  bool validate() {
    final formState = personalInfoFormKey.currentState;
    if (formState!.validate()) {
      formState.save();
      if (dateOfBirth == null || dateOfBirth!.isEmpty) {
        Get.snackbar('Error', 'Your date of birth is empty',
            colorText: ColorManager.white, backgroundColor: ColorManager.error);
        return false;
      } else if (country.isEmpty || state.isEmpty || city.isEmpty) {
        Get.snackbar('Error', 'Your country, state or city is empty',
            colorText: ColorManager.white, backgroundColor: ColorManager.error);
        return false;
      } else {
        if (password == confirmPassword) {
          return true;
        } else {
          Get.snackbar('Error', 'Your confirmPassword is wrong',
              colorText: ColorManager.white,
              backgroundColor: ColorManager.error);
          return false;
        }
      }
    }
    return false;
  }
}
