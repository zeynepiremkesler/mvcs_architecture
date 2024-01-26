import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvcs_architecture_task/core/models/users/user_response_model.dart';
import 'package:mvcs_architecture_task/core/provider/auth/auth_provider.dart';
import 'package:mvcs_architecture_task/core/provider/users/user_provider.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';
import 'package:mvcs_architecture_task/product/constants/string_constants.dart';
import 'package:mvcs_architecture_task/product/constants/text_constants.dart';
import 'package:mvcs_architecture_task/product/widget/button/back_button.dart';
import 'package:mvcs_architecture_task/product/widget/error_widgets/error_widget.dart';
import 'package:mvcs_architecture_task/product/widget/loading_indicator/loading_indicator_widget.dart';

final userDataProvider = FutureProvider<List<UserReponseModel>>((ref) async {
  final userController = ref.read(userProvider);
  return userController.getUsers();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userData = ref.watch(userDataProvider);
    final refreshUserData = ref.refresh(userDataProvider);
    return Scaffold(
      appBar: AppBar(title: Text(StringConstants.usersList,style: TextConstants.textStyle(fontSize: 20,fontWeight: FontWeight.w500)),
      leading: BackButtonWidget(onTap: () async{
        final authController = ref.read(authProvider.notifier);
        await authController.clearToken();
         Navigator.pushNamed(context, '/login');
      },color: ColorConstants.blueDark,)),
      body: userData.when(
        data: (userData) {
          List<UserReponseModel> userList = userData.map((e) => e).toList();
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                decoration: BoxDecoration(border: Border.all(width: 1,color: ColorConstants.blueDark),borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: ListTile(
                  horizontalTitleGap: 10,
                  title: Text(
                    '${userList[index].firstName}  ${userList[index].lastName}',
                    style: TextConstants.textStyle(color: ColorConstants.blueDark,fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${userList[index].email}',
                    style: TextConstants.textStyle(color: ColorConstants.black),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      userList[index].avatar.toString(),
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (error, s) => CustomErrorWidget(onPressed: (){refreshUserData;},),
        loading: () => const LoadingIndicator()
      ),
    );
  }
}
