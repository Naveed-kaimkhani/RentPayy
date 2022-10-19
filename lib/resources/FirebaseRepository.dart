
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentpayy/resources/FirebaseMethods.dart';

import '../model/UserModel.dart';

class FirebaseRepository{
    FirebaseMethods _firebaseMethods = FirebaseMethods();
    
Future<User?> signUp(String email, String password) =>
      _firebaseMethods.signUp(email, password);

  Future<String> uploadProfileImage(
          {required File imageFile, required String uid}) =>
      _firebaseMethods.uploadProfileImage(imageFile: imageFile, uid: uid);

    Future<void> saveUserDataToFirestore(UserModel userModel) =>
      _firebaseMethods.saveUserDataToFirestore(userModel);    
}