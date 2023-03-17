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
import 'package:rentpayy/resources/FirebaseRepository.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/hostelModel.dart';
import '../../utils/StorageServiceHostel.dart';

class add_gallery extends StatefulWidget {
  hostelModel hostel;
  add_gallery({Key? key, required this.hostel}) : super(key: key);

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
    final selectedImaged = await ImagePicker().pickMultiImage();

    if (selectedImaged.length > 8) {
      utils.flushBarErrorMessage("only 8 pictures are allowed", context);
    } else if (selectedImaged.length < 8) {
      utils.flushBarErrorMessage("select atleast 8 pictures", context);
    } else if (selectedImaged.isNotEmpty) {
      imageFileList!.addAll(selectedImaged);
      setState(() {
        imageFileList;
      });
    } else {
      utils.flushBarErrorMessage("Pictures not selected", context);
    }
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
      utils.toastMessage("Please wait it may take some time");

      List<String> listOfImages = await _firebaseMethods.uploadHostelsImage(
          imageFile: imageFileList!, uid: user);

      hostelModel Hostel = hostelModel(
        name: widget.hostel.name,
        uid: widget.hostel.uid,
        email: widget.hostel.email,
        charges: widget.hostel.charges,
        total_capacity: widget.hostel.total_capacity,
        // owner_phone: widget.hostel.owner_name,
        hostel_address: widget.hostel.hostel_address,
        hostel_phone: widget.hostel.hostel_phone,
        hostel_gender_type: widget.hostel.hostel_gender_type,
        hostel_type: widget.hostel.hostel_type,
        available_capacity: widget.hostel.available_capacity,
        person_per_room: widget.hostel.person_per_room,
        description: widget.hostel.description,
        facilities: widget.hostel.facilities,
        pictures: listOfImages,
        visits: 0,
        confirms: 0,
        bookings: 0,
        cancel: 0,
      );
      _saveHostel(Hostel);
    }
  }

  bool onClick = false;

  void _saveHostel(hostelModel hostelModels) {
    FirebaseRepository _firebaseRepository = FirebaseRepository();
    _firebaseRepository.saveHostelDataToFirestore(hostelModels).then((value) {
      StorageServiceHostel.saveHostel(hostelModels).then((value) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setInt('initScreen', 1);
        Navigator.popAndPushNamed(context, RoutesName.publish_ad_screen);
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) =>publish_ad_screen()));
      });
      isLoading(false);
    }).catchError((error) {
      isLoading(false);
      utils.flushBarErrorMessage(error, context);
    });
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
                          '*  Only PNG,JPG  with max size of 12 MB \n*  Please select 8 pictures',
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

                      SizedBox(
                        height: 76.h,
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
