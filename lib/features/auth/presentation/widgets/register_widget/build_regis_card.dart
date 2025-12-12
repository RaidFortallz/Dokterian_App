import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/register_controller.dart';
import 'package:doct_app/features/auth/presentation/widgets/materials_widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildRegisterCard extends StatelessWidget {
  final controller = Get.find<RegisterController>();
   BuildRegisterCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              Obx(
                () => TextfieldWidget(
                  hintText: "Tanggal Lahir",
                  controller: TextEditingController(text: controller.selectedDate.value),
                  suffix: GestureDetector(
                    onTap: () => controller.pickDate(context),
                    child: Image.asset("assets/images/calendar.png"),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextfieldWidget(hintText: "Password"),
              SizedBox(height: 24),
              Material(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.wrBlue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  splashColor: AppColors.wrGrey.withValues(alpha: 0.9),
                  onTap: () {},
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
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
              Material(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.wrWhite,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  splashColor: AppColors.wrGrey.withValues(alpha: 0.1),
                  highlightColor: AppColors.wrGrey.withValues(alpha: 0.1),
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: AppColors.wrGrey.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png"),
                        SizedBox(width: 10),
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
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }
}


  

  

