import 'package:aksana_getx/controllers/auth_controller.dart';
import 'package:aksana_getx/screens/home_screen.dart';
import 'package:aksana_getx/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
