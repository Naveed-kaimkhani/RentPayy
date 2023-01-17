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

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<User?> signUp(String email, String password, context) async {
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

  Future<void> removeFromFavourites(String hostel_id) async {
    await _favoritesCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("user_fav")
        .doc(hostel_id)
        .delete();

    utils.toastMessage("Removed from Favorites");
  }

  Future<void> saveHostelDataToFirestore(hostelModel hostelModel) async {
    await _hostelCollection.doc(hostelModel.uid).set(
          hostelModel.toMap(hostelModel),
        );
  }
  Future<void> addToFavourites(hostelModel hostel) async {
    print(FirebaseAuth.instance.currentUser!.uid);
    await _favoritesCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("user_fav")
        .doc(hostel.uid)
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

  Future<hostelModel> getHostelDetails(String? uid) async {
    DocumentSnapshot documentSnapshot = await _hostelCollection.doc(uid).get();
    hostelModel hostel =
        hostelModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    return hostel;
  }

  static Future<List<hostelModel>> getHostelsData() async {
    List<hostelModel> hostelModels = [];
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection("hostels").get();
    // print(snap.docs.length);
    for (var i = 0; i < snap.docs.length; i++) {
      DocumentSnapshot docsSnap = snap.docs[i];

      hostelModel model = hostelModel.fromJson(docsSnap.data() as dynamic);
      //print(model.Category);
      if (model.pictures != null) {
        hostelModels.add(model);
      }
    }
    return hostelModels;
  }

  static Future<void> delete_User(context) async {
    FirebaseFirestore db = utils.getFireStoreInstance();
    String uid = utils.getCurrentUserUid();
    await db.collection("hostels").doc(uid).delete();
// mRef.child(FirebaseAuth.getInstance().currentUser.uid).remove().addO  nSuccessListener { FirebaseAuth.getInstance().currentUser!!.delete().addOnCompleteListener { //Go to login screen } }                    user.delete();
    try {
      await utils.getCurrentUser().delete();
    } catch (e) {
      utils.flushBarErrorMessage("can't delete user", context);
      // print(e);
    }
  }

  static Future<List<hostelModel>> getHostelByCategory(
      {required String query}) async {
    List<hostelModel> hostelModels = [];
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection("hostels")
        .where("name", isEqualTo: query)
        .get();
    for (var i = 0; i < snap.docs.length; i++) {
      DocumentSnapshot docsSnap = snap.docs[i];

      hostelModel model = hostelModel.fromJson(docsSnap.data() as dynamic);
      hostelModels.add(model);
    }
    return hostelModels;
  }
}
