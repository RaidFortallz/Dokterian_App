import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:doct_app/utils/input_decoration_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final double? height;
  final double? width;
  final Widget? suffix;
  final bool readOnly;

  final bool isPassword;
  final RxBool? obsecureState;
  final VoidCallback? onToggle;

  const TextfieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.height,
    this.width,
    this.suffix,
    this.readOnly = false,
    this.isPassword = false,
    this.obsecureState,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: isPassword
          ? Obx(() => _buildTextField(obsecureState!.value))
          : _buildTextField(false),
    );
  }

  Widget _buildTextField(bool obscure) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: isPassword ? obsecureState!.value : false,
      autocorrect: false,
      autofocus: false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: AppColors.wrGrey.withValues(alpha: 0.6),
        ),
        enabledBorder: defaultBorder(AppColors.wrGrey.withValues(alpha: 0.3)),
        focusedBorder: defaultBorder(AppColors.wrGrey.withValues(alpha: 0.9)),
        contentPadding: EdgeInsets.symmetric(horizontal: 14),
        suffixIcon: _buildSuffix(),
      ),
    );
  }

  Widget? _buildSuffix() {
    if (!isPassword && suffix == null) return null;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //icon custom
        if (suffix != null) suffix!,

        // icon eye password
        if (isPassword)
          IconButton(
            onPressed: onToggle,
            icon: Icon(
              obsecureState!.value
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
            ),
          ),
      ],
    );
  }
}
