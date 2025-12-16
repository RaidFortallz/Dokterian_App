import 'package:doct_app/features/auth/data/models/users_model.dart';
import 'package:doct_app/features/auth/domain/entities/users_entity.dart';
import 'package:doct_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase({required this.repository});

  Future<UsersEntity> call({
    required String email,
    required String password,
    required UsersModel user,
  }) {
    return repository.register(email: email, password: password, user: user);
  }
}
