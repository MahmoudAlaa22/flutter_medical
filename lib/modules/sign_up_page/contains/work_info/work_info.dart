import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:flutter_task/modules/sign_up_page/contains/work_info/const/work_info_text_key.dart';
import 'package:flutter_task/modules/sign_up_page/contains/work_info/widgets/upload_photo.dart';
import 'package:flutter_task/modules/sign_up_page/widgets/title_with_dropdown_button.dart';
import 'package:get/get.dart';

import '../../../../widgets/title_with_text_form_field.dart';
import 'state_management/work_info_controller_getx.dart';
import 'widgets/add_button.dart';
import 'widgets/clinic_info_table.dart';

class WorkInfo extends GetWidget {
  WorkInfo({Key? key}) : super(key: key);
  final workInfoControllerGetx = Get.put(WorkInfoControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: workInfoControllerGetx.workInfoFormKey,
      child: Column(
        children: [
          TitleWithDropdownButton(
              title: WorkInfoTextKey.mainSpeciality,
              value: workInfoControllerGetx.mainSpeciality.value,
              items: workInfoControllerGetx.listMainSpeciality,
              onChanged: (v) => workInfoControllerGetx.changeMainSpeciality(v)),
          TitleWithDropdownButton(
              title: WorkInfoTextKey.subSpeciality,
              value: workInfoControllerGetx.subSpeciality.value,
              items: workInfoControllerGetx.listSubSpeciality,
              onChanged: (v) => workInfoControllerGetx.changeSubSpeciality(v)),
          TitleWithDropdownButton(
              title: WorkInfoTextKey.scientificDegree,
              value: workInfoControllerGetx.scientificDegree.value,
              items: workInfoControllerGetx.listScientificDegree,
              onChanged: (v) =>
                  workInfoControllerGetx.changeScientificDegree(v)),
          TitleWithTextFormField(
            labelText: WorkInfoTextKey.clinicName,
            onSaved: (v) => workInfoControllerGetx.changeClinicName(v),
          ),
          TitleWithTextFormField(
              labelText: WorkInfoTextKey.clinicAddress,
              onSaved: (v) => workInfoControllerGetx.changeClinicAddress(v)),
          TitleWithTextFormField(
            labelText: WorkInfoTextKey.clinicPhone,
            onSaved: (v) => workInfoControllerGetx.changeClinicPhone(v),
            textInputType: TextInputType.phone,
          ),
          AddButton(),
          const ClinicInfoTable(),
          const SizedBox(
            height: AppSize.s12,
          ),
          UploadPhoto(
              title: WorkInfoTextKey.uploadCertificates,
              onTap: () => workInfoControllerGetx.changeUploadCertificates()),
          UploadPhoto(
              title: WorkInfoTextKey.uploadLicense,
              onTap: () => workInfoControllerGetx.changeUploadLicense()),
        ],
      ),
    );
  }
}
