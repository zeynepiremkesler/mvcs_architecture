import 'package:flutter/material.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';

class TextConstants {
  const TextConstants._();

  static TextStyle textStyle({Color? color,double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(fontSize:fontSize ?? 12, color: color ?? ColorConstants.blueDark, fontWeight: fontWeight);
  }
}
