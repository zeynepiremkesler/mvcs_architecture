import 'package:flutter/material.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';
import 'package:mvcs_architecture_task/product/constants/image_constants.dart';
import 'package:mvcs_architecture_task/product/constants/text_constants.dart';
import 'package:mvcs_architecture_task/product/widget/button/filled_button_widget.dart';
import 'package:mvcs_architecture_task/product/widget/sized_box/gap.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.onPressed, this.buttonTitle, this.errorText});

  final Null Function() onPressed;
  final String? buttonTitle;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageConstants.alertIcon.toImage,
          const GapWidget(height: 16),
          Text(errorText ?? "Bir Hata Oluştu",
              style: TextConstants.textStyle(
                  fontSize: 20,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w500)),
          const GapWidget(height: 16),
          FilledButtonWidget(
            title: buttonTitle ?? "Yeniden Dene",
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
