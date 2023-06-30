import 'package:flutter_get_todo/src/controller/sign_in_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
