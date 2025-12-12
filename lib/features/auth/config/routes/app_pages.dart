import 'package:doct_app/features/auth/presentation/bindings/login_page_binding.dart';
import 'package:doct_app/features/auth/presentation/bindings/register_page_binding.dart';
import 'package:doct_app/features/auth/presentation/pages/auth/login_page.dart';
import 'package:doct_app/features/auth/presentation/pages/auth/register_page.dart';
import 'package:doct_app/features/auth/config/routes/route_names.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => RegisterPage(),
      binding: RegisterPageBinding(),
    ),
  ];
}
