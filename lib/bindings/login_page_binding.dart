import 'package:doct_app/controller/auth/login_controller.dart';
import 'package:get/get.dart';

class LoginPageBinding implements Bindings {
 @override
  void dependencies() {
    Get.put(LoginController());
  }
}