import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mvcs_architecture_task/core/extensions/context_extensions.dart';
import 'package:mvcs_architecture_task/core/extensions/string_extensions.dart';
import 'package:mvcs_architecture_task/core/models/auth/login/login_request_model.dart';
import 'package:mvcs_architecture_task/core/provider/auth/auth_provider.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';
import 'package:mvcs_architecture_task/product/widget/button/filled_button_widget.dart';
import 'package:mvcs_architecture_task/product/widget/loading_indicator/loading_indicator_widget.dart';
import 'package:mvcs_architecture_task/product/widget/sized_box/gap.dart';
import 'package:mvcs_architecture_task/product/widget/textfield/custom_textfield_widget.dart';
import 'package:mvcs_architecture_task/product/widget/toast/toast_widget.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {


  ScrollController scrollController = ScrollController();

  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> scrollToEmail = GlobalKey();
  bool _emailError = false;


  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> scrollToPassword = GlobalKey();
  bool _passwordError = false;


  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Lottie.asset('assets/lotties/welcome.json', height: context.height*.4, width: context.width),
              
                  CustomTextFieldWidget(
                    error: _emailError,
                    obscureText: false,
                    labelText: "Email Adresi",
                    controller: _emailController,
                    backgroundColor: ColorConstants.transparent,
                    borderColor: ColorConstants.blueDark,
                    textColor: ColorConstants.blueDark,
                    onTap: () {
                      setState(() {
                        _emailError = false;
                      });
                    },
                    globalKey: scrollToEmail,
                  ),
              
                  const GapWidget(height: 16),
              
                  CustomTextFieldWidget(
                  error: _passwordError,
                  obscureText: true,
                  labelText: "Şifre",
                  controller: _passwordController,
                  backgroundColor: ColorConstants.transparent,
                  borderColor: ColorConstants.blueDark,
                  textColor: ColorConstants.blueDark,
                  onTap: () {
                    setState(() {
                      _passwordError = false;
                    });
                  },
                    globalKey: scrollToPassword,
                  ),
        
                  const GapWidget(height: 16),
                  FilledButtonWidget(
                    title:"Giriş Yap",
                    onPressed: ()async{
                      setState(() {
                        _isLoading = true;
                      });

                      await checkErrors();
        
                      if(!_emailError && !_passwordError){
                        LoginRequestModel loginRequestModel = LoginRequestModel();
                        loginRequestModel.email = _emailController.text;
                        loginRequestModel.password = _passwordController.text;
                        
                        final authController = ref.read(authProvider.notifier);
                        await authController.loginUser(loginRequestModel);
                        final authManager = ref.read(authManagerProvider);
                        final token = authManager.token;
                        if(token != null){
                          Navigator.pushNamed(context, '/home');
                        }
                      }  

                      setState(() {
                        _isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        _isLoading ? const LoadingIndicator() : Container()
      ],
    );
  }

  Future<void> navigateError() async {
    if (_emailError) {
      scrollController.position.ensureVisible(
        scrollToEmail.currentContext!.findRenderObject()!,
        alignment: 0.5,
        duration: const Duration(seconds: 1),
      );
    } else if (_passwordError) {
      scrollController.position.ensureVisible(
        scrollToPassword.currentContext!.findRenderObject()!,
        alignment: 0.5,
        duration: const Duration(seconds: 1),
      );
    } 
  }

  Future<void> checkErrors() async {
    if (_emailController.text == "" || _emailController.text.isEmpty) {
      _emailError = true;
    }

    if (_passwordController.text == "" || _passwordController.text.isEmpty) {
      _passwordError = true;
    }


    else if (!_emailController.text.isValidEmail()) {
     _emailError = true;
     ToastWidget.showToast("Geçerli Bir Email Adresi Giriniz!");
    }

    setState(() {});
    await navigateError();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
