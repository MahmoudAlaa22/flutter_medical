import 'package:flutter/material.dart';

import '../../../common/const/color_manager.dart';
import 'custom_clip_path.dart';

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            height: 300,
            color: ColorManager.darkGreen,
          ),
        ),
        ClipPath(
          clipper: CustomClipPath(margin: 20),
          child: Container(
            height: 300,
            color: ColorManager.lightGreen,
          ),
        ),
      ],
    );
  }
}
