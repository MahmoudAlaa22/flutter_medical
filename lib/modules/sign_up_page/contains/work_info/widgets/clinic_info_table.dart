import 'package:flutter/material.dart';
import 'package:flutter_task/modules/sign_up_page/contains/work_info/const/work_info_text_key.dart';
import 'package:flutter_task/modules/sign_up_page/contains/work_info/state_management/work_info_controller_getx.dart';
import 'package:get/get.dart';

class ClinicInfoTable extends StatelessWidget {
  const ClinicInfoTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style=Theme.of(context).textTheme.bodyText2;
    return GetX<WorkInfoControllerGetx>(builder: (controller) {
      final list = controller.listOfClinicModel;
      if (list!.isNotEmpty) {
        return DataTable(
          horizontalMargin: 0,
            columnSpacing: 20,
            columns:  [
          DataColumn(
            label: Text(WorkInfoTextKey.clinicName.tr,style: style,),
          ),
          DataColumn(
            label: Text(WorkInfoTextKey.clinicAddress.tr,style: style),
          ),
          DataColumn(
            label: Text(WorkInfoTextKey.clinicPhone.tr,style: style),
          ),
        ], rows: [
          for (var e in list)
            DataRow(cells: [
              DataCell(
                Text(e.name!,style: style),
              ),
              DataCell(
                Text(e.address!,style: style),
              ),
              DataCell(
                Text('${e.phone!}',style: style),
              ),
            ]),
        ]);
      }

      return const SizedBox();
    });
  }
}
