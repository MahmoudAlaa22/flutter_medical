import 'package:flutter/material.dart';
import 'package:flutter_task/modules/sign_up_page/contains/medical_info/const/mediacl_info_text_key.dart';
import 'package:flutter_task/modules/sign_up_page/contains/medical_info/widgets/card_info_widget.dart';
import 'package:get/get.dart';

import '../../../../common/const/values_manager.dart';
import 'state_management/medical_info_controller_getx.dart';
import 'widgets/add_card.dart';
import 'widgets/bottom_sheet_of_recording.dart';
import 'widgets/describe_condition_by_voice_and_video.dart';

class MedicalInfo extends GetWidget {
  MedicalInfo({Key? key}) : super(key: key);
  final medicalInfoControllerGetx = Get.put(MedicalInfoControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardInfoWidget(
            index: 0,
            title: MedicalInfoTextKey.pleaseAddDiagnosisIfAny,
            onSaved: (v) => medicalInfoControllerGetx.changeDiagnosis(v),
            onTap: () =>
                medicalInfoControllerGetx.addToListOfDiagnosis(0)
        ),
        Obx(() {
          return Wrap(
            children: medicalInfoControllerGetx.listOfDiagnosis
                .map((e) =>
                AddCard(
                  title: e,
                  onDelete: () =>
                      medicalInfoControllerGetx.deleteItemOfDiagnosis(e),
                ))
                .toList(),
          );
        }),
        CardInfoWidget(
            index: 1,
            title: MedicalInfoTextKey.pleaseAddPreviousOperationsIfAny,
            onSaved: (v) =>
                medicalInfoControllerGetx.changePreviousOperations(v),
            onTap: () =>
                medicalInfoControllerGetx.addToListOfPreviousOperations(1)),
        Obx(() {
          return Wrap(
            children: medicalInfoControllerGetx.listOfPreviousOperations
                .map((e) =>
                AddCard(
                  title: e,
                  onDelete: () =>
                      medicalInfoControllerGetx
                          .deleteItemOfPreviousOperations(e),
                ))
                .toList(),
          );
        }),
        CardInfoWidget(
            index: 2,
            title: MedicalInfoTextKey.pleaseAddMedicationsIfAny,
            onSaved: (v) => medicalInfoControllerGetx.changeMedications(v),
            onTap: () => medicalInfoControllerGetx.addToListOfMedications(2)),
        Obx(() {
          return Wrap(
            children: medicalInfoControllerGetx.listOfMedications
                .map((e) =>
                AddCard(
                  title: e,
                  onDelete: () =>
                      medicalInfoControllerGetx.deleteItemOfMedications(e),
                ))
                .toList(),
          );
        }),
        const SizedBox(
          height: AppSize.s12,
        ),
        GestureDetector(
          onTap: () => medicalInfoControllerGetx.changeVideoPath(),
          child: const DescribeConditionByVoiceAndVideo(
            title: MedicalInfoTextKey.describeYourConditionByVideo,
            iconData: Icons.videocam_sharp,
          ),
        ),
        const SizedBox(
          height: AppSize.s12,
        ),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(BottomSheetOfRecording(),
                isScrollControlled: true
            );
          },
          child: const DescribeConditionByVoiceAndVideo(
            title: MedicalInfoTextKey.describeYourConditionByVoice,
            iconData: Icons.mic,
          ),
        ),
      ],
    );
  }
}
