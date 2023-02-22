import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/components/or_line_widget.dart';
import 'package:rentpayy/components/terms_and_condition.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import '../../resources/FirebaseRepository.dart';
import '../../utils/routes/RoutesName.dart';
import '../../view_model/HostelDetailsProvider.dart';
import '../forgot_password/forgot_password.dart';

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
        _getHostelDetails(user.uid);
        // Navigator.pushNamed(context, RoutesName.SellerDashboard);
      } else {
        isLoading(false);
        //utils.flushBarErrorMessage("Failed to login", context);
      }
    });
  }

  void _getHostelDetails(String uid) async {
    hostelModel? hostel;
    hostel = await Provider.of<HostelDetailsProvider>(context, listen: false)
        .getHostelFromServer(uid, context);
    isLoading(false);
    if (hostel != null) {
      Navigator.pushNamed(context, RoutesName.SellerDashboard);
    }
  }

  @override
  void initState() {
    utils.checkConnectivity(context);
    super.initState();
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
                      "Hostel Login ",
                      style: TextStyle(
                          fontSize: 26.sp, fontWeight: FontWeight.w500),
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
                              FocusManager.instance.primaryFocus?.unfocus();

                              _validateFields();
                            },
                            color: AppColors.primaryColor),
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
