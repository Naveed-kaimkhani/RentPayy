
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:rentpayy/utils/Strings.dart';

import '../model/UserModel.dart';

class FirebaseMethods{
    final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
 static final CollectionReference _userCollection = firestore.collection(USERS_COLLECTION);

  Reference _storageReference = FirebaseStorage.instance.ref();

    Future<User?> signUp(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  }
 Future<void> saveUserDataToFirestore(UserModel userModel) async {
    await _userCollection.doc(userModel.uid).set(userModel.toMap(userModel));
  }

    Future<User?> login(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  
  Future<String> uploadProfileImage(
      {required Uint8List? imageFile, required String uid}) async {
    await _storageReference
        .child('profile_images')
        .child(uid)
        .putData(imageFile!);
    String downloadURL =
        await _storageReference.child('profile_images/$uid').getDownloadURL();
    return downloadURL;
  }

    Future<UserModel> getUserDetails(String? uid) async {
    DocumentSnapshot documentSnapshot = await _userCollection.doc(uid).get();
    UserModel userModel =
        UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    return userModel;
  }
}