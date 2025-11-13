import 'package:doct_app/colors/color_theme.dart';
import 'package:doct_app/widgets/materials_widget/textfield_widget.dart';
import 'package:flutter/material.dart';

Widget buildRegisterCard() {
  return Container(
    width: 327,
    height: 486,
    decoration: BoxDecoration(
      color: AppColors.wrWhite,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextfieldWidget(
                    hintText: "Nama Depan",
                    width: 131,
                    height: 46,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  TextfieldWidget(
                    hintText: "Nama Belakang",
                    width: 131,
                    height: 46,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextfieldWidget(
                hintText: "Email",
                height: 46,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 16),
              TextfieldWidget(hintText: "Tanggal Lahir"),
              SizedBox(height: 16),
              TextfieldWidget(hintText: "Password"),
              SizedBox(height: 24),
              Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.wrBlue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.wrWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 110,
                    child: Divider(
                      thickness: 1,
                      color: AppColors.wrGrey.withValues(alpha: 0.2),
                    ),
                  ),
                  Text(
                    "Atau",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.wrGrey,
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: Divider(
                      thickness: 1,
                      color: AppColors.wrGrey.withValues(alpha: 0.2),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.wrWhite,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: AppColors.wrGrey.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google.png"),
                    SizedBox(width: 10,),
                    Text(
                      "Masuk Dengan Google",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.wrTextBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
