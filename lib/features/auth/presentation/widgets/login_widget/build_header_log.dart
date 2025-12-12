import 'package:doct_app/features/auth/config/colors/color_theme.dart';

import 'package:doct_app/features/auth/presentation/widgets/login_widget/build_login_card.dart';

import 'package:flutter/material.dart';

Widget buildHeaderLogin() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(height: 447, width: double.infinity, color: AppColors.wrBlue),
      Image.asset("assets/images/Star.png"),
      Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 100, 50, 12),
              child: Column(
                children: [
                  Image.asset("assets/images/Vector.png"),
                  SizedBox(height: 24),
                  Text(
                    "Masuk ke Akun Anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.wrWhite,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Masukkan email dan password Anda",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.wrWhite,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(child: Center(child: buildLoginCard())),
          ],
        ),
      ),
    ],
  );
}
