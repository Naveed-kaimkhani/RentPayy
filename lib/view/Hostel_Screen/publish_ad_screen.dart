import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/style/Images.dart';
import 'package:rentpayy/utils/utils.dart';

import '../../view_model/HostelDetailsProvider.dart';

class publish_ad_screen extends StatefulWidget {
  const publish_ad_screen({Key? key}) : super(key: key);

  @override
  State<publish_ad_screen> createState() => _publish_ad_screenState();
}

class _publish_ad_screenState extends State<publish_ad_screen> {
  Future<void> _getHostelDetails(String uid, context) async {
    // final FirebaseRepository _firebaseRepository = FirebaseRepository();
    await Provider.of<HostelDetailsProvider>(context, listen: false)
        .getHostelFromServer(uid, context);
    isLoading(false);
    Navigator.pushNamed(context, RoutesName.SellerDashboard);
  }

  bool isLoadingNow = false;
  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 230.h,
              ),
              Image.asset(Images.checkImage),
              SizedBox(
                height: 14.h,
              ),
              Text(
                'Success!',
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Your ad is successfully published on our ',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
              Text(
                'application',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
              SizedBox(
                height: 26.h,
              ),
              isLoadingNow
                  ? circle_progress()
                  : authButton(
                      text: 'Go to home',
                      func: () async {
                        // utils.flushBarErrorMessage("Please Wait", context);
                        utils.toastMessage("Please Wait");
                        // SharedPreferences preferences =
                        //     await SharedPreferences.getInstance();
                        // await preferences.setInt('isSeller', 1);

                        String uid = FirebaseAuth.instance.currentUser!.uid;
                        isLoading(true);
                        _getHostelDetails(uid, context);
                      },
                      color: AppColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
