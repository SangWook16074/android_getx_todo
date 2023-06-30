import 'package:flutter/material.dart';
import 'package:flutter_get_todo/src/components/gredient_button.dart';
import 'package:flutter_get_todo/src/controller/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _title(),
                _input(),
                _button(),
              ]),
        ),
      ),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Sign Up',
          style: TextStyle(
              fontFamily: 'Ubuntu', fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _input() {
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: TextField(
              controller: controller.email,
              decoration: const InputDecoration(
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.email),
              ),
            )),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: TextField(
              controller: controller.password,
              decoration: const InputDecoration(
                hintText: 'password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            )),
      ],
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Obx(
        () => GradientButton(
            onPressed: controller.register,
            width: double.infinity,
            height: 20,
            child: (controller.isLoading) ? _loading() : _resisterText()),
      ),
    );
  }

  Widget _resisterText() {
    return const Text(
      'Resister',
      style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white),
    );
  }

  Widget _loading() {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
}
