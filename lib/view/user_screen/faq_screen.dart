import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/faq_component.dart';
import '../../components/hostel_appBarButton.dart';

import '../../utils/style/Images.dart';

class faq_screen extends StatefulWidget {
  const faq_screen({Key? key}) : super(key: key);

  @override
  State<faq_screen> createState() => _faq_screenState();
}

class _faq_screenState extends State<faq_screen> {
  // final bool _customIcon = false;
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
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              FAQComponent(
                text: 'Can a user post their ad?',
                Answer:
                    "Yes, a user can easily post their ads anytime they want. It’s just as easy as 1-2-3!",
              ),
              SizedBox(
                height: 10.h,
              ),
              FAQComponent(
                text: 'How many days to verify hostel?',
                Answer: "A hostel will be verified in less than 48-hours.",
              ),
              SizedBox(
                height: 10.h,
              ),
              FAQComponent(
                text: 'How many days a user can confirm its booking?',
                Answer:
                    "After booking, a user is given a 3-day countdown where they can visit the desired property and verify if its suitable for them or not.",
              ),
              SizedBox(
                height: 10.h,
              ),
              FAQComponent(
                text: 'How many days to verify hostel?',
                Answer: "A hostel will be verified in less than 48-hours.",
              ),
              SizedBox(
                height: 10.h,
              ),
              FAQComponent(
                text: 'How to pay??',
                Answer:
                    "You can pay through your Easypaisa account or by Jazz Cash.",
              ),
              SizedBox(
                height: 10.h,
              ),
              FAQComponent(
                text: 'How to contact?',
                Answer:
                    "You can call us on our helpline or email us on info.rentpayy@gmail.com",
              ),
              SizedBox(
                height: 10.h,
              ),
              FAQComponent(
                text:
                    'Is it okay if a booking is cancelled after the countdown?',
                Answer:
                    "After the countdown, if a booking is cancelled, then a deduction will be made by the company, that will increase on per day charges. The remaining amount will be returned to the user.",
              ),
              SizedBox(
                height: 10.h,
              ),
              FAQComponent(
                text: 'Is it safe to use this app?',
                Answer:
                    "Our app is perfectly safe to use. If you have any queries then you can contact us anytime.",
              )
            ],
          ),
        ),
      ),
    );
  }
}
