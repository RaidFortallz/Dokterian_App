import 'package:doct_app/routes/app_pages.dart';
import 'package:doct_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dokterian',
      theme: ThemeData(fontFamily: "Poppins"),
      darkTheme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.login,
      getPages: AppPages.pages,
    );
  }
}
