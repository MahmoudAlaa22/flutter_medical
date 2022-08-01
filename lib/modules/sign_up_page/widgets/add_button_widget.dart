import 'package:flutter/material.dart';

import '../../../common/const/values_manager.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
      child: const Icon(Icons.add, color: Colors.white,size: 30,),
    );
  }
}
