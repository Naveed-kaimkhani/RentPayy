import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/components/or_line_widget.dart';
import 'package:rentpayy/components/terms_and_condition.dart';
import 'package:rentpayy/resources/StorageService.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';

import '../../model/UserModel.dart';
import '../../model/hostelModel.dart';
import '../../resources/FirebaseRepository.dart';
import '../../utils/StorageServiceHostel.dart';
import '../../utils/style/Images.dart';
import '../../view_model/HostelDetailsProvider.dart';
import '../../view_model/UserDetailsProvider.dart';

class hostel_login extends StatefulWidget {
  hostel_login({super.key});

  @override
  State<hostel_login> createState() => _hostel_loginState();
}

class _hostel_loginState extends State<hostel_login> {
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

  void dispose() {
    // _firebaseRepository.dis
    _obsecurePassword.dispose();
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
        .then((User? user) {
      if (user != null) {
        print(user.displayName);
         _getHostelDetails(user.uid);
        // Navigator.pushNamed(context, RoutesName.SellerDashboard);
      } else {
        isLoading(false);
        //utils.flushBarErrorMessage("Failed to login", context);
      }
    });
  }

  void _getHostelDetails(String uid)async {
   print("user id");
    print(uid);
  await Provider.of<HostelDetailsProvider>(context, listen: false)
              .getHostelFromServer(uid,context);
          isLoading(false);
      Navigator.pushNamed(context, RoutesName.SellerDashboard);

    // _firebaseRepository.getHostelDetails(uid).then((hostelModel? hostel) {
    //   if (hostel != null) {
    //     StorageServiceHostel.saveHostel(hostel).then((value) {
    //     Provider.of<HostelDetailsProvider>(context, listen: false)
    //           .getHostelFromServer(uid,context);
    //       isLoading(false);
    //       Navigator.pushNamed(context, RoutesName.SellerDashboard);
    //     }).catchError((error) {
    //       utils.flushBarErrorMessage(error.message.toString(), context);
    //     });
    //   } else {
    //     utils.flushBarErrorMessage("User is null", context);
    //   }
    // }).catchError((error) {
    //   isLoading(false);
    //   utils.flushBarErrorMessage(error.message.toString(), context);
    // });
  }

  @override
  void initState() {
    super.initState();
    checkConnectivity() {}
    //Internet connectivity checker
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      // showSimpleNotification(connected
      //     ? Text("Connected To Internet")
      //     : Text("No Internet Connected"));
      // utils.flushBarErrorMessage(
      //     connected ? "Connected To Internet" : "No Internet Connection",
      //     context);
      // if (connected == false) {
      //   showDialog(
      //       barrierDismissible: false,
      //       context: context,
      //       builder: (context) => CupertinoAlertDialog(
      //             title: Text("No Internet Connection"),
      //             content: Text("Please check your Internet Connection"),
      //             actions: [
      //               CupertinoButton.filled(
      //                   child: Text("Retry"), onPressed: () {})
      //             ],
      //           ));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    "Login Hostel",
                    style:
                        TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 73.h,
                  ),
                  inputfields(
                    hint_text: " Email",
                    controller: _emailController,
                    focusNode: emailFocusNode,
                    icon: Icons.remove,
                    currentNode: emailFocusNode,
                    nextNode: passwordFocusNode,
                    obsecureText: false,
                    onIconPress: () {
                      _emailController.clear();
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  // inputfields(
                  //   hint_text: "  Password",
                  //   controller: _passController,
                  //   focusNode: passwordFocusNode,
                  //   icon: Icons.remove_red_eye,
                  //   currentNode: passwordFocusNode,
                  //   nextNode: passwordFocusNode,
                  //   obsecureText: _obsecureText,
                  //   onIconPress: onIconPress,
                  // ),
                  inputfields(
                      hint_text: "Password",
                      currentNode: passwordFocusNode,
                      focusNode: passwordFocusNode,
                      nextNode: passwordFocusNode,
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
                    height: 38.h,
                  ),
                  isLoadingNow
                      ? circle_progress()
                      : authButton(
                          text: "Login",
                          func: () {
                            _validateFields();
                          },
                          color: AppColors.primaryColor),
                  SizedBox(
                    height: 73.h,
                  ),
                  or_line_widget(),
                  Container(
                    width: 349.w,
                    height: 53.h,
                    child: Image.asset(
                      Images.google,
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Container(
                      width: 349.w,
                      height: 53.h,
                      child: Image.asset(Images.facebook)),
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
    );
  }

  void onIconPress() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
}
