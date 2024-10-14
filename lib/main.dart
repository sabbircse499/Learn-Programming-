import 'package:flutter/material.dart';
import 'home.dart';
import 'splash.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'package:learn_program/control/control.dart';
import 'package:learn_program/layout/contest/lang_list.dart';
import 'package:learn_program/layout/leaderboard/leaderboard.dart';
import 'registration.dart';
import 'package:learn_program/layout/faq.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/home', page: () => home()),

        GetPage(name: '/log', page: () => LoginPage()),
        GetPage(name: '/reg', page: () => RegisterScreen()),

        GetPage(name: '/control', page: () => control()),
        GetPage(name: '/quizhome', page: () => langlist()),
        GetPage(name: '/leaderboard', page: () => Leaderboard()),
        GetPage(name: '/faq', page: () => faq()),



      ],
    );
  }
}
