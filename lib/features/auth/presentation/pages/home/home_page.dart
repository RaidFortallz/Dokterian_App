import 'package:doct_app/features/auth/config/colors/color_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("TEST", style: TextStyle(color: AppColors.wrTextBlack, fontSize: 30),),),
    );
  }
}