import 'package:aksana_getx/models/user_model.dart';
import 'package:aksana_getx/network/network_auth.dart';
import 'package:aksana_getx/utils/const.dart';
import 'package:aksana_getx/utils/dialogue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class AuthController extends GetxController {
  bool isPasswordShowing = true;
  String selectedUserType = userTypes.first;
  final authNetwork = NetworkAuth();

  UserModel? currentUser;

  void changeIsPasswordShowing() {
    isPasswordShowing = !isPasswordShowing;
    update();
  }

  void changeDropDownUserType(String type) {
    selectedUserType = type;
    update();
  }

  Future<void> register(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    try {
      showLoadingDailogue(context);
      await authNetwork.register(email: email, password: password);
      UserModel user = UserModel(
          uid: "", email: email, name: name, userType: selectedUserType);
      await authNetwork.addUser(user: user);
      user.uid = FirebaseAuth.instance.currentUser!.uid;
      currentUser = user;
      Navigator.pop(context);
      Get.offAllNamed(Routes.homeScreen);
    } catch (e) {
      Get.snackbar("Error Authenticating", "There was internal error");
      throw e;
    }
  }
}
