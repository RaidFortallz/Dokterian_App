import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/login_controller.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/auth_controller.dart';

import 'package:doct_app/features/auth/presentation/widgets/login_widget/build_header_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final loginController = Get.find<LoginController>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.wrBody,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [

                // header & card body login
                buildHeaderLogin(), 
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
