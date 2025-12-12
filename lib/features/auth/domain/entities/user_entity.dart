class UserEntity {
  String email;
  String username;
  String password;

  UserEntity({
    required this.email,
    required this.username,
    required this.password,
  }) {
    if (email.trim().isEmpty || !email.contains("@")) {
      throw Exception('Invalid email');
    }
    if (username.trim().isEmpty) {
      throw Exception('Username tidak boleh kosong');
    }
    if (password.trim().length < 6) {
      throw Exception('Password setidaknya memiliki 6 karakter');
    }
  }
}
