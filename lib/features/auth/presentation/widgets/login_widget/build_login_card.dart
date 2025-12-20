import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/features/auth/config/routes/route_names.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/login_controller.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/auth_controller.dart';
import 'package:doct_app/features/auth/presentation/widgets/materials_widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildLoginCard() {
  final authController = Get.find<AuthController>();
  final loginController = Get.find<LoginController>();

  return Container(
    width: 327,
    height: 438,
    decoration: BoxDecoration(
      color: AppColors.wrWhite,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: AppColors.wrTextBlack.withValues(alpha: 0.08),
          blurRadius: 20,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsetsGeometry.all(24.0),
      child: Column(
        children: [
          Material(
            color: AppColors.wrWhite,
            borderRadius: BorderRadius.circular(10.0),
            child: InkWell(
              // btn masuk google
              borderRadius: BorderRadius.circular(10.0),
              splashColor: AppColors.wrGrey.withValues(alpha: 0.1),
              highlightColor: AppColors.wrGrey.withValues(alpha: 0.1),
              onTap: () {},
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.wrGrey.withValues(alpha: 0.3),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google.png"),
                    SizedBox(width: 15),
                    Text(
                      "Masuk dengan Google",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.wrTextBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: AppColors.wrGrey.withValues(alpha: 0.3),
                ),
              ),
              Text(
                "Atau masuk dengan",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.wrGrey,
                ),
              ),
              SizedBox(
                width: 60,
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: AppColors.wrGrey.withValues(alpha: 0.3),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          //textdield 1
          TextfieldWidget(
            controller: loginController.email,
            hintText: "Email",
            height: 46,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16),
          //textdield 2
          TextfieldWidget(
            controller: loginController.password,
            hintText: "Password",
            height: 46,
            isPassword: true,
            obsecureState: loginController.isPasswordHidden,
            onToggle: loginController.togglePassword,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Transform.scale(
                  scale: 0.9,
                  child: Checkbox(
                    value: loginController.rememberMe.value,
                    onChanged: (v) {
                      loginController.toggleRememberMe();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(4.0),
                    ),
                    side: const BorderSide(color: AppColors.wrGrey, width: 1.5),
                    activeColor: AppColors.wrBlue,
                    checkColor: AppColors.wrBody,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              Text(
                "Ingat saya",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.wrGrey,
                ),
              ),
              const Spacer(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: AppColors.wrGrey.withValues(alpha: 0.1),
                  onTap: () {},
                  child: Text(
                    "Lupa Password?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.wrBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.wrBlue,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: AppColors.wrGrey.withValues(alpha: 0.7),
              highlightColor: AppColors.wrGrey.withValues(alpha: 0.3),
              onTap: () => loginController.submitLogin(authController),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.wrWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Belum punya akun?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.wrGrey,
                ),
              ),
              SizedBox(width: 8),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: AppColors.wrGrey.withValues(alpha: 0.1),
                  onTap: () => Get.toNamed(RouteNames.register),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.wrBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
