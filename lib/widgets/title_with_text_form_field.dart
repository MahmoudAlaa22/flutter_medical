import 'package:flutter/material.dart';
import 'package:flutter_task/common/const/text_style_manager.dart';
import 'package:flutter_task/common/const/values_manager.dart';
import 'package:flutter_task/widgets/text_form_field_widget.dart';
import 'package:get/get.dart';

class TitleWithTextFormField extends StatelessWidget {
  TitleWithTextFormField(
      {Key? key,
      required this.labelText,
      this.obscureText = false,
      this.onSaved,
      this.textInputType = TextInputType.text,
      this.maxLines = 1,
      this.suffixIcon})
      : super(key: key);
  final String labelText;
  final bool obscureText;
  final Function(String)? onSaved;

  final TextInputType textInputType;
  final int maxLines;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Row(
        children: [
          Text(
            labelText.tr,
            style: TextStyleManager.lightGreenStyle,
          ),
          const SizedBox(
            width: AppSize.s12,
          ),
          TextFormFieldWidget(
            obscureText: obscureText,
            maxLines: maxLines,
            onSaved: onSaved!,
            textInputType: textInputType,
            suffixIcon: suffixIcon,
            // onChanged:onChanged ,
          ),
        ],
      ),
    );
  }
}
