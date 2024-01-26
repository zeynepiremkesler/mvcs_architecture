import 'package:flutter/material.dart';

enum ImageConstants{
  appIcon('app_logo'),
  alertIcon('alert');

  final String value;
  const ImageConstants(this.value);

  String get toPng => 'assets/icon/$value.png';
  Image get toImage => Image.asset(toPng);
}