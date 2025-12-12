import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/register_controller.dart';
import 'package:doct_app/features/auth/presentation/widgets/register_widget/build_header_reg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final controller = Get.find<RegisterController>();
   RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.wrBlue,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Image.asset("assets/images/arrow_left.png"),
          ),
        ),
       
      ),
      body: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(children: [buildHeaderRegister()]),
          ),
        ),
      ),
    );
  }
}
