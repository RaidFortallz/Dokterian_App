import 'package:doct_app/features/auth/domain/entities/user_entity.dart';
import 'package:doct_app/features/auth/domain/repository/auth_repository.dart';

class Mockauthrepository implements AuthRepository {
  @override
  Future<String> register({required UserEntity user}) async {
    return 'token';
  }
}

class MockAuthWithErrorRepository implements AuthRepository {
  @override
  Future<String> register({required UserEntity user}) {
    throw Exception('Proses Registrasi Gagal');
  }

}