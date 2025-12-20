import 'package:doct_app/features/auth/data/models/users_model.dart';
import 'package:doct_app/features/auth/domain/entities/users_entity.dart';
import 'package:doct_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:doct_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;

  AuthController({required this.loginUsecase, required this.registerUsecase});

  //state
  final isLoading = false.obs;
  final user = Rxn<UsersEntity>();
  final errorMessage = ''.obs;

  // login controller
  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await loginUsecase(email: email, password: password);

      user.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  //register controller
  Future<void> register({
    required String namaDepan,
    required String namaBelakang,
    required String email,
    required int tglLahir,
    required int noHp,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final usersModel = UsersModel(
        namaDepan: namaDepan,
        namaBelakang: namaBelakang,
        email: email,
        tglLahir: tglLahir,
        noHp: noHp,
      );

      final result = await registerUsecase(email: email, password: password, user: usersModel);

      user.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
