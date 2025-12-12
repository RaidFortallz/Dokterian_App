import 'package:doct_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/repository/MockAuthRepository.dart';

void main() {
  group('Register Test', () {
    late RegisterUsecase registerUsecase;
    late RegisterUsecase registerWithErrorUsecase;

    setUp(() {
      registerUsecase = RegisterUsecase(authRepository: Mockauthrepository());
      registerWithErrorUsecase = RegisterUsecase(
        authRepository: MockAuthWithErrorRepository(),
      );
    });

    //test 1
    test('Register harus sukses dan mengembalikan token', () async {
      final String email = "test@gmail.com";
      final String username = "test";
      final String password = "password";

      final result = await registerUsecase.call(
        email: email,
        username: username,
        password: password,
      );

      expect(result, 'token');
    });

    //test 2
    test('Register harus gagal ketika email kosong', () async {
      final String email = "";
      final String username = "test";
      final String password = "password";

      expect(
        () async => await registerUsecase.call(
          email: email,
          username: username,
          password: password,
        ),
        throwsA(isA<Exception>()),
      );
    });

    //test 3
    test('Register harus gagal ketika email tidak valid', () async {
      final String email = "test12";
      final String username = "test";
      final String password = "password";

      expect(
        () async => await registerUsecase.call(
          email: email,
          username: username,
          password: password,
        ),
        throwsA(isA<Exception>()),
      );
    });

    //test 4
    test(
      'Register harus gagal ketika password kurang dari 6 karakter',
      () async {
        final String email = "test@gmail.com";
        final String username = "test";
        final String password = "pass";

        RegisterUsecase registerUsecase = RegisterUsecase(
          authRepository: Mockauthrepository(),
        );

        expect(
          () async => await registerUsecase.call(
            email: email,
            username: username,
            password: password,
          ),
          throwsA(isA<Exception>()),
        );
      },
    );

    //test 5
    test('Register harus gagal ketika username kosong', () async {
      final String email = "test@gmail.com";
      final String username = "";
      final String password = "password";

      expect(
        () async => await registerUsecase.call(
          email: email,
          username: username,
          password: password,
        ),
        throwsA(isA<Exception>()),
      );
    });

    //test 6
    test('Register harus gagal ketika username kosong', () async {
      final String email = "test@gmail.com";
      final String username = "test";
      final String password = "password";

      expect(
        () async => await registerWithErrorUsecase.call(
          email: email,
          username: username,
          password: password,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
