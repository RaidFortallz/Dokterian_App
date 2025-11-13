import 'package:doct_app/colors/color_theme.dart';
import 'package:doct_app/widgets/register_widget/build_header_reg.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.wrBlue,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsetsGeometry.only(right: 10),
              // child: Image.asset("assets/images/arrow_left.png"),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeaderRegister(),
              ],
            ),
          ),
        ),),
    );
  }
}
