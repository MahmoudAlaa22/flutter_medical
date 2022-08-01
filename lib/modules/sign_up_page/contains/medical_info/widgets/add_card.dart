import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:get/get.dart';

import '../../../../../common/const/text_style_manager.dart';

class AddCard extends StatelessWidget {
  const AddCard({Key? key, required this.title, required this.onDelete})
      : super(key: key);
  final String title;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p4),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p4),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(AppSize.s8),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(2, 3),
                  color: Theme.of(context).shadowColor)
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(onTap: ()=>onDelete(), child: const Icon(Icons.close_sharp)),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              title.tr,
              style: TextStyleManager.defaultStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
