import 'package:doct_app/features/auth/domain/entities/users_entity.dart';
import 'package:doct_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  Future<UsersEntity> call({required String email, required String password}) {
    return repository.login(email: email, password: password);
  }
}
