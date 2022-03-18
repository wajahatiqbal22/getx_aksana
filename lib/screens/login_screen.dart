import 'package:aksana_getx/controllers/auth_controller.dart';
import 'package:aksana_getx/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../routes/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final loginFormKey = GlobalKey<FormState>();

  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Login Page",
                    style: getLoginText(),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  height: Get.height * 0.6,
                  child: Card(
                    elevation: 5,
                    child: Form(
                      key: loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: ((value) {
                                    if (emailRegex.hasMatch(value!)) {
                                      return null;
                                    } else {
                                      return "Enter valid email";
                                    }
                                  }),
                                  decoration: const InputDecoration(
                                    label: Text("Enter Email"),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GetBuilder<AuthController>(builder: (value) {
                                  return TextFormField(
                                    validator: (value) {
                                      if (value!.length < 6) {
                                        return "Password must be 6 characters";
                                      }
                                      return null;
                                    },
                                    obscureText: value.isPasswordShowing,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            authController
                                                .changeIsPasswordShowing();
                                          },
                                          icon:
                                              const Icon(Icons.remove_red_eye)),
                                      label: const Text("Enter Password"),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(width: 1),
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (loginFormKey.currentState!.validate()) {}
                            },
                            icon: const Icon(Icons.login),
                            label: const Text("Login"),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.registerScreen);
                              },
                              child:
                                  const Text("Dont have an account? Register")),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
