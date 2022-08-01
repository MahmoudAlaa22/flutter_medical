import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:flutter_task/modules/sign_up_page/contains/work_info/const/work_info_text_key.dart';
import 'package:get/get.dart';

import '../../../widgets/add_button_widget.dart';
import '../state_management/work_info_controller_getx.dart';

class AddButton extends StatelessWidget {
   AddButton({Key? key}) : super(key: key);
final workInfoControllerGetx=Get.find<WorkInfoControllerGetx>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: GestureDetector(
        onTap: (){
          workInfoControllerGetx.addToListOfClinicModel();
        },
        child: Container(
          alignment:Alignment.centerRight ,
          child: Row(
            mainAxisSize:MainAxisSize.min ,
            mainAxisAlignment:MainAxisAlignment.end ,
            children: [
              const AddButtonWidget(),
              const SizedBox(
                width: AppSize.s12,
              ),
              Text(
                WorkInfoTextKey.add.tr,
                style: TextStyleManager.defaultStyle(context).copyWith(
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
