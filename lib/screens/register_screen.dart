import 'package:aksana_getx/controllers/auth_controller.dart';
import 'package:aksana_getx/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../utils/helper.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final registerFormKey = GlobalKey<FormState>();

  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final nameCon = TextEditingController();
  final emailCon = TextEditingController();
  final passCon = TextEditingController();

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
                  child: Text("Register Page", style: getLoginText()),
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  height: Get.height * 0.7,
                  child: Card(
                    elevation: 5,
                    child: Form(
                      key: registerFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameCon,
                                  validator: ((value) {
                                    if (value == null || value == "") {
                                      return "Name cannot be null";
                                    }
                                    return null;
                                  }),
                                  decoration: const InputDecoration(
                                    label: Text("Enter Name"),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: emailCon,
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
                                GetBuilder<AuthController>(
                                  builder: (value) {
                                    return TextFormField(
                                      controller: passCon,
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
                                            icon: const Icon(
                                                Icons.remove_red_eye)),
                                        label: const Text("Enter Password"),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(width: 1),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Select User Type : "),
                                      GetBuilder<AuthController>(
                                          builder: (value) {
                                        return Flexible(
                                          child: DropdownButton<String>(
                                              value: value.selectedUserType,
                                              items: userTypes
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      child: Text(e),
                                                      value: e,
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                authController
                                                    .changeDropDownUserType(
                                                        value!);
                                              }),
                                        );
                                      }),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (registerFormKey.currentState!.validate()) {
                                authController.register(context,
                                    name: nameCon.text,
                                    email: emailCon.text,
                                    password: passCon.text);
                              }
                            },
                            icon: const Icon(Icons.login),
                            label: const Text("Register"),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Already have an account? Login"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
