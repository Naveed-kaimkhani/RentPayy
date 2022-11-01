import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/Strings.dart';

import '../model/UserModel.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final CollectionReference _userCollection =
      firestore.collection(USERS_COLLECTION);

  static final CollectionReference _hostelCollection =
  firestore.collection(HOSTEL_COLLECTION);

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

  Future<void> saveHostelDataToFirestore(hostelModel hostelModel) async {
    await _hostelCollection.doc(hostelModel.uid).set(hostelModel.toMap(hostelModel),);
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

  Future<void> listupdate(List list) async
  {
    List<Map<String,dynamic>> result =  <Map<String,dynamic>>[];
    list.forEach((item) {
      result.add(item.toJson());
    });
  }

  Future<String> uploadProfileImage(
      {required File imageFile, required String uid}) async {
    await _storageReference
        .child('profile_images')
        .child(uid)
        .putFile(imageFile);
    String downloadURL =
        await _storageReference.child('profile_images/$uid').getDownloadURL();
    return downloadURL;
  }
}
