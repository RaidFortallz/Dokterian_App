import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/features/auth/presentation/widgets/register_widget/build_regis_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildHeaderRegister() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(width: double.infinity, height: 295, color: AppColors.wrBlue),
      Image.asset("assets/images/Star.png"),
      Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(50, 20, 50, 24),
              child: Column(
                children: [
                  Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColors.wrWhite,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.wrWhite,
                        ),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.wrWhite,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.wrWhite,
                            height: 1.3,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(child: Center(child: BuildRegisterCard(),))
          ],
          
        ),
        
      ),
    ],
  );
}
