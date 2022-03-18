import 'dart:developer';

import 'package:aksana_getx/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NetworkAuth {
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<void> register(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  Future<void> addUser({required UserModel user}) async {
    try {
      user.uid = firebaseAuth.currentUser!.uid;
      await firestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .set(user.toFirestore());
    } catch (e) {
      log(e.toString());
      throw e;
    }
  }
}
