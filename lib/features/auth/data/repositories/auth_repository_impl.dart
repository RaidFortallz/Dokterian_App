import 'package:doct_app/features/auth/data/data_sources/auth_firebase_datasource.dart';
import 'package:doct_app/features/auth/data/models/users_model.dart';
import 'package:doct_app/features/auth/domain/entities/users_entity.dart';
import 'package:doct_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<UsersEntity> login({
    required String email,
    required String password,
  }) async {
    final result = await datasource.login(email: email, password: password);

    return result.toEntity();
  }

  @override
  Future<UsersEntity> register({
    required String email,
    required String password,
    required UsersModel user,
  }) async {
    final result = await datasource.register(
      email: email,
      password: password,
      user: user,
    );

    return result.toEntity();
  }
}
