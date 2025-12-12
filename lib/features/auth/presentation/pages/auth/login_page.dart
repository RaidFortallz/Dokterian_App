import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/login_controller.dart';

import 'package:doct_app/features/auth/presentation/widgets/login_widget/build_header_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.find<LoginController>();
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
                buildHeaderLogin(), //buildHeader & buildLoginCard
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
