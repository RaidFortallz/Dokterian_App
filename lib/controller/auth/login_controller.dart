import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  var rememberMe = false.obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    email.dispose();
    password.dispose();
    refresh();
  }
}