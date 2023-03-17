import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/no_internetConnection.dart';

class utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 4),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        // backgroundColor: const Color.fromARGB(255, 90, 89, 89),
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void checkConnectivity(context) {
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      if (connected == false) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const no_internetConnection(),
          ),
        );
        // return connected;
      }
    });
    // return true;
  }

  static Future<Uint8List?> PickImage() async {
    //    ImagePicker picker=ImagePicker();
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    print("before redusing size $file");
    if (file != null) {
      return file.readAsBytes();
    }
  }

  static String get currentUserUid => FirebaseAuth.instance.currentUser!.uid;

  static hideLoading() {
    Navigator.pop(dialogContext);
  }

  static late BuildContext dialogContext;
  static showLoading(context) {
    // showDialog(context: context, builder: builder)
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        dialogContext = context;
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: 100.h,
              width: 20.w,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: const [
                  circle_progress(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Uploading... ')
                ],
              ),
            ),
          ),
        );
        // Dialog(
        //   child: Container(
        //     height: 50.h,
        //     width: 50.w,
        //     color: Colors.white,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(

        //       )
        //     ),
        //     child: Column(
        //       children: [

        //       ],
        //     ),
        //   )
        // );
      },
    );
  }

  static FirebaseFirestore getFireStoreInstance() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db;
  }

  static User getCurrentUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  static Future<SharedPreferences> getPreferencesObject() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }
}
