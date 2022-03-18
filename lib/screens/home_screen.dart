import 'package:aksana_getx/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Screen"),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Get.offNamedUntil(Routes.landingScreen, (route) => false);
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
