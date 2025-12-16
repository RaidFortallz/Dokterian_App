// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
  namaDepan: json['namaDepan'] as String,
  namaBelakang: json['namaBelakang'] as String,
  email: json['email'] as String,
  tglLahir: (json['tglLahir'] as num).toInt(),
  noHp: (json['noHp'] as num).toInt(),
  password: json['password'] as String?,
);

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'namaDepan': instance.namaDepan,
      'namaBelakang': instance.namaBelakang,
      'email': instance.email,
      'tglLahir': instance.tglLahir,
      'noHp': instance.noHp,
      'password': instance.password,
    };
