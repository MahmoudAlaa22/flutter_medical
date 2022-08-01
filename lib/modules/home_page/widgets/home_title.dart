
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/modules/home_page/const/home_page_text_key.dart';
import 'package:get/get.dart';

import '../../../common/assets/images.dart';
import '../../../common/const/text_style_manager.dart';
import '../../../common/const/values_manager.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale == const Locale('en') ? false : true;

    return Padding(
      padding:
          const EdgeInsets.only(top: AppPadding.p120, left: AppPadding.p20),
      child: Row(
        mainAxisAlignment:
            isArabic ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            alignment:Alignment.center ,
            width: 100,
            height: 100,
            child: AutoSizeText(
              HomePageTextKey.home.tr,
              style: TextStyleManager.defaultStyle(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Image.asset(AppImages.parachute)
        ],
      ),
    );
  }
}
