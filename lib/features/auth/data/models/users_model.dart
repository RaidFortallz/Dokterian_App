import 'package:doct_app/features/auth/domain/entities/users_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()
class UsersModel {
  final String namaDepan;
  final String namaBelakang;
  final String email;
  final int tglLahir;
  final int noHp;
  final String? password;

  UsersModel({
    required this.namaDepan,
    required this.namaBelakang,
    required this.email,
    required this.tglLahir,
    required this.noHp,
    this.password,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);

  UsersEntity toEntity() {
    return UsersEntity(
      namaDepan: namaDepan,
      namaBelakang: namaBelakang,
      email: email,
      tglLahir: tglLahir,
      noHp: noHp,
    );
  }
}
