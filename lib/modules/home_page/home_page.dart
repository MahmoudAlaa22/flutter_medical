import 'package:flutter/material.dart';
import 'package:flutter_task/modules/home_page/widgets/bottom_sheet_widget.dart';
import 'package:get/get.dart';
import 'contains/settings/settings_page.dart';
import 'state_management/home_page_controller_getx.dart';
import 'widgets/clip_path_widget.dart';
import 'widgets/home_grid_view_widget.dart';
import 'widgets/home_title.dart';
import 'widgets/profile_widget.dart';

class HomePage extends GetWidget {
  HomePage({Key? key}) : super(key: key);
  static const String routeName = "/HomePage";

  final homePageControllerGetx = Get.put(HomePageControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if(homePageControllerGetx.currentButtonSheet.value==1){
          return Stack(
            children: [
              const ClipPathWidget(),
              const HomeTitle(),
               ProfileWidget(),
              HomeGridViewWidget(),
            ],
          );
        }else{
          return const SettingsPage();
        }
      }),
      bottomSheet: const BottomSheetWidget(),
    );
  }
}
