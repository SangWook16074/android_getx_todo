import 'package:flutter_get_todo/src/service/auth_handler.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

import '../controller/sign_in_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthHandler());
    Get.put(SignInController());
  }
}
