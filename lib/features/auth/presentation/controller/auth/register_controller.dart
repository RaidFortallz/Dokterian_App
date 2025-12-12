import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  // late TextEditingController birth;
  late TextEditingController password;

  var selectedDate = ''.obs;

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    // birth = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    // birth.dispose();
    password.dispose();
    refresh();
  }

  Future<void> pickDate(context) async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
       selectedDate.value = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }
}
