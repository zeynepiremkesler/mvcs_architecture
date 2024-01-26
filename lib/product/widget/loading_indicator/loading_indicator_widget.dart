import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvcs_architecture_task/core/extensions/context_extensions.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.black.withOpacity(.45),
      child: Center(
          child: Lottie.asset(
        'assets/lotties/loading.json',
        width: context.width*.5,
        frameRate: FrameRate.max,
        repeat: true,
      )),
    );
  }
}
