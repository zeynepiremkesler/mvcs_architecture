import 'package:flutter/material.dart';
import 'package:mvcs_architecture_task/core/extensions/context_extensions.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';
import 'package:mvcs_architecture_task/product/constants/text_constants.dart';


class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({super.key,required this.onPressed, this.color, required this.title});

  final VoidCallback onPressed;
  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onPressed,
    child:Container(
      width: context.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorConstants.blueDark,
        borderRadius: BorderRadius.circular(10)),
      child: Text(title, style: TextConstants.textStyle(fontSize: 14,color: ColorConstants.white)),
    ),
  );
  }
}
