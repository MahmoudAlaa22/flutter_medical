import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:get/get.dart';

import '../../../common/const/values_manager.dart';
import '../state_management/home_page_controller_getx.dart';

class HomeGridViewWidget extends StatelessWidget {
  HomeGridViewWidget({Key? key}) : super(key: key);
  final homePageControllerGetx = Get.find<HomePageControllerGetx>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: AppPadding.p300, bottom: AppPadding.p100),
      child: GridView.count(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p12),
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 1.3,
        physics: const BouncingScrollPhysics(),
        children: homePageControllerGetx.listOfHomeModel
            .map((e) => Container(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(AppSize.s14),
                    boxShadow:  [
                      BoxShadow(
                        blurRadius: 5,
                        color: Theme.of(context).shadowColor
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        e.image,
                        height: 50,
                      ),
                      Text(
                        e.title.tr,
                        style: TextStyleManager.defaultStyle(context)
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
