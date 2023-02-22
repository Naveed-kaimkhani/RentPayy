import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/components/terms_and_condition.dart';
import 'package:rentpayy/navigation_page.dart';
import 'package:rentpayy/resources/StorageService.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/UserModel.dart';
import '../../resources/FirebaseRepository.dart';
import '../../view_model/UserDetailsProvider.dart';
import '../forgot_password/forgot_password.dart';

class login_with_rentpayy extends StatefulWidget {
  login_with_rentpayy({super.key});

  @override
  State<login_with_rentpayy> createState() => _login_with_rentpayyState();
}

class _login_with_rentpayyState extends State<login_with_rentpayy> {
  TextEditingController _emailController = TextEditingController();

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _passController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();
  bool isLoadingNow = false;
  bool _obsecureText = true;
  final FirebaseRepository _firebaseRepository = FirebaseRepository();
  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  // bool _obsecureText = true;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  void dispose() {
    _emailController.dispose();
    _passController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _validateFields() {
    if (_emailController.text.trim().isEmpty &&
        _passController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your email and password', context);
      // showFailureDialog(context, 'Enter your email and password').show(context);
    } else if (_emailController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your email', context);
    } else if (_passController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your password', context);
    } else if (!EmailValidator.validate(_emailController.text)) {
      utils.flushBarErrorMessage('Invalid Email', context);
    } else {
      isLoading(true);
      _login();
    }
  }

  void _login() {
    _firebaseRepository
        .login(_emailController.text, _passController.text, context)
        .then((User? user) async {
      if (user != null) {
        _getUserDetails(user.uid);

        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setInt('isUser', 1);
      } else {
        isLoading(false);
        //utils.flushBarErrorMessage("Failed to login", context);
      }
    });
  }

  void _getUserDetails(String uid) {
    _firebaseRepository.getUserDetails(uid).then((UserModel? userModel) {
      if (userModel != null) {
        StorageService.saveUser(userModel).then((value) async {
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getUserLocally();
          isLoading(false);
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setInt('initScreen', 1);
          await preferences.setInt('isUser', 1);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => navigation_page()));
        }).catchError((error) {
          utils.flushBarErrorMessage(error.message.toString(), context);
        });
      } else {
        utils.flushBarErrorMessage("User is null", context);
        isLoading(false);
      }
    }).catchError((error) {
      isLoading(false);
      utils.flushBarErrorMessage(error.message.toString(), context);
    });
  }

  @override
  void initState() {
    super.initState();
    // ignore: unused_element
    utils.checkConnectivity(context);
  }

  void signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential.user != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => forgot_password()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: const custom_appbar(),
          body: Container(
            color: AppColors.primaryColor,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: auth_screens_decor(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 36.h,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 26.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 73.h,
                    ),
                    inputfields(
                      hint_text: "  Email",
                      controller: _emailController,
                      focusNode: emailFocusNode,
                      icon: Icons.remove,
                      currentNode: emailFocusNode,
                      nextNode: passwordFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      obsecureText: false,
                      onIconPress: () {
                        _emailController.clear();
                      },
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    inputfields(
                        hint_text: "Password",
                        currentNode: passwordFocusNode,
                        focusNode: passwordFocusNode,
                        nextNode: passwordFocusNode,
                        controller: _passController,
                        keyboardType: TextInputType.text,
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
                      height: 38.h,
                    ),
                    isLoadingNow
                        ? circle_progress()
                        : authButton(
                            text: "Login",
                            func: () {
                              FocusManager.instance.primaryFocus?.unfocus();

                              _validateFields();
                            },
                            color: AppColors.primaryColor),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forgot_password()));
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18.sp,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 73.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    terms_and_conditions()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onIconPress() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
}
