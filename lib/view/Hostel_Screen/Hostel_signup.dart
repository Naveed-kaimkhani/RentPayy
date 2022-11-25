import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import '../../components/auth_screens_decor.dart';
import '../../components/mini_Button.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/storage_service_hostel.dart';
import 'package:rentpayy/view/Hostel_Screen/Hostel_Registration.dart';

import '../../components/upper_design.dart';
import '../../resources/FirebaseRepository.dart';
import 'package:rentpayy/utils/utils.dart';

class Hostel_Signup extends StatefulWidget {
  const Hostel_Signup({Key? key}) : super(key: key);

  @override
  State<Hostel_Signup> createState() => _Hostel_SignupState();
}

class _Hostel_SignupState extends State<Hostel_Signup> {
  final FirebaseRepository _firebaseRepository = FirebaseRepository();

  FocusNode nameFocusNode = FocusNode();
  FocusNode hosteladdrFocusNode = FocusNode();
  FocusNode hostelOwnernameFocusNode = FocusNode();
  FocusNode hostelOwnercontactFocusNode = FocusNode();
  FocusNode hostelOwnerEmailFocusNode = FocusNode();
  FocusNode hostelcontactFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmpasswordFocusNode = FocusNode();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _hostelcontactController = TextEditingController();
  TextEditingController _chargesController = TextEditingController();
  TextEditingController _hostelOwnerphoneController = TextEditingController();
  TextEditingController _hostelOwnerEmailController = TextEditingController();
  TextEditingController _hosteladdressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _ChargesController = TextEditingController();

  bool isLoadingNow = false;
  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  void _signup(hostelModel hostelModel,context) {
    _firebaseRepository
        .signUp(
      _hostelOwnerEmailController.text,
      _passwordController.text,
      context,
    )
        .then((User? user) async {
      if (user != null) {
        hostelModel.uid = user.uid;
        print("user created");
        print(user.uid);
        _saveHostel(hostelModel);
      } else {
        isLoading(false);
        utils.flushBarErrorMessage('Failed to Signup', context);
      }
    }).catchError((error) {
      isLoading(false);
      utils.flushBarErrorMessage(error.message.toString(), context);
    });
  }

  void _validateFields() {
    if (

        // _workTypeController.text.trim().isEmpty &&
        _nameController.text.trim().isEmpty &&
            _hosteladdressController.text.trim().isEmpty &&
            _hostelcontactController.text.trim().isEmpty &&
            _chargesController.text.trim().isEmpty &&
            _hostelOwnerEmailController.text.trim().isEmpty &&
            _hostelOwnerphoneController.text.trim().isEmpty &&
            _passwordController.text.trim().isEmpty &&
            _confirmpasswordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your complete details', context);
    } else if (_nameController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your full name', context);
    } else if (_hosteladdressController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your full address', context);
    } else if (_hostelcontactController.text.length != 10) {
      utils.flushBarErrorMessage('Invalid hostel Phone Number', context);
    } else if (_chargesController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter the full name', context);
    } else if (_hostelOwnerEmailController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your email address', context);
    } else if (!EmailValidator.validate(_hostelOwnerEmailController.text)) {
      utils.flushBarErrorMessage('Invalid Email', context);
    } else if (_hostelOwnerphoneController.text.length != 10) {
      utils.flushBarErrorMessage('Invalid owner phone number', context);
    } else if (_passwordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your password', context);
    } else if (_passwordController.text.length < 6) {
      utils.flushBarErrorMessage(
          'Password must be atleast 6 characters', context);
    } else if (_confirmpasswordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage(
          'Enter your password again to confirm', context);
    } else if (_passwordController.text != _confirmpasswordController.text) {
      utils.flushBarErrorMessage('Enter same password to confirm', context);
    } else {
      isLoading(true);
      hostelModel HostelModel = hostelModel(
          name: _nameController.text.trim(),
          hostel_address: _hosteladdressController.text.trim(),
          hostel_phone: _hostelcontactController.text.trim(),
          charges: int.parse(_chargesController.text),
          email: _hostelOwnerEmailController.text.trim(),
          owner_phone: _hostelOwnerphoneController.text.trim(),
          hostel_type: "",
          hostel_gender_type: "",
          total_capacity: 0,
          available_capacity: 0,
          person_per_room: 0,
          description: "");
 Navigator.push(context,
            MaterialPageRoute(builder: (context) => Hostel_Registration()));
      _signup(HostelModel,context);
    }
  }

  void _saveHostel(hostelModel hostelModels) {
    _firebaseRepository.saveHostelDataToFirestore(hostelModels).then((value) {
      storage_service_hostel.saveUser(hostelModels).then((value) {
        isLoading(false);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Hostel_Registration()));
      });
    }).catchError((error) {
      isLoading(false);
      utils.flushBarErrorMessage(error, context);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _hostelcontactController.dispose();
    _chargesController.dispose();
    _hostelOwnerphoneController.dispose();
    _hostelOwnerEmailController.dispose();
    _hosteladdressController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _ChargesController.dispose();

    super.dispose();
  }

  bool? obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: upper_design(),
        body: Stack(
          children: [
            Container(
              color: AppColors.primaryColor,
              child: Container(
                decoration: auth_screens_decor(),
                child: Padding(
                  padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 10.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 48.h,
                        ),
                        Text(
                          "Hostel Signup",
                          style: TextStyle(
                              fontSize: 26.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        inputfields(
                          hint_text: "Enter Hostel name",
                          currentNode: nameFocusNode,
                          focusNode: nameFocusNode,
                          nextNode: hosteladdrFocusNode,
                          controller: _nameController,
                          obsecureText: false,
                          onIconPress: () {
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Enter Hostel address",
                          currentNode: hosteladdrFocusNode,
                          focusNode: hosteladdrFocusNode,
                          nextNode: hostelcontactFocusNode,
                          controller: _hosteladdressController,
                          obsecureText: false,
                          onIconPress: () {
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "3XXXXXXXXX",
                          currentNode: hostelcontactFocusNode,
                          focusNode: hostelcontactFocusNode,
                          nextNode: hostelOwnernameFocusNode,
                          controller: _hostelcontactController,
                          keyboardType: TextInputType.number,
                          preicon: Container(
                            width: 60.w,
                            height: 60.h,
                            child: Row(
                              children: [
                                Text(
                                  " +92",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color:
                                          Color.fromARGB(255, 120, 111, 111)),
                                ),
                                VerticalDivider(
                                  thickness: 2,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                          obsecureText: false,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Charges/month",
                          currentNode: hostelOwnernameFocusNode,
                          focusNode: hostelOwnernameFocusNode,
                          nextNode: hostelOwnerEmailFocusNode,
                          controller: _chargesController,
                          obsecureText: false,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Enter your Email address",
                          currentNode: hostelOwnerEmailFocusNode,
                          focusNode: hostelOwnerEmailFocusNode,
                          nextNode: hostelOwnercontactFocusNode,
                          controller: _hostelOwnerEmailController,
                          obsecureText: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "3XXXXXXXXX",
                          currentNode: hostelOwnercontactFocusNode,
                          focusNode: hostelOwnercontactFocusNode,
                          nextNode: passwordFocusNode,
                          controller: _hostelOwnerphoneController,
                          keyboardType: TextInputType.number,
                          preicon: Container(
                            width: 60.w,
                            height: 60.h,
                            child: Row(
                              children: [
                                Text(
                                  "+92",
                                  style: TextStyle(fontSize: 17.sp),
                                ),
                                VerticalDivider(
                                  thickness: 2,
                                  color: Color.fromARGB(255, 120, 111, 111),
                                ),
                              ],
                            ),
                          ),
                          obsecureText: false,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Set Password",
                          currentNode: passwordFocusNode,
                          focusNode: passwordFocusNode,
                          nextNode: confirmpasswordFocusNode,
                          controller: _passwordController,
                          obsecureText: true,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                            hint_text: "Confirm Password",
                            currentNode: confirmpasswordFocusNode,
                            focusNode: confirmpasswordFocusNode,
                            nextNode: confirmpasswordFocusNode,
                            controller: _confirmpasswordController,
                            icon: obsecureText!
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                            obsecureText: obsecureText!,
                            onIconPress: () {
                              setState(() {
                                obsecureText = !obsecureText!;
                              });
                            }),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: isLoadingNow
                              ? circle_progress()
                              : MiniButton(
                                  text: 'Next',
                                  func: () {
                                    setState(() {
                                      _validateFields();
                                    });
                                  },
                                  color: AppColors.primaryColor,
                                  icon: Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
