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

  static final CollectionReference _favoritesCollection =
      firestore.collection("favorites");

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

  Future<User?> signUp(String email, String password, context) async {
    // User? user=FirebaseAuth.instance.currentUser;
    // if (user==null) {
    //   try {
    //   UserCredential userCredential =
    //       await _auth.createUserWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    //   return userCredential.user;
    // } catch (e) {
    //   // print(e);
    //   utils.flushBarErrorMessage(e.toString(), context);
    // }
    // } else {
    //   return user;
    // }
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      // print(e);
      utils.flushBarErrorMessage(e.toString(), context);
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

  Future<void> addToFavourites(hostelModel hostel) async {
//  await FirebaseFirestore.instance.collection("favorites").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").doc(product.uid).set(product.getJson());
    // await _userCollection.doc(FirebaseAuth.instance.currentUser!.uid).collection("favorites").doc(hostel.uid).set(hostel.toMap(hostel));

    print(FirebaseAuth.instance.currentUser!.uid);
    await _favoritesCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(hostel.uid!)
        .doc("user_fav")
        .set(hostel.toMap(hostel));
    utils.toastMessage("Added to Favorites");
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

  //  static Future<void> AddToFav({required hostelModel hostel}) async{

  //     await FirebaseFirestore.instance.collection("Fav").doc(FirebaseAuth.instance.currentUser!.uid).collection(hostel.uid!).set(product.getJson());
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

  static Future<List<hostelModel>> getHostelsData() async {
    List<hostelModel> hostelModels = [];
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection("hostels").get();
    print(snap.docs.length);
    for (var i = 0; i < snap.docs.length; i++) {
      DocumentSnapshot docsSnap = snap.docs[i];

      hostelModel model = hostelModel.fromJson(docsSnap.data() as dynamic);
      //print(model.Category);
      hostelModels.add(model);
    }
    return hostelModels;
  }
}
