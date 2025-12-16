import 'package:doct_app/features/auth/data/models/users_model.dart';
import 'package:doct_app/features/auth/domain/entities/users_entity.dart';

abstract class AuthRepository {
  Future<UsersEntity> register({
    required String email,
    required String password,
    required UsersModel user,
  });

  Future<UsersEntity> login({
    required String email,
    required String password,
  });
}