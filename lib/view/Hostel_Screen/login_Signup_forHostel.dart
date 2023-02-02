import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/model/UserModel.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/utils.dart';
import '../../components/authButton.dart';
import '../../components/auth_screens_decor.dart';
import '../../components/or_line_widget.dart';
import '../../components/terms_and_condition.dart';
import '../../components/upper_design.dart';
import '../../resources/FirebaseMethods.dart';
import '../../resources/FirebaseRepository.dart';
import '../../utils/style/AppColors.dart';

class login_Signup_forHostel extends StatefulWidget {
  login_Signup_forHostel({Key? key}) : super(key: key);

  @override
  State<login_Signup_forHostel> createState() => _login_Signup_forHostelState();
}

class _login_Signup_forHostelState extends State<login_Signup_forHostel> {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  final FirebaseRepository _firebaseRepository = FirebaseRepository();

  void handleGoogleSignIn() {
    // UserCredential authResult = await _firebaseMethods.signInWithGoogle();
    _firebaseMethods
        .signInWithGoogle()
        .then((authResult) => () {
              var user = authResult.user;
              if (user != null) {
                _firebaseRepository
                    .saveUserDataToFirestore(UserModel(
                      uid: user.uid,
                      email: user.email,
                      name: user.displayName,
                      profileImage: user.photoURL,
                      phone: user.phoneNumber,
                      gender: '',
                      age: '',
                    ))
                    .then((value) => () {
                          Navigator.pushNamed(context, RoutesName.homeScreen);
                        })
                    .catchError((error) {
                  utils.flushBarErrorMessage(error.message.toString(), context);
                });
              } else {
                utils.flushBarErrorMessage("user null", context);
              }
            })
        .catchError((error) {
      utils.flushBarErrorMessage(error.message.toString(), context);
    });
    // var user=authResult.user;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: upper_design(
          needcolor: true,
          needicon: true,
          isUserDelete: false,
        ),
        backgroundColor: AppColors.primaryColor,
        body: Container(
          color: AppColors.primaryColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: auth_screens_decor(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 39,
                  ),
                  Container(
                      height: 52.86.h,
                      width: 135.w,
                      child: Image.asset('asset/splash.png')),
                  // EdgeInsets.symmetric(horizontal: 54.w, vertical: 170.h),
                  SizedBox(
                    height: 76.14.h,
                  ),
                  authButton(
                    text: "Login",
                    color: Colors.black,
                    func: () {
                      Navigator.pushNamed(context, RoutesName.hostel_login);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  authButton(
                    text: "Sign Up",
                    color: AppColors.primaryColor,
                    func: () {
                      Navigator.pushNamed(context, RoutesName.Hostel_Signup);
                    },
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  // or_line_widget(),

                  SizedBox(
                    height: 58.h,
                  ),
                  // terms_and_conditions()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
