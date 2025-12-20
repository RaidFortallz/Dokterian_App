import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doct_app/features/auth/data/data_sources/auth_firebase_datasource.dart';
import 'package:doct_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:doct_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doct_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:doct_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/login_controller.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/register_controller.dart';
import 'package:doct_app/features/auth/presentation/controller/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    //firebase
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance);

    //data layer/ data_source
    Get.lazyPut<AuthFirebaseDatasource>(
      () => AuthFirebaseDatasourceImpl(auth: Get.find(), firestore: Get.find()),
    );

    //domain layer/ repository
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(datasource: Get.find()),
    );

    //usecases
    Get.lazyPut(() => LoginUsecase(repository: Get.find()));
    Get.lazyPut(() => RegisterUsecase(repository: Get.find()));

    //controller
    Get.lazyPut(
      () =>
          AuthController(loginUsecase: Get.find(), registerUsecase: Get.find()),
    );

    //login controller
    Get.lazyPut(() => LoginController());
    //register controller
    Get.lazyPut(() => RegisterController());
  }
}
