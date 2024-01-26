import 'package:flutter/material.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';
import 'package:mvcs_architecture_task/product/constants/text_constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
   const CustomTextFieldWidget(
      {Key? key,
      required this.onTap,
      required this.labelText,
      required this.controller,
      required this.error,
      required this.globalKey,
      required this.obscureText,
      this.backgroundColor,
      this.borderColor,
      this.textColor,
      this.suffixIcon})
      : super(key: key);

  final bool error;
  final bool obscureText;
  final String labelText;
  final GlobalKey<FormState> globalKey;
  final TextEditingController controller;
  final VoidCallback onTap;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: backgroundColor ?? ColorConstants.white,
          border: Border.all(
              width: 1,
              color: error ? ColorConstants.red : borderColor ??  ColorConstants.grey),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        key: globalKey,
        onTap: onTap,
        obscureText: obscureText,
        controller: controller,
        textInputAction: TextInputAction.next,
        cursorColor: ColorConstants.black,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: TextConstants.textStyle(color:error ? ColorConstants.red :  textColor ?? ColorConstants.black),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        )
      ),
    );
  }
}
