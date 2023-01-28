import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class booking_history extends StatelessWidget {
  const booking_history({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Payment History', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: Image.asset("asset/orangeBackIcon.png" , height: 32.h, width: 32.w,),
        ),
      ),
      body: ListView.builder(
         itemCount: 2,
          itemBuilder: (context , index){
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w , right: 16.w , top: 45),
                child: Container(
                  padding: EdgeInsets.only(left: 14.w, right: 19.w),
                  height: 150.h,
                  width: 396.w,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F7FF),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bakhtawar Hostel', style: TextStyle(fontSize: 20.sp , fontWeight: FontWeight.w500,),),
                      Text('04/05/2002', style: TextStyle(fontWeight: FontWeight.w300),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('asset/jazzcash.png'),
                          Text('200 Rs',style: TextStyle(color: AppColors.primaryColor , fontSize: 41 , fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),
                ),
              ) ,
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding:  EdgeInsets.only(right: 12.w, top: 25.h),
                  child: Container(
                    height: 32.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff2DD24E),
                    ),
                    child: Center(
                      child: Icon(Icons.check, color: Colors.white,size: 18,),
                    ),
                  ),
                ),
              ),
            ],
          );
      }),
    );
  }
}
