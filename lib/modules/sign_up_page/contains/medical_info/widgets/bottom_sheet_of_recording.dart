import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/color_manager.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:flutter_task/widgets/animated_button_widget/animated_button_widget.dart';
import 'package:get/get.dart';

import '../state_management/medical_info_controller_getx.dart';

class BottomSheetOfRecording extends StatelessWidget {
  BottomSheetOfRecording({Key? key}) : super(key: key);
  final medicalInfoControllerGetx = Get.find<MedicalInfoControllerGetx>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      decoration: const BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s28),
          topRight: Radius.circular(AppSize.s28),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.s40,
          ),
          Container(
            padding: const EdgeInsets.all(AppPadding.p14),
            decoration: const BoxDecoration(
                color: ColorManager.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: ColorManager.lightGreen,
                      offset: Offset(2, 3))
                ]),
            child: const Icon(
              Icons.mic,
              size: 100,
              color: ColorManager.lightGreen,
            ),
          ),
          const SizedBox(
            height: AppSize.s28,
          ),
          Obx(() {
            return AnimatedButtonWidget(
                color: ColorManager.lightGreen,
                onPressed: () => medicalInfoControllerGetx.toggleRecording(),
                child: Text(medicalInfoControllerGetx.recording.value,
                    style:const TextStyle(color: ColorManager.white)
                ));
          }),
          const SizedBox(
            height: AppSize.s28,
          ),
          Obx(() {
            if (medicalInfoControllerGetx.enumRecord.value ==
                Recording.deleteRecording) {
              return AnimatedButtonWidget(
                  color: Colors.red,
                  onPressed: () => medicalInfoControllerGetx.playAudioPlayer(),
                  child: Text(
                    medicalInfoControllerGetx.audioPlayerEnum.value.name,
                    style:const TextStyle(color: ColorManager.white),
                  ));
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }
}
