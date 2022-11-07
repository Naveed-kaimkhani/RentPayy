import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/Strings.dart';
import 'package:rentpayy/utils/utils.dart';
import '../model/UserModel.dart';

class FirebaseMethods {
  // CollectionReference
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final CollectionReference _userCollection =
      firestore.collection(USERS_COLLECTION);

  static final CollectionReference _hostelCollection =
      firestore.collection(HOSTEL_COLLECTION);

  Reference _storageReference = FirebaseStorage.instance.ref();
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
// UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      print(e);
      // utils.flushBarErrorMessage(message, context)
    }
  }

  Future<void> saveUserDataToFirestore(UserModel userModel) async {
    await _userCollection.doc(userModel.uid).set(userModel.toMap(userModel));
  }

  Future<void> saveHostelDataToFirestore(hostelModel hostelModel) async {
    await _hostelCollection.doc(hostelModel.uid).set(
          hostelModel.toMap(hostelModel),
        );
    print("user created in firebase");
  }

  Future<User?> login(String email, String password, context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      utils.flushBarErrorMessage("Invalid email or password", context);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> listupdate(List list) async {
    List<Map<String, dynamic>> result = <Map<String, dynamic>>[];
    list.forEach((item) {
      result.add(item.toJson());
    });
  }

  // Future<String> uploadProfileImage(
  //     {required Uint8List imageFile, required String uid}) async {
  //   await _storageReference
  //       .child('profile_images')
  //       .child(uid)
  //       .putFile(imageFile);
  //   String downloadURL =
  //       await _storageReference.child('profile_images/$uid').getDownloadURL();
  //   return downloadURL;
  // }

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

  Future<List<String>> uploadHostelsImage(
      {required List<XFile> imageFile, required String uid}) async {
    int id = 1;
    List<String> listOfHoselImages = [];
    for (var element in imageFile) {
      await _storageReference
          .child('hostel_images')
          .child(uid)
          .child(id.toString())
          .putFile(File(element.path));
      ;
      String downloadURL = await _storageReference
          .child('hostel_images/$uid/${id}')
          .getDownloadURL();
      listOfHoselImages.add(downloadURL);
      id++;
    }
    return listOfHoselImages;
  }

  Future<UserModel> getUserDetails(String? uid) async {
    DocumentSnapshot documentSnapshot = await _userCollection.doc(uid).get();
    UserModel userModel =
        UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    return userModel;
  }

  // Future<void> uploadHostelImages(List<XFile> imageList, String uid)async{
  //   for (var image in imageList) {
  //     await _storageReference
  //       .child('HostelsImages')
  //       .child(uid).child(path.b)
  //   }
  // }
}
