import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/features/auth/config/routes/route_names.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController tglLahir;
  late TextEditingController noHp;
  late TextEditingController password;

  var selectedDate = Rx<DateTime?>(null);

  final isPassowrdHidden = true.obs;

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    tglLahir = TextEditingController();
    noHp = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  void getSuccessMessage(String message) {
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

  void getErrorMessage(String message) {
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

  // show/hidden password
  void togglePassword() {
    isPassowrdHidden.value = !isPassowrdHidden.value;
  }

  Future<void> pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      tglLahir.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  int getTglLahir() {
    if (selectedDate.value == null) {
      throw Exception("Tanggal lahir belum di pilih");
    }
    return selectedDate.value!.millisecondsSinceEpoch;
  }

  int getNoHp() {
    final parsed = int.tryParse(noHp.text);
    if (parsed == null) {
      throw Exception("Nomor HP tidak valid");
    }
    return parsed;
  }

  // fungsi buat submit register
  Future<void> submitRegister(AuthController authController) async {
    if (!canSubmitRegister()) return;

    try {
      await authController.register(
        namaDepan: firstName.text,
        namaBelakang: lastName.text,
        email: email.text,
        tglLahir: getTglLahir(),
        noHp: getNoHp(),
        password: password.text,
      );

      getSuccessMessage("Registrasi berhasil, silahkan login");

      Get.delete<RegisterController>();
      Get.offAllNamed(RouteNames.login);
    } catch (e) {
      getErrorMessage(e.toString());
    }
  }

  // fungsi buat validasi form di register
  bool canSubmitRegister() {
    if (!validateName()) return false;
    if (!validateEmail()) return false;
    if (!validateBirth()) return false;
    if (!validateNoHp()) return false;
    if (!validatePassword()) return false;

    return true;
  }

  bool validateName() {
    if (firstName.text.trim().isEmpty) {
      getErrorMessage("Nama depan harus diisi");
      return false;
    }

    if (lastName.text.trim().isEmpty) {
      getErrorMessage("Nama belakang harus diisi");
      return false;
    }
    return true;
  }

  bool validateEmail() {
    final value = email.text.trim();

    if (value.isEmpty) {
      getErrorMessage("Email harus diisi");
      return false;
    }
    if (!value.contains("@")) {
      getErrorMessage("Email tidak valid");
      return false;
    }
    return true;
  }

  bool validateBirth() {
    if (selectedDate.value == null) {
      getErrorMessage("Tanggal lahir harus dipilih");
      return false;
    }
    return true;
  }

  bool validateNoHp() {
    if (noHp.text.trim().isEmpty) {
      getErrorMessage("No HP harus diisi");
      return false;
    }
    return true;
  }

  bool validatePassword() {
    final value = password.text;

    if (value.isEmpty) {
      getErrorMessage("Password harus diisi");
      return false;
    }
    if (value.length < 6) {
      getErrorMessage("Password minimal 6 karakter");
      return false;
    }
    return true;
  }
}
