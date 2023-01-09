import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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
      // showSimpleNotification(connected?Text("Connected To Internet"):Text("No Internet Connected"));
      // utils.flushBarErrorMessage(
      //     connected ? "Connected To Internet" : "No Internet Connection",
      //     context);
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

  // static Future<File?> pickImage(ImageSource imageSource,
  //     [int quality = 85, double width = 500, double height = 500]) async {
  //   ImagePicker imagePicker = ImagePicker();
  //   var pickedFile = await (imagePicker.pickImage(
  //     source: imageSource,
  //     imageQuality: quality,
  //     maxHeight: height,
  //     maxWidth: width,
  //   ));
  //   if (pickedFile == null) return null;
  //   File imageFile = File(pickedFile.path);
  //   return await compressImage(imageFile);
  // }

  // static Future<File> compressImage(File imageToCompress) async {
  // //  imageToCompress.readAsBytes();
  //   print('size: ${imageToCompress.statSync().size}');
  //   return imageToCompress;
  // // }
  // static Future<File> compressImage({
  //   required File imagePathToCompress,
  //   quality: 100,
  //   percentage: 10,
  // }) async {
  //   var path = await FlutterNativeImage.compressImage(
  //     imagePathToCompress.absolute.path,
  //     quality: quality,
  //     percentage: 10,
  //   );
  //   return path;
  // }
//  Future<List<XFile>> compressHostelsImage(List<XFile> images)async{
// List<XFile> compressedList=[];
// for (var i = 0; i < images.length; i++) {
//    File image = File(images[i].path);
//       print(image.lengthSync() / 1024);
//       File compressedImage = await compressImage(
//           imagePathToCompress: image, quality: 100, percentage: 10);
//       print("after reducing size$compressedImage");
//       print(compressedImage.lengthSync() / 1024);
//       // return file.readAsBytes();
//       XFile file = new XFile(compressedImage.path);
//         compressedList.add(file);
// }//for end
//   return compressedList;
// }

  static Future<Uint8List?> PickImage() async {
    //    ImagePicker picker=ImagePicker();
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    print("before redusing size $file");
    if (file != null) {
      // File image = File(file.path);
      // print(image.lengthSync() / 1024);
      // File compressedImage = await compressImage(
      //     imagePathToCompress: image, quality: 100, percentage: 10);
      // print("after reducing size$compressedImage");
      // print(compressedImage.lengthSync() / 1024);
      return file.readAsBytes();
      // return compressedImage.readAsBytes();
    }
  }
static String getCurrentUserUid(){
  return FirebaseAuth.instance.currentUser!.uid;
}
static User getCurrentUser(){
  return FirebaseAuth.instance.currentUser!;
}

// Widget UploadImage1(Uint8List? image) {
//     return image == null
//         ? Padding(
//             padding: const EdgeInsets.only(top: 18.0),
//             child: Stack(
//               children: [
//                 // Image.network(
//                 //   "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
//                 //   height: 60,
//                 // ),
//                 Image.asset("asset/avatar.png"),
//                 IconButton(
//                     onPressed: () async {
//                       Uint8List? _image = await Utils().PickImage();
//                       if (_image != null) {
//                         setState(() {
//                           image1 = _image;
//                         });
//                       } else {
//                         print("Image not loaded");
//                       }
//                     },
//                     icon: Icon(Icons.upload)),
//               ],
//             ),
//           )
//         : Stack(
//             children: [
//               Image.memory(
//                 image1!,
//                 height: MediaQuery.of(context).size.height / 15,
//               ),
//               IconButton(
//                   onPressed: () async {
//                     Uint8List? _image = await Utils().PickImage();
//                     if (_image != null) {
//                       setState(() {
//                         image1 = _image;
//                       });
//                     }
//                     print("Image not loaded");
//                   },
//                   icon: Icon(Icons.upload)),
//             ],
//           );
//   } // for 1st image
}
