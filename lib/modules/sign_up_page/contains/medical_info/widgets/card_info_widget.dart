import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:get/get.dart';
import '../../../widgets/add_button_widget.dart';
import '../state_management/medical_info_controller_getx.dart';

class CardInfoWidget extends StatelessWidget {
  CardInfoWidget(
      {Key? key,
      required this.title,
      required this.index,
      required this.onTap,
      required this.onSaved})
      : super(key: key);
  final String title;
  final int index;
  final Function onTap;
  final Function(String) onSaved;
  final medicalInfoControllerGetx = Get.find<MedicalInfoControllerGetx>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: medicalInfoControllerGetx.listOfKey[index],
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s14)),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    hintText: title.tr,
                    border: InputBorder.none,
                  ),
                  onSaved: (v) => onSaved(v!),
                  validator: (v){
                    if(v!.isEmpty){
                      return 'You should not make this field empty';
                    }
                    return null;
                  },
                ),
              ),
              GestureDetector(
                  onTap: () => onTap(), child: const AddButtonWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
