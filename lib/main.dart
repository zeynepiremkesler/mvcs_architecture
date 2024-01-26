import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvcs_architecture_task/view/home_view.dart';
import 'package:mvcs_architecture_task/view/login/login_view.dart';
import 'package:mvcs_architecture_task/view/splash/splash_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>const SplashView(),
        '/login': (context) => const LoginView(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}