import 'package:doct_app/features/auth/config/bindings/auth_binding.dart';
import 'package:doct_app/features/auth/presentation/pages/auth/login_page.dart';
import 'package:doct_app/features/auth/presentation/pages/auth/register_page.dart';
import 'package:doct_app/features/auth/config/routes/route_names.dart';
import 'package:doct_app/features/auth/presentation/pages/home/home_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(name: RouteNames.home, page: () => HomePage(),),
  ];
}
