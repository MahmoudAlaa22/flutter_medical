import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:get/get.dart';

import '../../../common/const/text_style_manager.dart';

class TitleWithDropdownButton extends StatelessWidget {
  const TitleWithDropdownButton(
      {Key? key,
      required this.title,
      required this.value,
      required this.items,
      required this.onChanged})
      : super(key: key);
  final String title;
  final String value;
  final List<String> items;

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title.tr,
          style: TextStyleManager.lightGreenStyle,
        ),
        const SizedBox(width: AppSize.s14),
        Flexible(
          child:DropdownButton<String>(
            isExpanded: true,
              style: TextStyleManager.lightGreenStyle,
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
              ),
              iconSize: 30,
              value: value,
              items: items
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e.tr),
              ))
                  .toList(),
              onChanged: (String?v)=> onChanged(v!)),
        ),
      ],
    );
  }
}
