import 'package:aksana_getx/controllers/auth_controller.dart';
import 'package:aksana_getx/controllers/home_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(HomeController());
  }
}
