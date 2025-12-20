import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/features/auth/config/routes/route_names.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  var rememberMe = false.obs;

  final isPasswordHidden = true.obs;

  getSuccessMessage(String message) {
    Get.snackbar(
      "Berhasil",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.wrLaserGreen,
      colorText: AppColors.wrWhite,
      margin: EdgeInsets.all(16),
      borderRadius: 12,
      icon: Icon(Icons.verified_rounded, color: AppColors.wrWhite),
      isDismissible: true,
      duration: Duration(seconds: 4),
    );
  }

  getErrorMessage(String message) {
    Get.snackbar(
      "Peringatan",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.wrOrange,
      colorText: AppColors.wrWhite,
      margin: EdgeInsets.all(16),
      borderRadius: 12,
      icon: Icon(Icons.warning_amber_rounded, color: AppColors.wrWhite),
      isDismissible: true,
      duration: Duration(seconds: 2),
    );
  }

  // ingat akun
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  // show/hidden password
  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  // fungsi buat submit login
  Future<void> submitLogin(AuthController authController) async {
    if (!canSubmitLogin()) return;

    await authController.login(
      email: email.text.trim(),
      password: password.text,
    );

    //mapping error ke firbase ke pesan
    if (authController.errorMessage.isNotEmpty) {
      final message = authController.errorMessage.value;

      if (message.contains('user-not-found')) {
        getErrorMessage("Email belum terdaftar");
      } else if (message.contains('wrong-password')) {
        getErrorMessage("Password salah");
      } else if (message.contains('invalid-email')) {
        getErrorMessage("Format email tidak valid");
      } else {
        getErrorMessage("Akun belum terdaftar");
      }
      return;
    }

    getSuccessMessage("Login Berhasil");

    Get.delete<LoginController>();
    Get.offAllNamed(RouteNames.home);
  }

  // fungsi buat validasi form di register
  bool canSubmitLogin() {
    if (!validateEmail()) return false;
    if (!validatePassword()) return false;
    return true;
  }

  bool validateEmail() {
    if (email.text.trim().isEmpty) {
      getErrorMessage("Email harus diisi");
      return false;
    }
    return true;
  }

  bool validatePassword() {
    if (password.text.isEmpty) {
      getErrorMessage("Password harus diisi");
      return false;
    }
    return true;
  }
}
