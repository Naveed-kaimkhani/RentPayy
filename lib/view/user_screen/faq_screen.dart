import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/faq_component.dart';
import '../../components/hostel_appBarButton.dart';
import '../../components/upper_design.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/Images.dart';

class faq_screen extends StatefulWidget {
  const faq_screen({Key? key}) : super(key: key);

  @override
  State<faq_screen> createState() => _faq_screenState();
}

class _faq_screenState extends State<faq_screen> {
  final bool _customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'FAQs',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: hostel_appBarButton(
            Buttoncolor: Colors.white,
            IconUrl: Images.yellowBackIcon,
          ),
          // SvgPicture.asset('asset/backIcon.png')
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w , right: 15.w),
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              FAQComponent(text: 'Can a user post their ad?',),
              SizedBox(height: 10.h,),
              FAQComponent(text: 'How many days to verify hostel?',),
              SizedBox(height: 10.h,),
              FAQComponent(text: 'Can a user post their ad?',),
              SizedBox(height: 10.h,),
              FAQComponent(text: 'How many days to verify hostel?',),
              SizedBox(height: 10.h,),
              FAQComponent(text: 'Can a user post their ad?',),
              SizedBox(height: 10.h,),
              FAQComponent(text: 'How many days to verify hostel?',),
              SizedBox(height: 10.h,),
              FAQComponent(text: 'Can a user post their ad?',),
              SizedBox(height: 10.h,),
              FAQComponent(text: 'How many days to verify hostel?',)
            ],
          ),
        ),
      ),
    );
  }
}
