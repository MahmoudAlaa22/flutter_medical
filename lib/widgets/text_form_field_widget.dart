import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/const/color_manager.dart';
import '../common/const/text_style_manager.dart';
import '../common/const/values_manager.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {Key? key,
      this.obscureText = false,
      required this.onSaved,
      this.textInputType = TextInputType.text,
      this.maxLines = 1,
      this.suffixIcon})
      : super(key: key);
  final bool obscureText;
  final Function(String) onSaved;

  final TextInputType textInputType;
  final int maxLines;
  Widget? suffixIcon;

  InputBorder _inputBorder({Color color = ColorManager.lightGreen}) {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(AppSize.s14));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        style: TextStyleManager.defaultStyle(context),
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            focusedBorder: _inputBorder(),
            enabledBorder: _inputBorder(),
            errorBorder: _inputBorder(color: ColorManager.error),
            focusedErrorBorder: _inputBorder(color: ColorManager.error)),
        keyboardType: textInputType,
        obscureText: obscureText,
        onSaved: (v) {
          onSaved(v!);
        },
        validator: (v) {
          if (v!.isEmpty) {
            return "You should not make this field empty";
          } else {
            if (textInputType == TextInputType.number) {
              if (!v.isNumericOnly) {
                return "It should contain numbers only";
              }
            } else if (textInputType == TextInputType.emailAddress) {
              if (!v.isEmail) {
                return "Your email is wrong.";
              }
            }
          }
          return null;
        },
        maxLines: maxLines,
      ),
    );
  }
}
