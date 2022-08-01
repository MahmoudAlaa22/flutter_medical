import 'dart:developer';

import 'package:flutter_task/common/assets/images.dart';
import 'package:flutter_task/modules/home_page/const/home_page_text_key.dart';
import 'package:get/get.dart';

import '../../sign_up_page/contains/personal_info/state_management/personal_info_controller_getx.dart';
import '../../sign_up_page/state_management/sign_up_controller_getx.dart';
import '../model/home_model.dart';

class HomePageControllerGetx extends GetxController {
  RxInt currentButtonSheet = 1.obs;
  RxString? image=''.obs;
  RxString? name=''.obs;


  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData()async{
    final personalInfoControllerGetx = Get.find<PersonalInfoControllerGetx>();
    final signUpControllerGetx = Get.find<SignUpControllerGetx>();
    image!(signUpControllerGetx.filePathImage.value);
    name!(personalInfoControllerGetx.fullName.value);
  }
  List<HomeModel> listOfHomeModel = [
    HomeModel(
      title: HomePageTextKey.dashboard,
      image: AppImages.dashboard,
    ),
    HomeModel(
      title: HomePageTextKey.clinical,
      image: AppImages.clinical,
    ),
    HomeModel(
      title: HomePageTextKey.ovr,
      image: AppImages.deleteShield,
    ),
    HomeModel(
      title: HomePageTextKey.staffRisk,
      image: AppImages.staffRisk,
    ),
    HomeModel(
      title: HomePageTextKey.pcraIcra,
      image: AppImages.pcraICRA,
    ),
    HomeModel(
      title: HomePageTextKey.kpis,
      image: AppImages.barChart,
    ),
  ];

  void changeCurrentButtonSheet(int v) {
    currentButtonSheet(v);
  }
}
