import 'package:flutter/material.dart';
import 'package:flutter_get_todo/src/service/auth_handler.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final RxBool _isLoading = false.obs;

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool get isLoading => _isLoading.value;
  TextEditingController get email => _email;
  TextEditingController get password => _password;

  void register() async {
    if (_email.value.text.trim().isEmpty ||
        _password.value.text.trim().isEmpty) {
      return;
    }
    _isLoading(true);
    AuthHandler.signUp(_email.value.text.trim(), _password.value.text.trim())
        .then((value) {
      _isLoading(false);
    });
  }
}
