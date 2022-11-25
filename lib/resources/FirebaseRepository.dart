
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/resources/FirebaseMethods.dart';

import '../model/UserModel.dart';

class FirebaseRepository{
    FirebaseMethods _firebaseMethods = FirebaseMethods();
    
Future<User?> signUp(String email, String password,context) =>

      _firebaseMethods.signUp(email, password,context);

  Future<String> uploadProfileImage(
          {required Uint8List imageFile, required String uid}) =>
      _firebaseMethods.uploadProfileImage(imageFile: imageFile, uid: uid);

    Future<void> saveUserDataToFirestore(UserModel userModel) =>
      _firebaseMethods.saveUserDataToFirestore(userModel);

         Future<void> addToFavourites(hostelModel hostel) =>
      _firebaseMethods.addToFavourites(hostel);
 
    Future<void> saveHostelDataToFirestore(hostelModel hostelModel) =>
        _firebaseMethods.saveHostelDataToFirestore(hostelModel);

    Future<User?> login(String email, String password,context)=>
      _firebaseMethods.login(email, password, context);    

    Future<UserModel> getUserDetails(String? uid) =>
      _firebaseMethods.getUserDetails(uid);
}