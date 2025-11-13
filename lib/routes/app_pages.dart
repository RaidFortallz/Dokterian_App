import 'package:doct_app/bindings/login_page_binding.dart';
import 'package:doct_app/pages/auth/login_page.dart';
import 'package:doct_app/pages/auth/register_page.dart';
import 'package:doct_app/routes/route_names.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(name: RouteNames.register, page: () => RegisterPage()),
  ];
}
