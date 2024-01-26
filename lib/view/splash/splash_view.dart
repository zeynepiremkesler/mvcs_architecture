import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvcs_architecture_task/core/provider/auth/auth_provider.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';
import 'package:mvcs_architecture_task/product/constants/image_constants.dart';
import 'package:mvcs_architecture_task/product/constants/string_constants.dart';
import 'package:mvcs_architecture_task/product/constants/text_constants.dart';
import 'package:mvcs_architecture_task/product/widget/sized_box/gap.dart';


class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>{
  @override
  void initState() {
    getInitData();
    super.initState();
  }

  Future<void> getInitData() async {
    Future.delayed(Duration.zero, () async{
       final authController = ref.read(authProvider.notifier);
       bool hasToken = await authController.validationToken();
       if(hasToken){
         Navigator.pushNamed(context, '/home');
       }
       else{
         Navigator.pushNamed(context, '/login');
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstants.appBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageConstants.appIcon.toImage,
            const GapWidget(height: 16),
            Text(StringConstants.appName,style: TextConstants.textStyle(fontSize: 20,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}