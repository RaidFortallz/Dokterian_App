import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doct_app/features/auth/data/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseDatasource {
  Future<UsersModel> register({
    required String email,
    required String password,
    required UsersModel user,
  });

  Future<UsersModel> login({required String email, required String password});
}

class AuthFirebaseDatasourceImpl implements AuthFirebaseDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthFirebaseDatasourceImpl({required this.auth, required this.firestore});

  @override
  Future<UsersModel> login({
    required String email,
    required String password,
  }) async {
    //ngambil akun di firebaseAuth
    final result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = result.user!.uid;

    //ngambil data user dari firestore
    final snapshot = await firestore.collection('users').doc(uid).get();

    return UsersModel.fromJson(snapshot.data()!);
  }

  @override
  Future<UsersModel> register({
    required String email,
    required String password,
    required UsersModel user,
  }) async {
    //buat akun di firebaseAuth
    final result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = result.user!.uid;

    //simpan data user ke firestore
    await firestore.collection('users').doc(uid).set(user.toJson()); 

    //balikin user model
    return user;
  }
}
