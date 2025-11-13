import 'package:doct_app/colors/color_theme.dart';
import 'package:doct_app/utils/input_decoration_utils.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final double? height;
  final double? width;

  const TextfieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: AppColors.wrGrey.withValues(alpha: 0.6),
          ),
          enabledBorder: defaultBorder(AppColors.wrGrey.withValues(alpha: 0.3)),
          focusedBorder: defaultBorder(AppColors.wrGrey.withValues(alpha: 0.9)),
          contentPadding: EdgeInsets.symmetric(horizontal: 14)
        ),
      ),
    );
  }
}
