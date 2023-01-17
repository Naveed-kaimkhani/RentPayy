import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/upper_design.dart';
import 'package:rentpayy/navigation_page.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:rentpayy/view/Hostel_Screen/ads_details_screen.dart';
import '../../components/authButton.dart';
import '../../components/inputfields.dart';
import '../../components/profilePic.dart';
import '../../model/UserModel.dart';
import '../../model/hostelModel.dart';
import '../../view_model/HostelDetailsProvider.dart';
import '../../view_model/UserDetailsProvider.dart';

class update_password extends StatefulWidget {
  const update_password({Key? key}) : super(key: key);

  @override
  State<update_password> createState() => _update_passwordState();
}

class _update_passwordState extends State<update_password> {
  TextEditingController _passController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  bool _obsecureText = true;
  bool _obsecureText1 = true;
  bool isLoading = false;
  FocusNode passwordFocusNode = FocusNode();
  FirebaseAuth auth = FirebaseAuth.instance;

  void _validateFields() {
    if (_passController.text.trim().isEmpty &&
        _newPasswordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage("please Enter your Password", context);
    } else if (_passController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Please Enter Current password', context);}
      else if (_newPasswordController.text.length<6) {
      utils.flushBarErrorMessage('Password must be atleast 6 character long', context);
    } else if (_newPasswordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Please Enter New Password', context);
    }
  }

  void isLoadingg(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  void _changePassword() async {
    User user = utils.getCurrentUser();
    try {
      isLoadingg(true);
      final userr = (await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: user.email!, password: _passController.text))
          .user;
      print(userr);
      user
          .reauthenticateWithCredential(EmailAuthProvider.credential(
              email: user.email.toString(),
              password: _passController.text.toString()))
          .then((value) {
        user.updatePassword(_newPasswordController.text).then((value) {
          isLoadingg(false);
          utils.toastMessage("Password updated Successfully");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ads_details_screen()));
        }).onError((error, stackTrace) {
          isLoadingg(false);
          utils.flushBarErrorMessage(error.toString(), context);
        });
      }).onError((error, stackTrace) {
        isLoadingg(false);
        utils.flushBarErrorMessage(error.toString(), context);
      });
    } catch (e) {
      isLoadingg(false);
      utils.flushBarErrorMessage(e.toString(), context);
    }
  }

  @override
  void dispose() {
    _passController.dispose();
    _newPasswordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hostelModel? hostel =
        Provider.of<HostelDetailsProvider>(context, listen: false)
            .hostelDetails;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: upper_design(
        needcolor: false,
        needicon: true,
        isUserDelete: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 27.w, top: 28.h, right: 27.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  profilePic(
                    url: hostel!.pictures![0],
                    height: 63.h,
                    width: 63.w,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hostel.name!,
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 25.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Current Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              inputfields(
                  hint_text: "Current Password",
                  currentNode: null,
                  focusNode: null,
                  nextNode: null,
                  controller: _passController,
                  icon: _obsecureText
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  obsecureText: _obsecureText,
                  onIconPress: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  }),
              SizedBox(
                height: 25.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'New Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              inputfields(
                  hint_text: "New Password",
                  currentNode: null,
                  focusNode: null,
                  nextNode: null,
                  controller: _newPasswordController,
                  icon: _obsecureText1
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  obsecureText: _obsecureText1,
                  onIconPress: () {
                    setState(() {
                      _obsecureText1 = !_obsecureText1;
                    });
                  }),
              SizedBox(
                height: 50.h,
              ),
              Align(
                alignment: Alignment.center,
                child: isLoading
                    ? circle_progress()
                    : authButton(
                        text: 'Change Password',
                        color: AppColors.primaryColor,
                        func: () async {
                          FocusManager.instance.primaryFocus?.unfocus();

                          _validateFields();

                          _changePassword();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
