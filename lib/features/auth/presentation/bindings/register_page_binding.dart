import 'package:doct_app/features/auth/presentation/controller/auth/register_controller.dart';
import 'package:get/get.dart';

class RegisterPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}