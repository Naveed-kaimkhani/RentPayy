import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/components/upper_design.dart';
import 'package:rentpayy/utils/utils.dart';
import '../../components/authButton.dart';
import '../../model/UserModel.dart';
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
  bool  isLoadingNow = false;
  Uint8List? _profileImage;
  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  List<Gender> genders = <Gender>[];

  FirebaseAuth auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection('users');

  // void _validateFields(){
  //   if(_nameController.text.trim().isEmpty && _phoneController.text.trim().isEmpty){
  //     utils.flushBarErrorMessage('Please Enter your Details', context);
  //   }
  //   if(_nameController.text.trim().isEmpty){
  //     utils.flushBarErrorMessage('Enter Your Name', context);
  //   }
  //   else if(_phoneController.text.trim().isEmpty){
  //     utils.flushBarErrorMessage('Enter Your Number', context);
  //   }
  //   else if(_phoneController.text.length != 10){
  //     utils.flushBarErrorMessage('Invalid Phone Number', context);
  //   }
  // }

  Future<void> updateData(){
    final uid = auth.currentUser!.uid;
     return users.doc(uid).update({
       "name": _nameController.text,
       "phone": _phoneController.text,
       "age": _ageController.text,

       // "profile_image": _profileImage,
     }).then((value) => {
       utils.toastMessage('Profile Updated'),
       print('Data updated'),
     }).onError((error, stackTrace) => {
        utils.flushBarErrorMessage(error.toString(), context),
       print(error.toString()),
     });
  }


  
  @override
  Widget build(BuildContext context) {
    UserModel? user =
        Provider.of<UserDetailsProvider>(context, listen: false).userDetails;
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
                nextNode: ageFocusNode,
                controller: _phoneController,
                hint_text: user.phone,
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
                        //  color: Colors.white,
                        decoration: BoxDecoration(
                            color: AppColors.textfieldsColor,
                            borderRadius: BorderRadius.circular(7.r)),
                        // ignore: prefer_const_constructors
                        child: TextField(
                          // keyboardType: keyboardType,
                          controller: _ageController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
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
                  child: isLoadingNow ? circle_progress(): authButton(
                    func: () {
                      setState(() {
                        isLoadingNow = true;
                      });
                      Future.delayed(Duration(seconds: 3) , (){
                        setState(() {
                          isLoadingNow = false;
                        });
                      });

                   updateData();
                  },
                    text:  'Save Changes',
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
              // Image.network(
              //   "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
              //   height: 60,
              // ),
              Image.asset(
                "asset/avatar.png",
                height: 100.h,
                width: 100.w,
              ),
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
                      print("Image not loaded");
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
                    print("Image not loaded");
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
