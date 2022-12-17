import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/resources/FirebaseMethods.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';

import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';

import '../../resources/FirebaseRepository.dart';

class add_gallery extends StatefulWidget {
  const add_gallery({Key? key}) : super(key: key);

  @override
  State<add_gallery> createState() => _add_galleryState();
}

class _add_galleryState extends State<add_gallery> {
  List<XFile>? imageFileList = [];
  final FirebaseMethods _firebaseMethods = FirebaseMethods();
  final user = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore db = FirebaseFirestore.instance;

  bool isLoadingNow = false;
  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  void selectImages() async {
    print("in select image");
    final selectedImaged = await ImagePicker().pickMultiImage();
    print("picked image");
    print(selectedImaged);
    if (selectedImaged.length > 8) {
      utils.flushBarErrorMessage("only 8 pictures are allowed", context);
    } else if (selectedImaged.isNotEmpty) {
      imageFileList!.addAll(selectedImaged);
      setState(() {
        imageFileList;
      });
      print("pictures list");
      print(imageFileList!.length);
    } else {
      utils.flushBarErrorMessage("Pictures not selected", context);
    }

    print(imageFileList!.length);
    print("selected image is empty");
    // setState(() {});
  }

  void saveImagestoFireStore() async {
    if (imageFileList!.isEmpty) {
      utils.flushBarErrorMessage("Pictures not selected", context);
    } else if (imageFileList!.length < 8) {
      utils.flushBarErrorMessage("select atleast 8 pictures", context);
    } else if (imageFileList!.length > 8) {
      utils.flushBarErrorMessage("only 8 pictures are allowed", context);
    } else {
      isLoading(true);
      utils.toastMessage("Please wait it may take somoe time");
      List<String> listOfImages = await _firebaseMethods.uploadHostelsImage(
          imageFile: imageFileList!, uid: user);
      // print("list of hostel images");
      // print(listOfImages);

      db.collection("hostels").doc(user).update({
        'pictures': listOfImages,
        'visits':0,
      });
    }
    isLoading(false);
    Navigator.popAndPushNamed(context, RoutesName.publish_ad_screen);
  }

  bool onClick = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: custom_appbar(),
        // backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              child: Container(
                width: 428.w,
                height: 812.h,
                decoration: auth_screens_decor(),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45.h,
                      ),
                      Text(
                        'Add Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 26.sp),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Container(
                        height: 370.h,
                        width: 387.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: imageFileList!.isEmpty
                            ? browse_button()
                            : Column(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: GridView.builder(
                                        itemCount: imageFileList!.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3),
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Image.file(
                                            File(imageFileList![index].path),
                                            fit: BoxFit.cover,
                                          );
                                        }),
                                  ))
                                ],
                              ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '*  Only PNG,JPG  with max size of 12 MB ',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      // ImageVideoComponent(),
                      SizedBox(
                        height: 6.h,
                      ),
                      // Container(
                      //     alignment: Alignment.centerLeft,
                      //     child: RichText(
                      //         text: TextSpan(
                      //       children: [
                      //         TextSpan(
                      //           text: '*  Video with max size of 12 MB \n',
                      //           style: TextStyle(
                      //               fontSize: 15.sp,
                      //               fontWeight: FontWeight.w300,
                      //               color: Colors.black),
                      //         ),
                      //         TextSpan(
                      //             text: '*  Please refer to ',
                      //             style: TextStyle(
                      //                 fontSize: 15.sp,
                      //                 fontWeight: FontWeight.w300,
                      //                 color: Colors.black)),
                      //         TextSpan(
                      //             text: 'Video Guidelines',
                      //             style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontSize: 15.sp,
                      //                 fontWeight: FontWeight.bold,
                      //                 decoration: TextDecoration.underline))
                      //       ],
                      //     ))),
                      SizedBox(
                        height: 76.h,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // onClick = true;
                                // onClick ? onClick = true : onClick = false;
                                onClick = !onClick;
                              });
                            },
                            child: Container(
                              width: 21.w,
                              height: 21.h,
                              decoration: BoxDecoration(
                                color: onClick
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                border: Border.all(
                                    color: onClick
                                        ? AppColors.primaryColor
                                        : Colors.black),
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                              child: Icon(
                                Icons.check,
                                color: onClick ? Colors.white : Colors.black,
                                size: 13.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By checking this you agree to our ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      isLoadingNow
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: circle_progress())
                          : InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(left: 200.w),
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  height: 67.h,
                                  width: 157.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Publish',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.sp),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: saveImagestoFireStore,
                            )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column browse_button() {
    return Column(
      children: [
        SizedBox(
          height: 42.h,
        ),
        Icon(
          Icons.file_upload_outlined,
          color: AppColors.primaryColor,
          size: 50,
        ),
        SizedBox(
          height: 12.h,
        ),
        InkWell(
          onTap: () {
            selectImages();
          },
          child: Container(
              height: 67.h,
              width: 157.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.primaryColor,
              ),
              child: Center(
                  child: Text(
                'Browse',
                style: TextStyle(color: Colors.white, fontSize: 17.sp),
              ))),
        ),
      ],
    );
  }
}
