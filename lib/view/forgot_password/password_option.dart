import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/upper_design.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:rentpayy/view/user_screen/settings.dart';
import '../../components/authButton.dart';
import '../../components/inputfields.dart';
import '../../components/profilePic.dart';
import '../../model/UserModel.dart';
import '../../view_model/UserDetailsProvider.dart';

class password_option extends StatefulWidget {
  const password_option({Key? key}) : super(key: key);

  @override
  State<password_option> createState() => _password_optionState();
}

class _password_optionState extends State<password_option> {
  final _passController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool _obsecureText = true;
  bool _obsecureText1 = true;
  FocusNode passwordFocusNode = FocusNode();
  FirebaseAuth auth = FirebaseAuth.instance;

  void _validateFields() {
    if (_passController.text.trim().isEmpty &&
        _newPasswordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage("please Enter your Password fields", context);
    } else if (_passController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Please Enter Current password', context);
    } else if (_newPasswordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Please Enter New Password', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final current_user = auth.currentUser;
    UserModel? user =
        Provider.of<UserDetailsProvider>(context, listen: false).userDetails;
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
                  profilePic(url: user!.profileImage),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name!,
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 13.w,
                          ),
                          Icon(
                            Icons.location_on_outlined,
                            size: 14.h,
                          ),
                          // Image(image: AssetImage(Images.location)),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            'Jamshoro,Pakistan',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
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
                child: authButton(
                  text: 'Change Password',
                  color: AppColors.primaryColor,
                  func: () {
                    _validateFields();
                    // password update code
                    current_user!
                        .reauthenticateWithCredential(
                            EmailAuthProvider.credential(
                                email: current_user.email.toString(),
                                password: _passController.text.toString()))
                        .then((value) {
                      current_user
                          .updatePassword(_newPasswordController.text)
                          .then((value) {
                        utils.toastMessage("Password updated Successfully");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => setting_screen()));
                      }).onError((error, stackTrace) {
                        utils.flushBarErrorMessage(error.toString(), context);
                      });
                    }).onError((error, stackTrace) {
                       utils.flushBarErrorMessage(error.toString(), context);
                    });
                    // _passController.clear();
                    // _newPasswordController.clear();
                    // _confirmPassowrdController.clear();
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
