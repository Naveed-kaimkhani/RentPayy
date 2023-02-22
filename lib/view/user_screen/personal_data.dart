import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/components/upper_design.dart';
import 'package:rentpayy/resources/FirebaseRepository.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/utils.dart';
import '../../components/authButton.dart';
import '../../components/profilePic.dart';
import '../../model/UserModel.dart';
import '../../resources/StorageService.dart';
import '../../utils/style/AppColors.dart';
import '../../view_model/UserDetailsProvider.dart';

class personal_data extends StatefulWidget {
  personal_data({Key? key}) : super(key: key);

  @override
  State<personal_data> createState() => _personal_dataState();
}

class _personal_dataState extends State<personal_data> {
  @override
  void initState() {
    _nameController.text = "";
    _nameController.selection = TextSelection.fromPosition(
        TextPosition(offset: _nameController.text.length));

    genders.add(new Gender("Male", false));
    genders.add(new Gender("Female", false));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    ageFocusNode.dispose();
    _phoneController.dispose();
    _ageController.dispose();
  }

  bool isLoadingNow = false;
  Uint8List? _profileImage;
  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  List<Gender> genders = <Gender>[];

  final FirebaseRepository _firebaseRepository = FirebaseRepository();
  final users = FirebaseFirestore.instance.collection('users');
  UserModel? user;
  Future<String> updateProfile() async {
    String profileUrl = await _firebaseRepository.uploadProfileImage(
        imageFile: _profileImage!, uid: utils.getCurrentUserUid());
    return profileUrl;
  }

  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  Future<void> updateData() {
    final uid = utils.getCurrentUserUid();
    if (_profileImage != null) {
      updateProfile()
          .then((url) => {
                users.doc(uid).update({
                  "profile_image": url,
                }),
                debugPrint('Data updated'),
              })
          .onError((error, stackTrace) => {
                utils.flushBarErrorMessage(error.toString(), context),
                isLoading(false),
              });
    }

    return users
        .doc(uid)
        .update({
          "name": _nameController.text,
          "phone": _phoneController.text,
          "age": _ageController.text,
        })
        .then((value) => {
              isLoading(false),
              utils.toastMessage('Profile Updated'),
            })
        .onError((error, stackTrace) => {
              isLoading(false),
              utils.flushBarErrorMessage(error.toString(), context),
            });
  }

  Future<void> _getUserDetails(String uid) async {
    //  isLoading(true);
    FirebaseRepository _firebaseRepository = FirebaseRepository();
    _firebaseRepository.getUserDetails(uid).then((UserModel? userModel) {
      if (userModel != null) {
        StorageService.saveUser(userModel).then((value) async {
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getUserLocally();
          Navigator.pushNamed(context, RoutesName.navigation);
        }).catchError((error) {
          isLoading(false);
          utils.flushBarErrorMessage(error.message.toString(), context);
        });
      } else {
        isLoading(false);
        utils.flushBarErrorMessage("User is null", context);
      }
    }).catchError((error) {
      isLoading(false);
      // isLoading(false);
      utils.flushBarErrorMessage(error.message.toString(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserDetailsProvider>(context, listen: false).userDetails;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: upper_design(
        needcolor: false,
        needicon: true,
        isUserDelete: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Personal Data",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    UploadProfile(_profileImage),
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Text(
                "Your Name",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 7.h,
              ),
              inputfields(
                currentNode: nameFocusNode,
                focusNode: nameFocusNode,
                nextNode: phoneFocusNode,
                hint_text: user!.name!,
                controller: _nameController,
              ),
              SizedBox(
                height: 11.h,
              ),
              Text(
                "Phone",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 7.h,
              ),
              inputfields(
                currentNode: phoneFocusNode,
                focusNode: phoneFocusNode,
                keyboardType: TextInputType.number,
                nextNode: ageFocusNode,
                controller: _phoneController,
                hint_text: user!.phone,
                preicon: Container(
                  width: 60.w,
                  height: 60.h,
                  child: Row(
                    children: [
                      Text(
                        "  +92",
                        style: TextStyle(fontSize: 17.sp),
                      ),
                      VerticalDivider(
                        thickness: 2.r,
                        color: Colors.grey.shade700,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Container(
                        height: 160.h,
                        width: 140.w,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: genders.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  genders.forEach(
                                      (gender) => gender.isSelected = false);
                                  genders[index].isSelected = true;
                                });
                              },
                              child: CustomRadio(genders[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Container(
                        height: 59.h,
                        width: 136.w,
                        decoration: BoxDecoration(
                            color: AppColors.textfieldsColor,
                            borderRadius: BorderRadius.circular(7.r)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _ageController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: user!.age,
                            contentPadding: EdgeInsets.all(12),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.r),
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1.0),
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 112, 102, 102),
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 160.h,
              ),
              Center(
                  child: isLoadingNow
                      ? circle_progress()
                      : authButton(
                          func: () async {
                            utils.checkConnectivity(context);
                            isLoading(true);
                            await updateData();
                            await _getUserDetails(
                                FirebaseAuth.instance.currentUser!.uid);
                            isLoading(false);
                          },
                          text: 'Save Changes',
                          color: AppColors.primaryColor,
                        )),
            ],
          ),
        ),
      ),
    );
  }

  Widget UploadProfile(Uint8List? image) {
    return image == null
        ? Stack(
            children: [
              profilePic(url: user!.profileImage, height: 100.h, width: 100.w),

              Positioned(
                left: 45.w,
                bottom: 0.h,
                child: IconButton(
                  onPressed: () async {
                    Uint8List? _image = await utils.PickImage();
                    if (_image != null) {
                      setState(() {
                        _profileImage = _image;
                      });
                    } else {
                      debugPrint("Image not loaded");
                    }
                  },
                  icon: Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      child: Image.asset('asset/gallery.png'),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              CircleAvatar(
                minRadius: 50.r,
                maxRadius: 50.r,
                child: ClipOval(
                    child: Image.memory(
                  image,
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.cover,
                )),
                // child: ,
              ),
              Positioned(
                left: 45.w,
                bottom: 0.h,
                child: IconButton(
                  onPressed: () async {
                    Uint8List? _image = await utils.PickImage();
                    if (_image != null) {
                      setState(() {
                        image = _image;
                      });
                    }
                    debugPrint("Image not loaded");
                  },
                  icon: Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      child: Image.asset('asset/gallery.png'),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

class Gender {
  String name;
  bool isSelected;
  Gender(this.name, this.isSelected);
}

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.textfieldsColor,
          borderRadius: BorderRadius.circular(7.r)),
      height: 46,
      width: 136,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8.w,
          ),
          Container(
            height: 27.h,
            width: 27.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                border: Border.all(
                  width: 1,
                  color: _gender.isSelected ? Colors.transparent : Colors.black,
                ),
                color: _gender.isSelected
                    ? AppColors.primaryColor
                    : Colors.transparent),
            child: Center(
              child: Icon(Icons.check,
                  size: 19.sp,
                  color: _gender.isSelected ? Colors.white : Colors.black),
            ),
          ),
          SizedBox(
            width: 14.w,
          ),
          Text(
            _gender.name,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
