import 'package:flutter/material.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';


class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key,required this.onTap,  this.color});

  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Icon(Icons.arrow_back, color: color ?? ColorConstants.black),
    ),
  );
  }
}


