import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add shared_preferences

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check login status once the splash screen is displayed
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      // Delay to show splash screen for a few seconds
      Future.delayed(Duration(seconds: 5), () {
        if (Get.currentRoute == '/') {
          if (isLoggedIn) {
            // Get.offNamed('/control'); // Navigate to dashboard if logged in
            Get.offNamed('/log'); // Navigate to dashboard if logged in
          } else {
            Get.offNamed('/log'); // Navigate to login page if not logged in
          }
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset('assets/lottie/learn.json', width: 500, height: 500),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'HELLO WORLD\n',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Center(
              child: Text(
                    'BY PEART',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
